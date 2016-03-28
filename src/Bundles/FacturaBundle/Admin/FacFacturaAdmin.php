<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

use Sonata\AdminBundle\Validator\ErrorElement;


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
                ->add('idTipofactura', NULL, array(
                    'label' => 'Tipo de factura'
                    ))
                ->add('numero')
                ->add('fecha')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('idTipofactura', NULL, array(
                    'label' => 'Tipo de factura',
                    'empty_value' => '...Seleccione...',
                    'attr' => array(
                        'style' => 'width:300px'
                    ),))
                ->add('numero')
                ->add('fecha','date',array(
                                    'widget' => 'single_text',
                                    'format' => 'd/m/Y',
                                    'attr' => array('style'=>'width:100px', 'maxlength' => '10'),
                    ))
                ->add('idCliente')
                ->add('ventaTotal')
                ->add('estado')
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
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->with('Factura', array('class' => 'col-md-4'))->end()
                ->with('Cliente', array('class' => 'col-md-8'))->end()
                ->with('Detalle', array('class' => 'col-md-12'))->end()
                ->with('Resumen', array('class' => 'col-md-4'))->end()
        ;
        
        $formMapper
            ->with('Factura')
                ->add('idTipofactura','entity', array(
                          'class'=>'BundlesCatalogosBundle:CtlTipofactura',
                          'label'=>'Tipo de factura',
                          'attr' => array('style'=>'width:300px'),))

                ->add('idFormatoDocumento', 'shtumi_dependent_filtered_entity', array(
                          'label'=>'Formato de la Factura',
                          'attr' => array('style'=>'width:300px'),
                          'entity_alias' => 'formato_por_tipofactura',
                          'empty_value'=> '...Seleccionar...',
                          'parent_field'=>'idTipofactura'))                

                ->add('numero', null, array(
                    'label' => 'Numero de factura',
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                ))
                ->add('fecha', null, array(
                        'label' => 'Fecha de la factura',
                        'read_only' => TRUE,
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker now',
                            'style' => 'width:300px', 'maxlength' => '25'
                        )))
                ->end()
                ->with('Cliente')
                ->add('idCliente','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Cliente',
                    'btn_add' => 'Agregar',
                    'btn_list' => 'Buscar cliente',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
                ->add('idCondicionpago', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Condición de pago',
                    'attr' => array('style' => 'width:300px'),))
//                ->add('fechaPago', null, array(
//                        'label' => 'Fecha de pago crédito',
//                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
//                        'format' => 'dd/MM/y',
//                        'attr' => array(
//                            'class' => 'bootstrap-datepicker',
//                            'style' => 'width:300px', 'maxlength' => '25'
//                        )))
                ->add('idEmpleado', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Venta a cuenta',
                    'attr' => array('style'=>'width:300px'),
                ))
                ->add('idNotaremision','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nota de remisión',
                    'btn_add' => NULL,
                    'btn_list' => 'Buscar #NR',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => ''
                ))
                ->end()
                ->with('Detalle')
                ->add('facturaDetalle', 'sonata_type_collection', array(
                    'label' => 'Items'), array(
                    'edit' => 'inline',
                    'inline' => 'table'
                ))
                ->end()
                ->with('Resumen')
                ->add('sumas', null, array(
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
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
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
            ->add('estado')
            ->add('sumas')
            ->add('cobroTotal')
            ->add('fechaPago')
            ->add('ventasNosujetas')
            ->add('ventasExentas')
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
        
        if ($factura->getIdCondicionpago()->getId()==1){ //Evaluar si es pago en efectivo
            $factura->setEstado('PAGADO');
            $factura->setFechaPago($factura->getFecha());
        } elseif ($factura->getIdCondicionpago()->getId()==2 || $factura->getIdCondicionpago()->getId()==3){ //Evaluar si es pago en efectivo
            $factura->setEstado('PENDIENTE');
        }
        
        // dejar la factura creada como activa
        $factura->setActivo(TRUE);
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
        
        if ($factura->getIdCondicionpago()->getId()==1){ //Evaluar si es pago en efectivo
            $factura->setEstado('PAGADO');
            $factura->setFechaPago($factura->getFecha());
        }
        
    }
    
    /*
     * permitir cuztomizar las acciones edit, create o show
     */
    
    
    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                $entity = $this->getSubject();   //obtiene el elemento seleccionado en un objeto
                $id = $entity->getId();
                if ($id)  // cuando se edite el registro
                    return 'BundlesFacturaBundle:CRUD:FacFacturaAdmin/edit.html.twig';
                else
                    return 'BundlesFacturaBundle:CRUD:FacFacturaAdmin/create.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }    
    
    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list') {
        $query = parent::createQuery($context);
        return new ProxyQuery(
                $query
                        ->where($query->getRootAlias() . ".activo = TRUE")
                        //->where($query->getRootAlias() . ".estado != 'PAGADO'")

        );
    }
    
    
    
    /*
     * funcion para valida si un campo dependiente es obligatorio en base a la ingresado en otro
     */
    public function validate(ErrorElement $errorElement, $factura) {
//        if ($factura->getIdCondicionpago()->getId()==2 || $factura->getIdCondicionpago()->getId()==3) { // evaluar si es credito
//            $errorElement->with('fechaPago')
//                    ->assertNotBlank()
//                    ->assertNotNull()
//                    ->end();
//            
//            if ($factura->getFechaPago() < $factura->getFecha($factura)) {
//            $errorElement->with('fechaPago')
//                    ->addViolation('La Fecha de Pago debe ser mayor o igual a la fecha de facturación')
//                    ->end();
//            }
//        }
    }
}
