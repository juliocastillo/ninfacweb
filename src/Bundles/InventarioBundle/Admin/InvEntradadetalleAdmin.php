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
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->with('=============================================================')
                ->add('idInvProductoMov', 'sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nombre del producto',
                    'btn_add' => 'Crear producto-lote',
                    'btn_list' => 'Buscar',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                            'admin_code' => 'bundles_inventario.admin.inv_producto_mov',
                            'placeholder' => ''
                    ))
                ->add('precioUnitario',null, array('label'=>'Costo FOB (importaciones)',
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('costoAdicional',null, array('label'=>'Costo CIF (con impuestos)',
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
                ->add('cantidad',null, array(
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
