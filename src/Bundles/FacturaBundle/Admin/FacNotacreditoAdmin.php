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
        /* filtrar solo CFF */
        $factura = new \Bundles\FacturaBundle\Entity\FacFactura;
        $qry_factura = $this->modelManager->getEntityManager($factura)->createQuery("SELECT s FROM \Bundles\FacturaBundle\Entity\FacFactura s WHERE s.estado != 'ANULADA' AND s.idTipofactura = 2");


        $formMapper
                ->with('Nota_credito', array('class' => 'col-md-8'))->end()
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
                ->add('idFactura','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label' => 'CFF (seleccione CCF)',
                    'required' => TRUE,
                    'btn_add' => FALSE,
                    'query' => $qry_factura,
                    'attr' => array(
                        'style'=>'width:300px')))

                ->add('idMotivoNotacredito',null,array('label'=>'Motivo de la nota de crédito',
                    'attr' => array(
                        'style'=>'width:300px')))
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

    public function prePersist($notacredito) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $notacredito->setIdUserAdd($user);
        $notacredito->setDateAdd(new \DateTime());
        // calcular campos de notacredito
        $sumas = 0;
        foreach ($notacredito->getNotacreditoDetalle() as $notacreditoDetalle) {
            $notacreditoDetalle->setIdNotacredito($notacredito);
            $notacreditoDetalle->setVentasGravadas($notacreditoDetalle->getCantidad($notacredito) * $notacreditoDetalle->getPrecioUnitario($notacredito));
            $sumas = $sumas + $notacreditoDetalle->getVentasGravadas($notacredito);
        }

        // dejar la notacredito creada como activa
        $notacredito->setActivo(TRUE);
    }

    public function postPersist($notacredito) {
        // var_dump($factura); exit();
        $factura = $notacredito->getIdFactura();
        $factura->setTotalNotacredito($notacredito->getSubtotal());
    }


    public function preUpdate($notacredito) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $notacredito->setIdUserMod($user);
        $notacredito->setDateMod(new \DateTime());
        // calcular campos de notacredito
        $sumas = 0;
        foreach ($notacredito->getNotacreditoDetalle() as $notacreditoDetalle) {
            $notacreditoDetalle->setIdNotacredito($notacredito);
            $notacreditoDetalle->setVentasGravadas($notacreditoDetalle->getCantidad($notacredito) * $notacreditoDetalle->getPrecioUnitario($notacredito));
            $sumas = $sumas + $notacreditoDetalle->getVentasGravadas($notacredito);
        }

        // var_dump($factura); exit();
        $factura = $notacredito->getIdFactura();
        $factura->setTotalNotacredito($notacredito->getSubtotal());
    }
}
