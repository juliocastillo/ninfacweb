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

class CxcCobroAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('numeroRecibo')
            ->add('fecha')

        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('numeroRecibo','integer',array(
                'label'=> 'Número de Recibo',
                'attr' => array(
                    'style'=>'width:100px'
                    )))
            ->add('fecha','date',array(
                                'widget' => 'single_text',
                                'attr' => array('style'=>'width:100px', 'maxlength' => '10',
                                    'format' => 'Y-m-d'),
                ))

            ->add('monto')
            ->add('idFactura',null, array(    // permitir buscar un item de un catalogo
                    'label'=>'Número de Factura'
                    ))
            ->add('estado')
            ->add('activo',NULL,array('editable'=>TRUE))
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

        $entity = $this->getSubject();   //obtiene el elemento seleccionado en un objeto
        $id = $entity->getId();

        $empleado = new \Bundles\CatalogosBundle\Entity\CtlEmpleado;
        $banco = new \Bundles\CatalogosBundle\Entity\CtlBanco;
        $factura = new \Bundles\FacturaBundle\Entity\FacFactura;

        $qry_empleado = $this->modelManager->getEntityManager($empleado)->createQuery('SELECT s FROM \Bundles\CatalogosBundle\Entity\CtlEmpleado s WHERE s.activo = TRUE AND s.autorizarCobro=TRUE');
        $qry_banco = $this->modelManager->getEntityManager($empleado)->createQuery('SELECT s FROM \Bundles\CatalogosBundle\Entity\CtlBanco s WHERE s.activo = TRUE');
        $qry_factura = $this->modelManager->getEntityManager($factura)->createQuery(
            "SELECT s FROM \Bundles\FacturaBundle\Entity\FacFactura s WHERE s.estado != 'PAGADO' AND s.estado != 'ANULADO' ORDER BY s.fecha, s.numero, s.idTipofactura");

        if (!$id) { // Se mostrara al agregar un ITEM
            $formMapper
                ->add('idFactura','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label'     => 'Factura (seleccione factura)',
                    'required'  => TRUE,
                    'btn_add'   => FALSE,
                    'class'     => 'BundlesFacturaBundle:FacFactura',
                    'property'  => 'factura',
                    'query'     => $qry_factura,
                    'attr'      => array(
                        'style'=>'width:500px')))

                // ->add('idFactura','sonata_type_model', array(
                //     'empty_value'=>'...ninguno...',
                //     'label' => 'Factura (seleccione factura)',
                //     'required' => TRUE,
                //     'btn_add' => FALSE,
                //     'query' => $qry_factura,
                //     'attr' => array(
                //         'style'=>'width:500px')))
                //
                ->add('numeroRecibo','integer',array(
                    'attr' => array(
                        'style'=>'width:300px', 'maxlength' => '25')))
                ->add('fecha', null, array(
                        'label' => 'Fecha  (dd/mm/aaaa)',
                        'disabled' => false,
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
                ->add('idBanco','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label' => 'Nombre del banco',
                    'required' => FALSE,
                    'btn_add' => FALSE,
                    'query' => $qry_banco,
                    'attr' => array(
                        'style'=>'width:500px', 'maxlength' => '25')))

                ->add('monto','text',array(
                    'attr' => array(
                        'style'=>'width:300px', 'maxlength' => '25')))

                ->add('idEmpleado','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label' => 'Quien realiza el cobro?',
                    'required' => TRUE,
                    'btn_add' => FALSE,
                    'query' => $qry_empleado,
                    'attr' => array(
                        'style'=>'width:500px', 'maxlength' => '25')))

                ->add('observacion','textarea', array(
                        'label'=>'Comentarios',
                        'required' => FALSE,
                        'attr' => array(
                            'style'=>'width:500px'
                            )))
            ;
        } else { // mode de modificacion el registro
            $formMapper

            ->add('idFactura','sonata_type_model', array(
                'class'     => 'BundlesFacturaBundle:FacFactura',
                'property'  => 'factura',
                'empty_value'=>'...ninguno...',
                'label' => 'Factura (seleccione factura)',
                'required' => TRUE,
                'btn_add' => FALSE,
                'attr' => array(
                    'style'=>'width:500px')))


                ->add('numeroRecibo','integer',array(
                    'attr' => array(
                        'style'=>'width:300px', 'maxlength' => '25')))
                ->add('fecha', null, array(
                        'label' => 'Fecha  (dd/mm/aaaa)',
                        'disabled' => false,
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
                ->add('idBanco','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label' => 'Nombre del banco',
                    'required' => FALSE,
                    'btn_add' => FALSE,
                    'query' => $qry_banco,
                    'attr' => array(
                        'style'=>'width:500px', 'maxlength' => '25')))

                ->add('monto','text',array(
                    'attr' => array(
                        'style'=>'width:300px', 'maxlength' => '25')))

                ->add('idEmpleado','sonata_type_model', array(
                    'empty_value'=>'...ninguno...',
                    'label' => 'Quien realiza el cobro?',
                    'required' => TRUE,
                    'btn_add' => FALSE,
                    'query' => $qry_empleado,
                    'attr' => array(
                        'style'=>'width:500px', 'maxlength' => '25')))

                ->add('observacion','textarea', array(
                        'label'=>'Comentarios',
                        'required' => FALSE,
                        'attr' => array(
                            'style'=>'width:500px'
                            )))
            ;
        }
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

        $cobro->setEstado('PENDIENTE');

    }

    public function preUpdate($cobro) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $cobro->setIdUserMod($user);
        $cobro->setDateMod(new \DateTime());

        $cobro->setEstado('PENDIENTE');

        //accediendo al objeto de una entidad a través del EntityManager
//        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
//        $factura = $cobro->getIdFactura();
//        $factura->setCobroTotal(21);
//        $em->persist($factura);
    }

    public function postPersist($cobro) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        $idFactura = $cobro->getIdFactura()->getId();
        // actualizando campo pago_total en la factura
        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);

        // actualizar estado en caso que la factura sea liquidada
        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
    }

    public function postUpdate($cobro) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        $idFactura = $cobro->getIdFactura()->getId();

        // actualizando campo pago_total en la factura y estado ABONADO
        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);

        // actualizar estado en caso que la factura sea liquidada
        $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
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

    } // fin validate()

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

        );
        } else { // permite ver las facturas del día a otro usuario no administrador
        $query = parent::createQuery($context);
        return new ProxyQuery(
                $query
                        ->where($query->getRootAlias() . ".dateAdd = 'now()'")

        );
        }
    }


}
