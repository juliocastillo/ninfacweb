<?php

namespace Bundles\CxcBundle\Admin;

use Bundles\FacturaBundle\Entity;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class CxcCobroAdmin extends Admin {

    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
        
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper) {

        $formMapper
                ->add('numeroRecibo', 'integer', array(
                    'attr' => array(
                        'style' => 'width:110px', 'maxlength' => '25')))
                ->add('fecha', null, array(
                    'label' => 'Fecha  (dd/mm/aaaa)',
                    'disabled' => false,
                    'widget' => 'single_text', // un sólo input para la fecha, no tres.
                    'format' => 'dd/MM/y',
                    'attr' => array('class' => 'bootstrap-datepicker now',
                        'style' => 'width:100px', 'maxlength' => '25')))
                ->add('idFactura', 'sonata_type_model_list', array(// permitir buscar un item de un catalogo
                    'label' => 'Factura',
                    'btn_add' => FALSE,
                    'btn_list' => 'Buscar',
                    'btn_delete' => FALSE,
                    'btn_catalogue' => 'SonataNewBundle'
                        ), array(
                    'placeholder' => ''))
                ->add('idFormaPago', 'entity', array(
                    'class' => 'BundlesCatalogosBundle:CtlFormaPago',
                    'label' => 'Forma de pago',
                    'attr' => array('style' => 'width:100px'),))
                ->add('numeroCheque', 'text', array(
                    'label' => 'Número de Cheque',
                    'required' => FALSE,
                    'attr' => array(
                        'style' => 'width:110px', 'maxlength' => '25')))
                ->add('idBanco', 'sonata_type_model', array(
                    'empty_value' => '...ninguno...',
                    'label' => 'Nombre del banco',
                    'required' => FALSE,
                    'btn_add' => FALSE,
                    'attr' => array(
                        'style' => 'width:150px', 'maxlength' => '25')))
                ->add('monto', 'number', array(
                    'required' => TRUE,
                    'label' => 'Monto',
                    'attr' => array(
                        'style' => 'width:100px', 
                        'maxlength' => '25',
                        'class' => 'monto'
                    ),
                ))
                ->add('idEmpleado', 'sonata_type_model', array(
                    'empty_value' => '...Seleccione...',
                    'label' => 'Quién cobró',
                    'attr' => array('style' => 'width:110px'),
                    'required' => FALSE,
                    'btn_add' => FALSE,))
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('id')
                ->add('numeroRecibo')
                ->add('fecha')
                ->add('numeroCheque')
                ->add('monto')
                ->add('activo')
        ;
    }

//    public function prePersist($cobro) {
//        // llenar campos de auditoria
//        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
//        $cobro->setIdUserAdd($user);
//        $cobro->setDateAdd(new \DateTime());
//
//        $cobro->setActivo(TRUE);
//
//        $cobro->setEstado('PENDIENTE');
//    }
//
//    public function preUpdate($cobro) {
//        // llenar campos de auditoria
//        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
//        $cobro->setIdUserMod($user);
//        $cobro->setDateMod(new \DateTime());
//
//        $cobro->setEstado('PENDIENTE');
//
//    }
//
//    public function postPersist($cobro) {
//        //accediendo al objeto de una entidad a través del EntityManager
//        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
//        $idFactura = $cobro->getIdFactura()->getId();
//        // actualizando campo pago_total en la factura
//        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);
//
//        // actualizar estado en caso que la factura sea liquidada
//        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
//    }
//
//    public function postUpdate($cobro) {
//        //accediendo al objeto de una entidad a través del EntityManager
//        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
//        $idFactura = $cobro->getIdFactura()->getId();
//
//        // actualizando campo pago_total en la factura y estado ABONADO
//        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);
//
//        // actualizar estado en caso que la factura sea liquidada
//        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
//    }
//
//    /*
//     * funcion para valida si un campo dependiente es obligatorio en base a la ingresado en otro
//     */
//
//    public function validate(ErrorElement $errorElement, $cobro) {
//        if ($cobro->getIdFormaPago()->getId() == 2) { // evaluar si es pago con cheque
//            $errorElement->with('numeroCheque')
//                    ->assertNotBlank()
//                    ->assertNotNull()
//                    ->end();
//            $errorElement->with('idBanco')
//                    ->assertNotBlank()
//                    ->assertNotNull()
//                    ->end();
//        } else {
//            $errorElement->with('numeroCheque')
//                    ->assertBlank()
//                    ->assertNull()
//                    ->end();
//            $errorElement->with('idBanco')
//                    ->assertBlank()
//                    ->assertNull()
//                    ->end();
//
//
//
////            if (is_null($cobro->getNumeroCheque($cobro))) {
////                $errorElement->with('numeroCheque')
////                        ->addViolation('El número de cheque es obligatorio')
////                        ->end();
////            }
////            if (is_null($cobro->getIdBanco($cobro))) {
////                $errorElement->with('idBanco')
////                        ->addViolation('El banco es obligatorio')
////                        ->end();
////            }
////        } elseif($cobro->getIdFormaPago()->getId()==1) {
////            if (!is_null($cobro->getNumeroCheque($cobro))) {
////                $errorElement->with('numeroCheque')
////                        ->addViolation('Si el pago es efectivo no ingrese número de cheque')
////                        ->end();
////            }
////            if (!is_null($cobro->getIdBanco($cobro))) {
////                $errorElement->with('idBanco')
////                        ->addViolation('Si el pago es efectivo no seleccione el banco')
////                        ->end();
////            }
//        }
//    }
//
//// fin validate()
//
//    /**
//     * @return \Sonata\AdminBundle\Datagrid\ProxyQueryInterface
//     */
//    public function createQuery($context = 'list') {
//        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
//        if ($user->hasRole('ROLE_SUPER_ADMIN')) { // Permite ver todas las factoras solo al administrador del sistema
//            $query = parent::createQuery($context);
//            return new ProxyQuery(
//                    $query
//                            ->where($query->getRootAlias() . ".activo = TRUE")
//            );
//        } else { // permite ver las facturas del día a otro usuario no administrador
//            $query = parent::createQuery($context);
//            return new ProxyQuery(
//                    $query
//                            ->where($query->getRootAlias() . ".dateAdd = 'now()'")
//            );
//        }
//    }

}
