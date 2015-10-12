<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MenusBuilder
 *
 * @author julio
 */
namespace Bundles\CatalogosBundle\Menu;

use Knp\Menu\FactoryInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\DependencyInjection\ContainerAware;

class MenusBuilder
{
    private $factory;

    /**
     * @param FactoryInterface $factory
     */
    public function __construct(FactoryInterface $factory)
    {
        $this->factory = $factory;
    }

    public function createMainMenu(Request $request)
    {
        //$menu = $this->factory->createItem('root');

        $menu->addChild('Reporte')->setUri('#comments');
       
        $menu['Reporte']->addChild('reporte1', array('uri' => '/my_comments'));
        $menu['Reporte']->addChild('reporte2', array('uri' => '/my_comments'));
        $menu->addChild('Ayuda', array('route' => ''));
        $menu->addChild('Otros', array('route' => ''));
        $menu->addChild('Home', array('uri' => '/', 'label' => 'Back to homepage'));
        $menu['Home']->setLabel('Back to homepage');
        // ... add more children

        return $menu;
    }
   
    public function createSidebarMenu(Request $request)
    {
        $menu = $this->factory->createItem('sidebar');

        $menu->addChild('Home', array('route' => ''));
        // ... add more children

        return $menu;
    }
}