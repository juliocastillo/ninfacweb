<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class FacNotacreditoAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('id')
            ->add('fecha')
            ->add('sumas')
            ->add('iva')
            ->add('subtotal')
            ->add('ivaRetenido')
            ->add('ventasExentas')
            ->add('ventaTotal')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('fecha')
            ->add('sumas')
            ->add('iva')
            ->add('subtotal')
            ->add('ivaRetenido')
            ->add('ventasExentas')
            ->add('ventaTotal')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
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
                ->with('Nota_credito', array('class' => 'col-md-4'))->end()
                ->with('Detalle', array('class' => 'col-md-12'))->end()
                ->with('Resumen', array('class' => 'col-md-4'))->end()
        ;
        $formMapper
            ->with('Nota_credito')
                ->add('numero', null, array(
                            'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                        ))
                ->add('fecha', null, array(
                        'label' => 'Fecha nota de crédito',
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker',
                            'style' => 'width:200px', 'maxlength' => '25'
                        )))
                ->add('idFactura',null,array('label'=>'Número de CCF'))
                ->add('idMotivoNotacredito',null,array('label'=>'Motivo de la nota de crédito'))
            ->end()
            ->with('Detalle')
                ->add('notacreditoDetalle','sonata_type_collection',array('label' =>'Elemento'),
                                                                 array('edit' => 'inline', 'inline' => 'table'
                    ))
            ->end()
                ->with('Resumen')
                ->add('sumas', null, array(
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                ->add('iva', null, array(
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))

                ->add('ivaRetenido', null, array(
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))

                ->add('subtotal', null, array(
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                ->add('ventaTotal', null, array(
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
            ->add('fecha')
            ->end()
            ->with('Elementos del Catalogo')
                ->add('notacreditoDetalle', 'sonata_type_collection', array('label'=>'Elemento','route' => array('name' => 'show')),
                                                                   array('edit' => 'inline','inline' => 'table'))
            ->end()    
            ->with('resumen')    
            ->add('sumas')
            ->add('iva')
            ->add('subtotal')
            ->add('ivaRetenido')
            ->add('ventasExentas')
            ->add('ventaTotal')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
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

        foreach ($factura->getNotacreditoDetalle() as $facturaDetalle) {
            $facturaDetalle->setIdNotacredito($factura);
            $facturaDetalle->setVentasGravadas($facturaDetalle->getCantidad($factura) * $facturaDetalle->getPrecioUnitario($factura));
            $sumas = $sumas + $facturaDetalle->getVentasGravadas($factura);
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

        foreach ($factura->getNotacreditoDetalle() as $facturaDetalle) {
            $facturaDetalle->setIdNotacredito($factura);
            $facturaDetalle->setVentasGravadas($facturaDetalle->getCantidad($factura) * $facturaDetalle->getPrecioUnitario($factura));
            $sumas = $sumas + $facturaDetalle->getVentasGravadas($factura);
        }
        
    }
   
}
