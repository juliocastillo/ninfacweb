<?php

namespace Bundles\CxcBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class MntEmpleadoZonaAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('idEmpleado')
            ->add('idZona')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('idEmpleado')
            ->add('idZona')
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
        $_route = $this->getConfigurationPool()->getContainer()->get('request')->attributes->get('_route');

        if ($_route === 'admin_bundles_cxc_mntempleadozona_create' || $_route === 'admin_bundles_cxc_mntempleadozona_edit') {
            $formMapper
                ->add('idEmpleado',null,array('label'=>'Vendedor','required'=>'true'))
            ;
        }

        $formMapper
            ->add('idZona',null,array(
                'label'=>'Zona',
                'required'=>'true'))
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('idEmpleado')
            ->add('idZona')
        ;
    }
}
