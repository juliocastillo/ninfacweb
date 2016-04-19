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
            ->add('idFactura','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Numero de Factura',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar factura',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '#####'
                ))
            ->add('idMotivoAnulacion',null,array('label'=>'Motivo de anulación'))    
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
