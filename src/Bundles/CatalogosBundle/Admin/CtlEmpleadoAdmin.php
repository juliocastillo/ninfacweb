<?php

namespace Bundles\CatalogosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class CtlEmpleadoAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('nombres')
            ->add('apellidos')
            ->add('dui')
            ->add('nit')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('nombres')
            ->add('apellidos')
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
            ->add('nombres')
            ->add('apellidos')
            ->add('dui','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('nit','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('direccion')
            ->add('idCargofuncional')
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

        $formMapper
            ->add('empleadoZona','sonata_type_collection',array('label' =>'Zona'),
                                                                 array('edit' => 'inline', 'inline' => 'table'))
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('nombres')
            ->add('activo')
            ->add('apellidos')
            ->add('dui')
            ->add('nit')
            ->add('direccion')
        ;
    }

    public function prePersist($empleado) {
        foreach ($empleado->getEmpleadoZona() as $empleadoZona) {
            $empleadoZona->setIdEmpleado($empleado);
        }
    }
 
    public function preUpdate($empleado) {
        foreach ($empleado->getEmpleadoZona() as $empleadoZona) {
            $empleadoZona->setIdEmpleado($empleado);
        }
    }
}
