<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class FacNotaremisiondetalleAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('id')
            ->add('cantidad')
            ->add('precioUnitario')
            ->add('total')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('cantidad')
            ->add('precioUnitario')
            ->add('total')
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
                ->add('cantidad', null, array(
                    'required' => FALSE,
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
                ))
                ->add('idProducto', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Producto',
                    'attr' => array('style' => 'width:600px'),))
                ->add('precioUnitario', null, array(
                    'required' => FALSE,
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
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
            ->add('cantidad')
            ->add('precioUnitario')
            ->add('total')
        ;
    }
    
    
}
