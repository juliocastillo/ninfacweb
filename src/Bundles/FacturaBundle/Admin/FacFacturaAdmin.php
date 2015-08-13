<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

use Sonata\AdminBundle\Route\RouteCollection;

class FacFacturaAdmin extends Admin
{
    
    protected function configureRoutes(RouteCollection $collection)
    {
        $collection
            //->remove('create')
            ->add('delete')
            //->remove('edit')
            ;

    }
    
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
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
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('numero')
            ->add('idTipofactura')
            ->add('fecha','date')
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
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('numero',null,array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('idTipofactura',NULL,array('label'=>'Tipo de factura',
                      'attr' => array('style'=>'width:400px'),))     
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'dd-MM-yyyy',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('idCliente',NULL,array('label'=>'Cliente',
                      'attr' => array('style'=>'width:400px'),))
            ->add('idCondicionpago',NULL,array('label'=>'Condición de pago',
                      'attr' => array('style'=>'width:400px'),))
            ->add('idEmpleado',NULL,array('label'=>'Empleado',
                      'attr' => array('style'=>'width:400px'),))
            
            ->end()
            ->with('Elementos de la factura')
                ->add('facturaDetalle','sonata_type_collection',array(
                                                                    'label' =>'Items'),
                                                                        array(
                                                                            'edit' => 'inline', 
                                                                            'inline' => 'table'
                                                                     ))
            ->end()
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
            ->end()
            ->with('Elementos del Catalogo')
                ->add('facturaDetalle','sonata_type_collection',array('label' =>'Elemento'),
                                                                 array('edit' => 'inline', 'inline' => 'table'))
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
        $iva = $sumas * 0.13;
        $subtotal = $sumas + $iva;
        
        $factura->setSumas($sumas);
        $factura->setIva($iva);
        $factura->setSubtotal($subtotal);
        $factura->setVentaTotal($subtotal);
        
        $factura->setIvaRetenido(0);
        $factura->setVentasGravadas(0);
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
        $iva = $sumas * 0.13;
        $subtotal = $sumas + $iva;
        
        $factura->setSumas($sumas);
        $factura->setIva($iva);
        $factura->setSubtotal($subtotal);
        $factura->setVentaTotal($subtotal);
        
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
