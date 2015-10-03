<?php

namespace Bundles\CxcBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class CxcCobroReporteAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('fecha')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('fecha', null, array(
                    'label' => 'Fecha',
                    'widget' => 'single_text',  // un sólo input para la fecha, no tres.
                    'format' => 'd/m/Y'))
            ->add('totalCredito')
            ->add('estado')
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
        $empleado = new \Bundles\CatalogosBundle\Entity\CtlEmpleado;
        $qry_empleado = $this->modelManager->getEntityManager($empleado)->createQuery('SELECT s FROM \Bundles\CatalogosBundle\Entity\CtlEmpleado s WHERE s.activo = TRUE AND s.idCargofuncional=1');

        $entity = $this->getSubject();   //obtiene el elemento seleccionado en un objeto
        $id = $entity->getId();
        
        $formMapper
            ->add('fecha', null, array(
                    'label' => 'Fecha  (dd/mm/aaaa)',
                    'disabled' => false,
                    'widget' => 'single_text',  // un sólo input para la fecha, no tres.
                    'format' => 'dd/MM/y',
                    'attr'=> array('class'=>'bootstrap-datepicker now',
                        'style'=>'width:300px', 'maxlength' => '25'
                        )))
            ->add('idEmpleado','sonata_type_model', array(
                'empty_value'=>'...ninguno...',
                'label' => 'Responsable de generar el informe',
                'required' => TRUE,
                'btn_add' => FALSE,
                'query' => $qry_empleado,
                'attr' => array(
                    'style'=>'width:500px', 'maxlength' => '25')));
                
                if ($id){  // cuando se edite el registro
                    $formMapper
                        ->add('abonos','text',array(
                            'read_only'=>TRUE,
                            'attr' => array(
                                'style'=>'width:300px', 'maxlength' => '25')))
                        ->add('ventas','text',array(
                            'read_only'=>TRUE,
                            'attr' => array(
                                'style'=>'width:300px', 'maxlength' => '25')))
                        ->add('totalCredito','text',array(
                            'read_only'=>TRUE,
                            'attr' => array(
                                'style'=>'width:300px', 'maxlength' => '25')));
                }
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('fecha')
            ->add('abonos')
            ->add('ventas')
            ->add('totalCredito')
            ->add('estado')
        ;
    }
    
    public function prePersist($cobro) {
        $em = $this->getConfigurationPool()->getContainer()->get('doctrine')->getEntityManager();
        $pago = $em->getRepository('BundlesCxcBundle:CxcCobro')->sumaCobrosDia($cobro->getFecha());
        $cobro->setAbonos($pago['monto']?:0);
        $cobro->setVentas(0);
        $cobro->setTotalCredito($cobro->getAbonos()+$cobro->getVentas());
        $cobro->setEstado('PAGADO');
    }
    
    
    /*
     * permitir cuztomizar las acciones edit, create o show
     */

    public function getTemplate($name) {
        switch ($name) {
            case 'edit':
                $entity = $this->getSubject();   //obtiene el elemento seleccionado en un objeto
                $id = $entity->getId();
                if ($id)  // cuando se edite el registro
                    return 'BundlesCxcBundle:CxcCobroReporteAdmin:edit.html.twig';
                else
                    return 'BundlesCxcBundle:CxcCobroReporteAdmin:create.html.twig';
                break;
//            case 'show':
//                return 'MinsalCatalogosBundle:CtlDiagnosticoHistopatologicoAdmin:show.html.twig';
//                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }
}
