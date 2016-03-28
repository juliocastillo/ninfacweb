<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;


class InvProductoMovAdmin extends Admin
{
    /**
     * Default Datagrid values
     *
     * @var array
     */
    protected $datagridValues = array(
        '_page' => 1,            // display the first page (default = 1)
        '_sort_order' => 'DESC', // reverse order (default = 'ASC')
        '_sort_by' => 'id_producto'  // name of the ordered field
                                 // (default = the model's id field, if any)

        // the '_sort_by' key can be of the form 'mySubModel.mySubSubModel.myField'.
    );
    
    
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('idProducto',null, array('label'=>'Nombre de producto'))
            ->add('lote')
            ->add('fecha',null, array('label'=>'Fecha inicial(a-m-d)'))
            ->add('activo');
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('idProducto',null, array('label'=>'Nombre de producto'))
            ->add('lote')
            ->add('fechaVencimiento','date',array(
                                'widget' => 'single_text',
                                'format' => 'd-m-Y',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('tipoMov')
            ->add('activo',NULL,array('editable'=>TRUE))
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
                            'style' => 'width:200px', 'maxlength' => '25'
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
            ->add('lote',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
            ->add('fechaVencimiento', null, array(
                        'label' => 'Fecha de vencimiento',
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker',
                            'style' => 'width:200px', 'maxlength' => '25'
                        )))                
            ->add('cantidadInicial',null, array(
                    'required'=>FALSE,
                    'attr' => array('style' => 'width:200px', 'maxlength' => '25'),))
            ->add('tipoMov','choice',
                        array(
                            'label'=>'Tipo de movimiento',
                            'choices' => array(
                            'I' => 'Inventario inicial',
                            'E' => 'Entrada'
                        )))
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
            ->add('idProducto',null, array('label'=>'Nombre de producto'))
            ->add('fecha')
            ->add('lote')
            ->add('cantidadInicial')
            ->add('activo')
        ;
    }
    
     
    public function getExportFields() {
        return array('idProducto',
            'lote'=>'Lote',
            'fechaVencimiento',
            'cantidadInicial'
        );
    }

    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
//    public function createQuery($context = 'list') {
//        $query = parent::createQuery($context);
//        return new ProxyQuery(
//                $query
//                        ->orderBy($query->getRootAlias() . ".id")
//        );
//    }    
    
    
    public function prePersist($data) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $data->setIdUserAdd($user);
        $data->setDateAdd(new \DateTime());
    }
 
    public function preUpdate($data) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $data->setIdUserMod($user);
        $data->setDateMod(new \DateTime());
    }

    
}
