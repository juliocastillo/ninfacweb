<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class InvProductoMovVentasAdmin extends Admin
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
            ->add('lote');
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
            ->add('idProducto.precioVenta',null,array('label'=>'Precio de Venta'))
            ->add('saldo')
        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        
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

    
    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list') {
        $query = parent::createQuery($context);
        return new ProxyQuery(
                $query
                        ->where($query->getRootAlias() . ".activo=TRUE")
        );
    }    
    

    

}
