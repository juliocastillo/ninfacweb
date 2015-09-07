<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class FacNotaremisionAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('id')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
            ->add('fecha')
            ->add('numero')
            ->add('ventaTotal')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
            ->add('fecha')
            ->add('numero')
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
            ->tab('DATOS GENERALES')
                ->with('')
            ->add('numero', null, array(
                    'label' => 'Número',
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                ))
            ->add('fecha', null, array(
                        'label' => 'Fecha',
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
            ->add('idCondicionpago')
                ->end()
                ->with('$')                    
                ->add('ventaTotal', null, array(
                    'read_only' => TRUE,
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
            ->end()
            ->end()
            ->tab('D E T A L L E')
            ->with('Elementos del Catalogo')
                ->add('facnotaremisionDetalle','sonata_type_collection',array('label' =>'Elemento'),
                                                                 array('edit' => 'inline', 'inline' => 'table'))
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
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
            ->add('fecha')
            ->add('numero')
            ->add('ventaTotal')
            ->end()
            ->with('Elementos del Catalogo')
                ->add('facnotaremisionDetalle','sonata_type_collection',array('label' =>'Elemento'),
                                                                 array('edit' => 'inline', 'inline' => 'table'))
            ->end()
        ;
    }
    
    public function prePersist($notaremision) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $notaremision->setIdUserAdd($user);
        $notaremision->setDateAdd(new \DateTime());

        foreach ($notaremision->getFacnotaremisionDetalle() as $notaremisionDetalle) {
            $notaremisionDetalle->setIdNotaremision($notaremision);
            $notaremisionDetalle->setTotal($notaremisionDetalle->getCantidad($notaremision) * $notaremisionDetalle->getPrecioUnitario($notaremision));
            $sumas = $sumas + $notaremisionDetalle->getTotal();
        }
        // dejar la factura creada como activa
        $notaremision->setActivo(TRUE);
        $notaremision->setEstado('PENDIENTE');
    }

    public function preUpdate($notaremision) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $notaremision->setIdUserAdd($user);
        $notaremision->setDateAdd(new \DateTime());

        $sumas = 0;
        foreach ($notaremision->getFacnotaremisionDetalle() as $notaremisionDetalle) {
            $notaremisionDetalle->setIdNotaremision($notaremision);
            $notaremisionDetalle->setTotal($notaremisionDetalle->getCantidad($notaremision) * $notaremisionDetalle->getPrecioUnitario($notaremision));
            $sumas = $sumas + $notaremisionDetalle->getTotal();
        }
    $notaremision->setVentaTotal($sumas);
    }

    
}
