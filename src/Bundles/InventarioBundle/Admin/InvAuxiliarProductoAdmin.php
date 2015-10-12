<?php

namespace Bundles\InventarioBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class InvAuxiliarProductoAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('codigo')
            ->add('nombre')
            ->add('activo')
        ;
    }

    
    
    
    
    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('codigo')
            ->add('nombre')
            ->add('presentacion')
            ->add('precioCosto')
            ->add('precioVenta')
            ->add('activo')
            ->add('_action', 'actions', array(
                'actions' => array(
                    'view'=> array(),
                    'imprimir' => array('template' => 'BundlesInventarioBundle::template_kardex_link.html.twig')
                    )))
        ;
    }


    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('codigo')
            ->add('nombre')
            ->add('presentacion')
        ;
    }

    
//    public function getTemplates($name) {
//        switch ($name) {
//            case 'show':
//                return 'BundlesInventarioBundle:CRUD:InvEntrada/edit.html.twig';
//                break;
//            default:
//                return parent::getTemplate($name);
//                break;
//        }
//    }
    
    
}
