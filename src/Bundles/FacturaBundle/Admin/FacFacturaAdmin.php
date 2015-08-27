<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;


class FacFacturaAdmin extends Admin {

    protected function configureRoutes(RouteCollection $collection) {
        $collection
                //->remove('create')
                ->add('delete')
        //->remove('edit')
        ;
    }

    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('numero')
                ->add('idTipofactura')
                ->add('fecha')
                ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('id')
                ->add('numero')
                ->add('idTipofactura')
                ->add('fecha', 'date')
                ->add('idCliente')
                ->add('ventaTotal')
                ->add('_action', 'actions', array(
                    'actions' => array(
                        'show' => array(),
                        'edit' => array(),
                        'delete' => array(),
                    )
                ))
        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->tab('DATOS GENERALES')
                ->with('')
                ->add('idTipofactura', NULL, array(
                    'label' => 'Tipo de factura',
                    'empty_value' => '...Seleccione...',
                    'attr' => array(
                        'style' => 'width:300px'
                    ),))
                ->add('numero', null, array(
                    'label' => 'Numero de factura',
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                ))
                ->add('fecha', null, array(
                        'label' => 'Fecha de la venta',
                        'read_only' => TRUE,
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker now',
                            'style' => 'width:300px', 'maxlength' => '25'
                        )))
                ->add('idCliente','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Cliente',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar cliente',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
//                ->add('idCliente', NULL, array(
//                    'empty_value' => '...Seleccione...',
//                    'label' => 'Cliente',
//                ))
                ->add('idCondicionpago', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Condición de pago',
                    'attr' => array('style' => 'width:300px'),))
                ->add('idEmpleado', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Venta a cuenta',
                ))
//                ->add('idEstado','entity', array(
//                    'class'=>'BundlesCatalogosBundle:CtlEstado',
//                    'label'=>'Estado',
//                    'disabled'=>TRUE,
//                    'attr' => array('style'=>'width:300px'),))
                ->end()
                ->with('$')                    ->add('sumas', null, array(
                        'read_only' => TRUE,
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('iva', null, array(
                        'read_only' => TRUE,
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('subtotal', null, array(
                        'read_only' => TRUE,
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('ventaTotal', null, array(
                    'read_only' => TRUE,
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                ->end()
                ->end()
                ->tab('D E T A L L E')
                ->with('')
                ->add('facturaDetalle', 'sonata_type_collection', array(
                    'label' => 'Items'), array(
                    'edit' => 'inline',
                    'inline' => 'table'
                ))
                ->end()
                ->end()
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('id')
                ->add('numero')
                ->add('fecha')
                ->add('activo')
                ->add('dateAdd')
                ->add('dateMod')
                ->add('iva')
                ->add('ivaRetenido')
                ->add('subtotal')
                ->add('ventaTotal')
                ->add('ventasGravadas')
                ->end()
                ->with('Elementos del Catalogo')
                ->add('facturaDetalle', 'sonata_type_collection', array('label' => 'Elemento'), array('edit' => 'inline', 'inline' => 'table'))
                ->end()
        ;
    }

    public function prePersist($factura) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $factura->setIdUserAdd($user);
        $factura->setDateAdd(new \DateTime());

        // calcular campos de factura
        $sumas = 0;

        foreach ($factura->getFacturaDetalle() as $facturaDetalle) {
            $facturaDetalle->setIdFactura($factura);
            $facturaDetalle->setVentasGravadas($facturaDetalle->getCantidad($factura) * $facturaDetalle->getPrecioUnitario($factura));
            $sumas = $sumas + $facturaDetalle->getVentasGravadas($factura);
        }
        /*
         * evaluar si es factura pagada en efectivo
         */
        if ($factura->getIdTipofactura()->getId()==2){ // si la factura es de tipo Comprobante Credito Fiscal
            $iva = $sumas * 0.13;
            $subtotal = $sumas + $iva;
            $factura->setSumas($sumas);
            $factura->setIva($iva);
            $factura->setSubtotal($subtotal);
            $factura->setVentaTotal($subtotal);
        } else {
            $factura->setSumas($sumas);
            $factura->setIva(0);
            $factura->setSubtotal(0);
            $factura->setVentaTotal($sumas);
        }       

        $factura->setIvaRetenido(0);
        $factura->setVentasGravadas(0);
        
        // dejar la factura creada como activa
        $factura->setActivo(TRUE);
        if ($factura->getIdCondicionpago()->getId()==1){ //Evaluar si es pago en efectivo
            $factura->setEstado('CERR');
        } elseif ($factura->getIdCondicionpago()->getId()==2 || $factura->getIdCondicionpago()->getId()==3){ //Evaluar si es pago en efectivo
            $factura->setEstado('PEND');
        }

    }

    public function preUpdate($factura) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();        
        $factura->setIdUserMod($user);
        $factura->setDateMod(new \DateTime());

        // calcular campos de factura
        $sumas = 0;

        foreach ($factura->getFacturaDetalle() as $facturaDetalle) {
            $facturaDetalle->setIdFactura($factura);
            $facturaDetalle->setVentasGravadas($facturaDetalle->getCantidad($factura) * $facturaDetalle->getPrecioUnitario($factura));
            $sumas = $sumas + $facturaDetalle->getVentasGravadas($factura);
        }

        /*
         * evaluar si es factura pagada en efectivo
         */
        if ($factura->getIdTipofactura()->getId()==2){ // si la factura es de tipo Comprobante Credito Fiscal
            $iva = $sumas * 0.13;
            $subtotal = $sumas + $iva;
            $factura->setSumas($sumas);
            $factura->setIva($iva);
            $factura->setSubtotal($subtotal);
            $factura->setVentaTotal($subtotal);
        } else {
            $factura->setSumas($sumas);
            $factura->setIva(0);
            $factura->setSubtotal(0);
            $factura->setVentaTotal($sumas);
        }       

        $factura->setIvaRetenido(0);
        $factura->setVentasGravadas(0);
    }

    /*
     * permitir cuztomizar las acciones edit, create o show
     */

    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'BundlesFacturaBundle:FacFacturaAdmin:edit.html.twig';
                break;
//            case 'show':
//                return 'MinsalCatalogosBundle:CtlDiagnosticoHistopatologicoAdmin:show.html.twig';
//                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }

}
