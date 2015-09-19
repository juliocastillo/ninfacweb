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
            ->with('=============================================================')
                ->add('idProducto', 'sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nombre del producto',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar producto',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                    ))
                ->add('cantidad',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('precioUnitario',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('fechaVencimiento', null, array(
                        'label' => 'Fecha de vencimiento',
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker',
                            'style' => 'width:300px', 'maxlength' => '25'
                        )))
                ->add('lote',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('serie',null, array(
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('modelo',null, array(
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('comentario')
            ->end()
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
