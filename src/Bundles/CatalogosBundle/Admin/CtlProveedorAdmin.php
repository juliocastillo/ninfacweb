<?php

namespace Bundles\CatalogosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class CtlProveedorAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('nombre')
            ->add('nombreComercial')
             ->add('nit')
            ->add('nrc')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('nombre')
            ->add('nombreComercial')
            ->add('telefono')
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
            ->add('nombre')
            ->add('nombreComercial')
            ->add('nit')
            ->add('nrc')
            ->add('direccion')
            ->add('email')
            ->add('telefono')
            ->add('idPais')
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
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('activo')
            ->add('direccion')
            ->add('email')
            ->add('nit')
            ->add('nombre')
            ->add('nombreComercial')
            ->add('nrc')
            ->add('telefono')
            ->add('dateAdd')
            ->add('dateMod')
        ;
    }
    
    public function prePersist($val) {
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $val->setIdUserAdd($user);
        $val->setDateAdd(new \DateTime());
    }

    /*
     * Metodo que se ejecuta antes de realizar una actualizacion.
     * Recibe como parametro una entidad; en este caso de tipo CtlPais
     * con los valores del formulario.
     * 
     */

    public function preUpdate($val) {
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $val->setIdUserMod($user);
        $val->setDateMod(new \DateTime());
    }
    
}
