<?php

namespace Bundles\FacturaBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

use Sonata\AdminBundle\Validator\ErrorElement;

class FacFacturaManualAdmin extends Admin
{
    /*
     * remover o agregar botones de herramientas
     * de sonata admin
     */
    protected function configureRoutes(RouteCollection $collection) {
        $collection
            ->remove('delete')
        ;
    }
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('idTipofactura', NULL, array(
                    'label' => 'Tipo de factura'
                    ))
                ->add('numero')
                ->add('fecha')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('idTipofactura', NULL, array(
                    'label' => 'Tipo de factura',
                    'empty_value' => '...Seleccione...',
                    'attr' => array(
                        'style' => 'width:300px'
                    ),))
                ->add('numero')
                ->add('fecha','date',array(
                                    'widget' => 'single_text',
                                    'format' => 'd/m/Y',
                                    'attr' => array('style'=>'width:100px', 'maxlength' => '10'),
                    ))
                ->add('idCliente')
                ->add('ventaTotal')
                ->add('estado')
                ->add('_action', 'actions', array(
                    'actions' => array(
                        'show' => array(),
                        'edit' => array(),
                        //'delete' => array(),
                    )
                ))
        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
                ->with('Factura', array('class' => 'col-md-4'))->end()
                ->with('Cliente', array('class' => 'col-md-8'))->end()
                ->with('Resumen', array('class' => 'col-md-4'))->end()
        ;
        
        $formMapper
            ->with('Factura')
                ->add('idTipofactura','entity', array(
                          'class'=>'BundlesCatalogosBundle:CtlTipofactura',
                          'label'=>'Tipo de factura',
                          'attr' => array('style'=>'width:300px'),))

                ->add('idFormatoDocumento', 'shtumi_dependent_filtered_entity', array(
                          'label'=>'Formato de la Factura',
                          'attr' => array('style'=>'width:300px'),
                          'entity_alias' => 'formato_por_tipofactura',
                          'empty_value'=> '...Seleccionar...',
                          'parent_field'=>'idTipofactura'))                

                ->add('numero', null, array(
                    'label' => 'Numero de factura',
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                ))
                ->add('fecha', null, array(
                        'label' => 'Fecha de la factura',
                        'read_only' => TRUE,
                        'widget' => 'single_text', // un sólo input para la fecha, no tres.
                        'format' => 'dd/MM/y',
                        'attr' => array(
                            'class' => 'bootstrap-datepicker now',
                            'style' => 'width:300px', 'maxlength' => '25'
                        )))
                ->end()
                ->with('Cliente')
                ->add('idCliente','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Cliente',
                    'btn_add' => 'Agregar',
                    'btn_list' => 'Buscar cliente',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
                ->add('idCondicionpago', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Condición de pago',
                    'attr' => array('style' => 'width:300px'),))
                ->add('idEmpleado', NULL, array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Venta a cuenta',
                    'attr' => array('style'=>'width:300px'),
                ))
                ->add('idNotaremision','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Nota de remisión',
                    'btn_add' => NULL,
                    'btn_list' => 'Buscar #NR',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => ''
                ))
                ->end()
                ->with('Resumen')
                ->add('sumas', null, array(
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('iva', null, array(
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                
                    ->add('ivaRetenido', null, array(
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))

                    ->add('subtotal', null, array(
                        'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('ventaTotal', null, array(
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
                    ->add('cobroTotal', null, array(
                    'attr' => array('style' => 'width:300px', 'maxlength' => '25'),
                    ))
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('numero')
            ->add('fecha')
            ->add('activo')
            ->add('dateAdd')
            ->add('dateMod')
            ->add('iva')
            ->add('ivaRetenido')
            ->add('subtotal')
            ->add('ventaTotal')
            ->add('ventasGravadas')
            ->add('estado')
            ->add('sumas')
            ->add('cobroTotal')
            ->add('fechaPago')
            ->add('ventasNosujetas')
            ->add('ventasExentas')
        ;
    }

    public function prePersist($factura) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $factura->setIdUserAdd($user);
        $factura->setDateAdd(new \DateTime());
        
        if ($factura->getIdCondicionpago()->getId()==1){ //Evaluar si es pago en efectivo
            $factura->setEstado('PAGADO');
            $factura->setFechaPago($factura->getFecha());
        } elseif ($factura->getIdCondicionpago()->getId()==2 || $factura->getIdCondicionpago()->getId()==3){ //Evaluar si es pago en efectivo
            $factura->setEstado('PENDIENTE');
        }
        
        // dejar la factura creada como activa
        $factura->setActivo(TRUE);
        $factura->setSinDetalle(TRUE);        
    }    
    
    public function preUpdate($factura) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();        
        $factura->setIdUserMod($user);
        $factura->setDateMod(new \DateTime());

        if ($factura->getIdCondicionpago()->getId()==1){ //Evaluar si es pago en efectivo
            $factura->setEstado('PAGADO');
            $factura->setFechaPago($factura->getFecha());
        }
        $factura->setSinDetalle(TRUE);        
        
    }
    
    
    /**
     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
     */
    public function createQuery($context = 'list') {
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        if($user->hasRole('ROLE_SUPER_ADMIN')){ // Permite ver todas las factoras solo al administrador del sistema
        $query = parent::createQuery($context);
        return new ProxyQuery(
                $query
                        ->where($query->getRootAlias() . ".activo = TRUE")
                        ->where($query->getRootAlias() . ".sinDetalle = TRUE")

        );
        } else { // permite ver las facturas del día a otro usuario no administrador
        $query = parent::createQuery($context);
        return new ProxyQuery(
                $query
                        ->where($query->getRootAlias() . ".activo = TRUE")
                        ->where($query->getRootAlias() . ".sinDetalle = TRUE")

        );    
        }
    }
    
}
