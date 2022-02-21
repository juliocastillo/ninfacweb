<?php

namespace Bundles\CxcBundle\Admin;

use Bundles\FacturaBundle\Entity;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\DoctrineORMAdminBundle\Datagrid\ProxyQuery;

class CxcRemesaAdmin extends Admin {

    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('idBanco')
                ->add('fecha', null, array(
                    'label' => 'Fecha',
                    'disabled' => false,
                    'widget' => 'single_text', // un sólo input para la fecha, no tres.
                    'format' => 'dd/MM/y',
                    'attr' => array('class' => 'bootstrap-datepicker now',
                        'style' => 'width:300px', 'maxlength' => '25'
            )))
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('idRemesa', 'integer', array(
                    'label' => 'Id remesa',
                    'attr' => array(
                        'style' => 'width:100px'
            )))
                ->add('fecha', null, array(
                    'label' => 'Fecha  (dd/mm/aaaa)',
                    'disabled' => false,
                    'widget' => 'single_text', // un sólo input para la fecha, no tres.
                    'format' => 'd/m/Y',
                    'attr' => array('class' => 'bootstrap-datepicker now',
                        'style' => 'width:300px', 'maxlength' => '25'
            )))
                ->add('monto')
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
    protected function configureFormFields(FormMapper $formMapper) {

        $formMapper
                ->with('Remesa', array('class' => 'col-md-6'))->end()
                ->with('Totales', array('class' => 'col-md-6'))->end()
                ->with('Recibos', array('class' => 'col-md-12'))->end()
        ;

        $formMapper
                ->with('Remesa')
                ->add('idRemesa', 'integer', array(
                    'attr' => array(
                        'style' => 'width:300px', 'maxlength' => '25'
            )))
                ->add('fecha', null, array(
                    'label' => 'Fecha  (dd/mm/aaaa)',
                    'disabled' => false,
                    'widget' => 'single_text', // un sólo input para la fecha, no tres.
                    'format' => 'dd/MM/y',
                    'attr' => array('class' => 'bootstrap-datepicker now',
                        'style' => 'width:300px', 'maxlength' => '25'
            )))
                ->add('idBanco', 'sonata_type_model', array(
                    'empty_value' => '...ninguno...',
                    'label' => 'Nombre del banco',
                    'required' => FALSE,
                    'btn_add' => FALSE,
                    'attr' => array(
                        'style' => 'width:500px', 'maxlength' => '25'
            )))
                ->end()
                ->with('Totales')
                ->add('monto', null, array(
                    'required' => TRUE,
                    'label' => 'Monto',
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
                ))
                ->add('sumas', null, array(
                    'required' => TRUE,
                    'label' => 'Suma',
                    'read_only' => TRUE,
                    'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
                ))
                ->add('estado', null, array(
                    'required' => TRUE,
                    'read_only' => TRUE,
                    'label' => 'Estado',
                    'attr' => array(
                        'style' => 'width:100px',
                        'maxlength' => '25',
                    ),
                ))
                ->end()
                ->with('Recibos')
                ->add('remesaCobro', 'sonata_type_collection', array(
                    'label' => 'Items'), array(
                    'edit' => 'inline',
                    'inline' => 'table'
                ))
                ->end()
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('id')
                ->add('idRemesa')
                ->add('fecha')
                ->add('monto')
        ;
    }

    /*
     * permitir cuztomizar las acciones edit, create o show
     */

//     public function getTemplate($name) {
//         switch ($name) {
//             case 'create':
//                 return 'BundlesCxcBundle:CRUD:CxcRemesaAdmin/create.html.twig';
//                 break;
//             case 'edit':
//                 return 'BundlesCxcBundle:CRUD:CxcRemesaAdmin/edit.html.twig';
//                 break;
// //            case 'show':
// //                return 'MinsalCatalogosBundle:CtlDiagnosticoHistopatologicoAdmin:show.html.twig';
// //                break;
//             default:
//                 return parent::getTemplate($name);
//                 break;
//         }
//     }

    public function prePersist($remesa) {
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $remesa->setIdUserAdd($user);
        $remesa->setDateAdd(new \DateTime());
        $sumas = 0;
        foreach ($remesa->getRemesaCobro() as $remesaCobro) {
            $remesaCobro->setIdRemesa($remesa);
            $remesaCobro->setIdUserAdd($user);
            $remesaCobro->setDateAdd(new \DateTime());
            $sumas = $sumas + $remesaCobro->getMonto();
        }
        $remesa->setSumas($sumas);
        if ($sumas == $remesa->getMonto()) {
            $remesa->setEstado('COMPLETA');
        } else {
            $remesa->setEstado('PENDIENTE');
        }
    }

    public function postPersist($remesa) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        foreach ($remesa->getRemesaCobro() as $remesaCobro) {
            $idFactura = $remesaCobro->getIdFactura()->getId();
            // actualizando campo pago_total en la factura
            $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);

            // actualizar estado en caso que la factura sea liquidada
            $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
        }
    }

    public function preUpdate($remesa) {
// llenar campos de auditoria

        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $remesa->setIdUserMod($user);
        $remesa->setDateMod(new \DateTime());
        $sumas = 0;
        foreach ($remesa->getRemesaCobro() as $remesaCobro) {
            $remesaCobro->setIdRemesa($remesa);
            if ($remesaCobro->getId()) {
                $remesaCobro->setIdUserMod($user);
                $remesaCobro->setDateMod(new \DateTime());
            } else {
                $remesaCobro->setIdUserAdd($user);
                $remesaCobro->setDateAdd(new \DateTime());
            }
            $sumas = $sumas + $remesaCobro->getMonto();
        }
        $remesa->setSumas($sumas);

        if ($sumas == $remesa->getMonto()) {
            $remesa->setEstado('COMPLETA');
        } else {
            $remesa->setEstado('PENDIENTE');
        }
    }

    public function postUpdate($remesa) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        foreach ($remesa->getRemesaCobro() as $remesaCobro) {
            $idFactura = $remesaCobro->getIdFactura()->getId();
            // actualizando campo pago_total en la factura
            $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaPagos($idFactura);

            // actualizar estado en caso que la factura sea liquidada
            $em->getRepository('BundlesFacturaBundle:FacFactura')->actualizaEstado($idFactura);
        }
    }

    /*
     * funcion para valida si un campo dependiente es obligatorio en base a la ingresado en otro
     */

    public function validate(ErrorElement $errorElement, $remesa) {
        $sumas = 0;
        if ($remesa->getRemesaCobro()) {
            foreach ($remesa->getRemesaCobro() as $remesaCobro) {
                $sumas = $sumas + $remesaCobro->getMonto();
            }
            if ($sumas != $remesa->getMonto()) {
                $errorElement->with('estado')
                        ->addViolation('la remesa no pudo guardarse al calcular nuevamente la sumatoria')
                        ->end();
            }
        }
        if (!$remesa->getRemesaCobro()) {
            $errorElement->with('sumas')
                    ->addViolation('la remesa no esta completa')
                    ->end();
        }
    }

}
