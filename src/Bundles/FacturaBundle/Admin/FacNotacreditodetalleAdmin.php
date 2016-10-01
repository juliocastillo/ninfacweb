<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class FacNotacreditodetalleAdmin extends Admin
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
            ->add('idInvProductoMov', 'sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nombre del producto',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'admin_code' => 'bundles_inventario.admin.inv_producto_mov_ventas',
                    'placeholder' => ''
                    ))
            ->add('cantidad', null, array(
                'required' => FALSE,
                'attr' => array('style' => 'width:50px', 'maxlength' => '25'),
            ))
            ->add('precioUnitario', null, array(
                'required' => FALSE,
                'label'=>'Precio de venta',
                'attr' => array('style' => 'width:75px', 'maxlength' => '25'),
            ))
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper) {
         $showMapper
                ->add('id')
//            ->add('descripcion')
                ->add('idInvProductoMov',null,array('label' => 'Producto'))
                ->add('cantidad')

//            ->add('precioUnitario')
//            ->add('ventasExentas')
//            ->add('ventasGravadas')
//            ->add('ventasNosujetas')
        ;
    }
}
