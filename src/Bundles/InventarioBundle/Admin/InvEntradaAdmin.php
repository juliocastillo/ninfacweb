<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class InvEntradaAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('fecha')
             ->add('numero')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('numero')
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'd-m-Y',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('idProveedor',null, array(
                'label'=>'Proveedor'
            ))
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
        $formMapper
            ->tab('Datos generales')
                ->with('')
                ->add('numero','integer', array(
                        'attr' => array(
                            'style' => 'width:200px'
                        )))
                ->add('fecha', null, array('label' => 'Fecha', 'disabled' => false,
                      'read_only'=>TRUE,
                      'widget' => 'single_text',  // un sólo input para la fecha, no tres.
                      'format' => 'dd/MM/y',
                      'attr'=> array(
                          'class'=>'bootstrap-datepicker now',
                          'style' => 'width:200px')))
                ->add('idTipoentrada',null, array(
                    'label'=>'Tipo de entrada',
                    'attr'=> array(
                          'style' => 'width:400px'
                        )))

                ->add('tipoCompra', 'choice', array(
                    'label'=>'Tipo de compra',
                    'attr'=> array(
                          'style' => 'width:400px'
                        ),
                    'choices'   => array(
                        '0'   => 'Seleccione',
                        '1'   => 'Local',
                        '2' => 'Importación',
                    )
                ))
                ->add('idProveedor','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Proveedor',
                    'btn_add' => 'Agregar',
                    'btn_list' => 'Buscar proveedor',
                    'btn_delete' => 'Limpiar campo',
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '*****'
                ))
                ->add('idAlmacen',null, array(
                    'required'=>TRUE,
                    'label'=>'Almacen que recibe',
                    'attr'=> array(
                          'style' => 'width:400px'
                        )))
                ->end()
            ->end()
            ->tab('D E T A L L E')
            ->with('')
                ->add('entradaDetalle','sonata_type_collection',
                        array(
                            'label' =>'Items'),
                                array(
                                    'edit' => 'inline',
                                    'inline' => 'standard'
                             ))
                ->end()
            ->end()
                ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'format' => 'dd-MM-yyyy',
                                'attr' => array('style'=>'width:300px', 'maxlength' => '25'),
                ))
            ->add('numero')
            ->add('activo')
            ->end()
            ->with('Elementos de la factura')
                ->add('entradaDetalle','sonata_type_collection',array(
                                                                    'label' =>'Items'),
                                                                        array(
                                                                            'edit' => 'inline',
                                                                            'inline' => 'table'
                                                                     ))
            ->end()
                ;
    }

    public function getExportFields() {
        return array('id',
            'numero',
            'fecha',
            'idTipoentrada',
            'idProveedor',
            'idAlmacen'
            );
    }


    public function prePersist($entrada) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $entrada->setIdUserAdd($user);
        $entrada->setDateAdd(new \DateTime());

        foreach ($entrada->getEntradaDetalle() as $entradaDetalle) {
            $entradaDetalle->setIdEntrada($entrada);

        }
        $entrada->setActivo(TRUE);
    }

    public function preUpdate($entrada) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $entrada->setIdUserMod($user);
        $entrada->setDateMod(new \DateTime());


        foreach ($entrada->getEntradaDetalle() as $entradaDetalle) {
            $entradaDetalle->setIdEntrada($entrada);
        }
    }

    public function postPersist($entrada) {
        //actualizar saldos
        $fecha = date("Y-m-d");
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine.orm.entity_manager');
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradas($fecha);
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSaldos();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->inactivarProductoSaldoCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->activarProducto();
    }
    public function postUpdate($entrada) {
        //actualizar saldos
        $fecha = date("Y-m-d");
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine.orm.entity_manager');
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradas($fecha);
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSaldos();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->inactivarProductoSaldoCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->activarProducto();
    }
    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                return 'BundlesInventarioBundle:CRUD:InvEntrada/edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }
}
