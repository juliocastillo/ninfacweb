<?php

namespace Bundles\CxcBundle\Admin;

use Bundles\FacturaBundle\Entity;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;

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
                ->add('fecha', 'date', array(
                    'widget' => 'single_text',
                    'attr' => array('style' => 'width:100px', 'maxlength' => '10',
                        'format' => 'Y-m-d'),
                ))
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
        ->with('Banco', array('class' => 'col-md-6'))->end()
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
            ->end()
        ->with('Banco')
            ->add('idBanco', 'sonata_type_model', array(
                'empty_value' => '...ninguno...',
                'label' => 'Nombre del banco',
                'required' => FALSE,
                'btn_add' => FALSE,
                'attr' => array(
                    'style' => 'width:500px', 'maxlength' => '25'
                )))
            ->add('monto', null, array(
                'required' => TRUE,
                'label'=>'Monto',
                'attr' => array('style' => 'width:100px', 'maxlength' => '25'),
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
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $remesa->setIdUserAdd($user);
        $remesa->setDateAdd(new \DateTime());

        $remesa->setEstado('PENDIENTE');
    }

    public function preUpdate($remesa) {
        // llenar campos de auditoria
        $user = $this->getConfigurationPool()->getContainer()->get('security.context')->getToken()->getUser();
        $remesa->setIdUserMod($user);
        $remesa->setDateMod(new \DateTime());

        $remesa->setEstado('PENDIENTE');
    }

    public function postPersist($remesa) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
    }

    public function postUpdate($remesa) {
        //accediendo al objeto de una entidad a través del EntityManager
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
    }

}
