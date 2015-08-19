<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class InvEntradaAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('id')
            ->add('fecha')
             ->add('numero')
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
            ->add('fecha')
            ->add('numero')
            ->add('activo')
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
            ->add('numero')
            ->add('idTipoentrada')
            ->add('idProveedor')
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'dd-MM-yyyy',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->end()
            ->with('Elementos de la factura')
                ->add('entradaDetalle','sonata_type_collection',array(
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
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'dd-MM-yyyy',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('numero')
            ->add('activo')
            ->end()
            ->with('Elementos de la factura')
                ->add('entradaDetalle','sonata_type_collection',array(
                                                                    'label' =>'Items'),
                                                                        array(
                                                                            'edit' => 'inline', 
                                                                            'inline' => 'table'
                                                                     ))
            ->end()
                ;
    }
    
    
    public function prePersist($entrada) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $entrada->setIdUserAdd($user);
        $entrada->setDateAdd(new \DateTime());
        
        foreach ($entrada->getEntradaDetalle() as $entradaDetalle) {
            $entradaDetalle->setIdEntrada($entrada);
            
        }
        $entrada->setActivo(TRUE);
    }
 
    public function preUpdate($entrada) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $entrada->setIdUserMod($user);
        $entrada->setDateMod(new \DateTime());
        
       
        foreach ($entrada->getEntradaDetalle() as $entradaDetalle) {
            $entradaDetalle->setIdEntrada($entrada);
        }
        
    }

    
    
}
