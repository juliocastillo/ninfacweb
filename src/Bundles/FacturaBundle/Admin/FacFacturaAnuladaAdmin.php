<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

use Sonata\AdminBundle\Route\RouteCollection;


class FacFacturaAnuladaAdmin extends Admin
{
    
    /*
     * remover o agregar botones de herramientas
     * de sonata admin
     */
    protected function configureRoutes(RouteCollection $collection) {
        $collection
            ->remove('delete')
        ;
    }
    
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('idFactura')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('idFactura')
            ->add('idMotivoAnulacion')
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'd/m/Y',
                                'attr' => array('style'=>'width:100px', 'maxlength' => '10'),
                ))
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
            ->add('idFactura',null,array('label'=>'Número y tipo de factura'))
            ->add('idMotivoAnulacion',null,array('label'=>'Motivo de anulación'))    
            ->add('fecha', null, array(
                    'label' => 'Fecha de anulación de la factura',
                    'widget' => 'single_text', // un sólo input para la fecha, no tres.
                    'format' => 'dd/MM/y',
                    'attr' => array(
                        'class' => 'bootstrap-datepicker',
                        'style' => 'width:200px', 'maxlength' => '25'
                    )))
            ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
        ;
    }
    
    public function prePersist($data) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $data->setIdUserAdd($user);
        $data->setDateAdd(new \DateTime());
        
        $data->getIdFactura()->setEstado('ANULADO');
    }

    public function preUpdate($data) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $data->setIdUserMod($user);
        $data->setDateMod(new \DateTime());
        
        $data->getIdFactura()->setEstado('ANULADO');
    }
    
    
    
}
