<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class InvEntradadetalleAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
//        $datagridMapper
//            ->add('id')
//            ->add('comentario')
//            ->add('lote')
//            ->add('serie')
//            ->add('modelo')
//            ->add('cantidad')
//            ->add('precioUnitario')
//            ->add('fechaVencimiento')
//        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
//        $listMapper
//            ->add('id')
//            ->add('comentario')
//            ->add('lote')
//            ->add('serie')
//            ->add('modelo')
//            ->add('cantidad')
//            ->add('precioUnitario')
//            ->add('fechaVencimiento')
//            ->add('_action', 'actions', array(
//                'actions' => array(
//                    'show' => array(),
//                    'edit' => array(),
//                    'delete' => array(),
//                )
//            ))
//        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('idProducto')
            ->add('lote')
            ->add('serie')
            ->add('modelo')
            ->add('cantidad')
            ->add('precioUnitario')
            ->add('fechaVencimiento','date',array(
                                'widget' => 'single_text',
                                'format' => 'dd-MM-yyyy',
                                'attr' => array('style'=>'width:100px', 'maxlength' => '10'),
                ))
            ->add('comentario')
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
//        $showMapper
//            ->add('id')
//            ->add('comentario')
//            ->add('lote')
//            ->add('serie')
//            ->add('modelo')
//            ->add('cantidad')
//            ->add('precioUnitario')
//            ->add('fechaVencimiento')
//        ;
    }
}
