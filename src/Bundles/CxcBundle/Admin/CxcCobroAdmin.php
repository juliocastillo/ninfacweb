<?php

namespace Bundles\CxcBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

use Sonata\AdminBundle\Validator\ErrorElement;

class CxcCobroAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('fecha')
            ->add('numeroRecibo')
            ->add('activo')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('fecha')
            ->add('numeroRecibo')
            ->add('numeroCheque')
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
//            ->add('idFactura',NULL, array(
//                    'empty_value'=>'...Seleccione...',
//                    'class'=>'BundlesFacturaBundle:FacFactura',
//                    'label'=>'Numero de Factura',
//                    'attr' => array('style'=>'width:300px'),))
            ->add('idFactura','sonata_type_model_list', array(    // permitir buscar un item de un catalogo
                    'label'=>'Numero de Factura',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar factura',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => '#####'
                ))
            ->add('numeroRecibo','integer',array(
                'attr' => array(
                    'style'=>'width:300px', 'maxlength' => '25')))
            ->add('fecha', null, array('label' => 'Fecha', 'disabled' => false,
                  'widget' => 'single_text',  // un sólo input para la fecha, no tres.
                  'format' => 'dd/MM/y',
                  'attr'=> array('class'=>'bootstrap-datepicker now',
                      'style'=>'width:300px', 'maxlength' => '25'
                      )))
            ->add('idFormaPago','entity', array(
                    'class'=>'BundlesCatalogosBundle:CtlFormaPago',
                    'label'=>'Forma de pago',
                    'attr' => array('style'=>'width:300px'),))
            ->add('numeroCheque','text',array(
                'label'=>'Número de Cheque',
                'required'=>FALSE,
                'attr' => array(
                    'style'=>'width:300px', 'maxlength' => '25'
                    )))
            ->add('idBanco',NULL, array(
                    'empty_value'=>'...Seleccione...',
                    'class'=>'BundlesCatalogosBundle:CtlBanco',
                    'label'=>'Nombre de Banco',
                    'attr' => array('style'=>'width:300px'),))
                
            ->add('monto','text',array(
                'attr' => array(
                    'style'=>'width:300px', 'maxlength' => '25')))
            ->add('idEmpleado',NULL, array(
                    'class'=>'BundlesCatalogosBundle:CtlEmpleado',
                    'label'=>'Vendedor',
                    'empty_value'=>'...Seleccione...'
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
            ->add('numeroRecibo')
            ->add('fecha')
            ->add('numeroCheque')
            ->add('monto')
            ->add('activo')
        ;
    }
    
    
    public function prePersist($cobro) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $cobro->setIdUserAdd($user);
        $cobro->setDateAdd(new \DateTime());
       
        $cobro->setActivo(TRUE);
    }
 
    public function preUpdate($cobro) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $cobro->setIdUserMod($user);
        $cobro->setDateMod(new \DateTime());
        
    }

    
     /*
     * funcion para valida si un campo dependiente es obligatorio en base a la ingresado en otro
     */
    
    public function validate(ErrorElement $errorElement, $cobro) {
        if ($cobro->getIdFormaPago()->getId()==2) { // evaluar si es pago con cheque
            $errorElement->with('numeroCheque')
                    ->assertNotBlank()
                    ->assertNotNull()
                    ->end();
            $errorElement->with('idBanco')
                    ->assertNotBlank()
                    ->assertNotNull()
                    ->end();
        } else {
            $errorElement->with('numeroCheque')
                    ->assertBlank()
                    ->assertNull()
                    ->end();
            $errorElement->with('idBanco')
                    ->assertBlank()
                    ->assertNull()
                    ->end();

            
            
//            if (is_null($cobro->getNumeroCheque($cobro))) {
//                $errorElement->with('numeroCheque')
//                        ->addViolation('El número de cheque es obligatorio')
//                        ->end();
//            }
            
//            if (is_null($cobro->getIdBanco($cobro))) {
//                $errorElement->with('idBanco')
//                        ->addViolation('El banco es obligatorio')
//                        ->end();
//            }
//        } elseif($cobro->getIdFormaPago()->getId()==1) {
//            if (!is_null($cobro->getNumeroCheque($cobro))) {
//                $errorElement->with('numeroCheque')
//                        ->addViolation('Si el pago es efectivo no ingrese número de cheque')
//                        ->end();
//            }
//            if (!is_null($cobro->getIdBanco($cobro))) {
//                $errorElement->with('idBanco')
//                        ->addViolation('Si el pago es efectivo no seleccione el banco')
//                        ->end();
//            }
            
        }
            
    }
           
}
