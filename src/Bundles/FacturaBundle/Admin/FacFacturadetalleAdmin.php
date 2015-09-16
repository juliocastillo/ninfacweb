<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class FacFacturadetalleAdmin extends Admin {

    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
//        $datagridMapper
//            ->add('id')
//            ->add('descripcion')
//            ->add('cantidad')
//            ->add('precioUnitario')
//            ->add('ventasExentas')
//            ->add('ventasGravadas')
//            ->add('ventasNosujetas')
//        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
//        $listMapper
//            ->add('id')
//            ->add('descripcion')
//            ->add('cantidad')
//            ->add('precioUnitario')
//            ->add('ventasExentas')
//            ->add('ventasGravadas')
//            ->add('ventasNosujetas')
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
    protected function configureFormFields(FormMapper $formMapper) {
        $formMapper
                ->with('================================================================================================')
                ->add('idProducto', 'sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nombre del producto',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar producto',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                    ))
                ->add('cantidad', null, array(
                    'required' => FALSE,
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
                ))
                ->add('descripcion','textarea', array(
                    'label'=>'Descripción del producto (sólo para formato detalle manual)',
                    'required' => FALSE,
                    'attr' => array(
                        'style'=>'width:500px'
                        )))
                ->add('precioUnitario', null, array(
                    'required' => FALSE,
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
                ))
                ->end();
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('id')
//            ->add('descripcion')
                ->add('idProducto')
                ->add('cantidad')

//            ->add('precioUnitario')
//            ->add('ventasExentas')
//            ->add('ventasGravadas')
//            ->add('ventasNosujetas')
        ;
    }

}
