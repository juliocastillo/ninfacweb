<?php

namespace Bundles\CatalogosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;

class CtlProductoAdmin extends Admin
{
    
    /**
     * Default Datagrid values
     *
     * @var array
     */
    protected $datagridValues = array(
        '_page' => 1,            // display the first page (default = 1)
        '_sort_order' => 'ASC', // reverse order (default = 'ASC')
        '_sort_by' => 'nombre'  // name of the ordered field
                                 // (default = the model's id field, if any)

        // the '_sort_by' key can be of the form 'mySubModel.mySubSubModel.myField'.
    );
    
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('codigo')
            ->add('nombre')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('codigo')
            ->add('nombre')
            ->add('presentacion')
            ->add('idMarca',null,array('label'=>'Marca'))    
            ->add('precioVenta')
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
            ->add('codigo','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('nombre')
            ->add('presentacion','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
                
            ->add('idUnidad','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Unidad de medida',
                    'btn_add' => 'Agregar',
                    'btn_list' => 'Buscar UM',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
            ->add('idCategoria',NULL, array(
                    'label'=>'Categoría de producto',
                    'attr' => array('style'=>'width:300px'),
            ))
            ->add('idMarca','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Marca',
                    'btn_add' => 'Agregar',
                    'btn_list' => 'Buscar marca',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
            ->add('existencia','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('existenciaMaxima','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('existenciaMinima','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('precioCosto','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('precioVenta','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('reservado','text', array(
                    'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
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
            ->add('activo')
            ->add('presentacion')
            ->add('idMarca',null,array('label'=>'Marca'))
            ->add('dateAdd')
            ->add('dateMod')
            ->add('existencia')
            ->add('existenciaMaxima')
            ->add('existenciaMinima')
            ->add('precioCosto')
            ->add('precioVenta')
            ->add('reservado')
            ->add('codigo')
        ;
    }
    
    
    
    public function getExportFields() {
        return array('id',
            'nombre',
            'presentacion',
            'Marca'=>'idMarca',
            'existencia',
            'precioVenta' 	
        );
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
                return 'BundlesCatalogosBundle:CtlProductoAdmin:list.html.twig';
                break;
            default :
                return parent::getTemplate($name);
                break;
        }
    }
    
//    public function configureRoutes(RouteCollection $collection) {
//        $collection->add('imprimir_auxiliar_producto2', $this->getRouterIdParameter().'/imprimir_auxiliar_producto2');
//    }
    
    
    
}
