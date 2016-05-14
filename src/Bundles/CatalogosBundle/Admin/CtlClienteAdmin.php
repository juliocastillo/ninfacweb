<?php

namespace Bundles\CatalogosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

use Sonata\AdminBundle\Route\RouteCollection;

class CtlClienteAdmin extends Admin
{
    protected function configureRoutes(RouteCollection $collection) {
        $collection
                //->remove('create')
                ->remove('delete')
        //->remove('edit')
        ;
    }

    
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('nombre',null, array(
                'class'=>'form-control',
                'placeholder'=>'Search'
                ))
            ->add('nrc')
            ->add('exento')
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
            ->add('direccion')
            ->add('exento')
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
            ->add('idTipoCliente','entity', array(
                      'class'=>'BundlesCatalogosBundle:CtlTipoCliente',
                      'label'=>'Tipo de cliente',
                      'attr' => array('style'=>'width:300px'),))
            ->add('nombre','text', array(
                'max_length'=>'100',
                ))
                ->add('nombreComercial','text', array(
                    'max_length'=>'100',
                    ))
            ->add('giro','text', array(
                'max_length'=>'100',
                ))
            ->add('nit','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('nrc','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('direccion')
            ->add('telefono')
            ->add('idDepartamento','entity', array(
                      'class'=>'BundlesCatalogosBundle:CtlDepartamento',
                      'label'=>'Departamento',
                      'attr' => array('style'=>'width:300px'),))

            ->add('idMunicipio', 'shtumi_dependent_filtered_entity', array(
                      'label'=>'Municipio',
                      'attr' => array('style'=>'width:300px'),
                      'entity_alias' => 'muni_por_depto',
                      'empty_value'=> 'Seleccionar...',
                      'parent_field'=>'idDepartamento'))                
            ->add('idZona',NULL,array(
                'label'=>'Zona',
                'attr' => array('style'=>'width:300px'),))
                
            ->add('email')
            ->add('agenteRetencion', NULL, array('label'=>'Agente de retencion'))
            ->add('exento', NULL, array('label'=>'Exento de IVA'))
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
            ->add('nombre')
            ->add('nombreComercial')
            ->add('giro')
            ->add('nit')
            ->add('nrc')
            ->add('direccion')
            ->add('telefono')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
            ->add('email')
            ->add('exento')
        ;
    }
    /*
     * Metodo que se ejecuta antes de realizar una insercion.
     * Recibe como parametro una entidad; en este caso de tipo CtlPais
     * con los valores del formulario.
     * 
     */
   
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
    
    public function getTemplate($name) {
        switch ($name) {
            case 'list':
                return 'BundlesCatalogosBundle:CtlClienteAdmin:list.html.twig';
                break;
            default :
                return parent::getTemplate($name);
                break;
        }
    }
    
}
