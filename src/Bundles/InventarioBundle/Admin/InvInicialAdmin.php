<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class InvInicialAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('idProducto')
            ->add('lote')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('idProducto')
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'd-m-Y',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('lote')
            ->add('cantidad')
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
        $entity = $this->getSubject();   //obtiene el elemento seleccionado en un objeto
        $id = $entity->getId();
        $formMapper
            ->add('fecha', null, array(
                        'label' => 'Fecha inicio de inventario',
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker',
                            'style' => 'width:300px', 'maxlength' => '25'
                        )))
            ->add('idProducto', 'sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nombre del producto',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar producto',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                            'admin_code' => 'bundles_catalogos.admin.ctl_producto',
                            'placeholder' => '*****'
                    ))
            ->add('cantidad',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))                
            ->add('lote',null, array(
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
            ->add('serie',null, array(
                'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
            ->add('modelo',null, array(
                'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
            ->add('activo');
            if ($id) {  // cuando se edite el registro
                if ($entity->getActivo() == TRUE) { // si el registro esta activo
                    $formMapper
                            ->add('activo', null, array('label' => 'Registro activo', 'required' => FALSE, 'attr' => array('checked' => 'checked')));
                } else { // si el registro esta inactivo
                    $formMapper
                            ->add('activo', null, array('label' => 'Registro activo', 'required' => FALSE));
                }
            } else { // cuando se crea el registro
                $formMapper
                        ->add('activo', null, array('label' => 'Registro activo', 'required' => FALSE, 'attr' => array('checked' => 'checked')));
            }
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('fecha')
            ->add('lote')
            ->add('modelo')
            ->add('serie')
            ->add('cantidad')
            ->add('activo')
        ;
    }
    
     
    public function getExportFields() {
        return array('idProducto',
            'lote'=>'Lote',
            'fechaVencimiento',
            'modelo'=>'Modelo',
            'serie',
            'cantidad'
        );
    }

    
}
