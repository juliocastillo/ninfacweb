<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Builder
 *
 * @author julio
 */

namespace Bundles\CatalogosBundle\Menu;

use Knp\Menu\FactoryInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\DependencyInjection\ContainerAware;

class Builder extends ContainerAware {

    //put your code here
    private $menu;

    public function mainMenu(FactoryInterface $factory, array $options) {

//       $menu = $factory->createItem('root');
        $this->menu = $factory->createItem('root');
        $this->menu->setChildrenAttribute('class', 'sidebar-menu');

        $admin = $options['admin'];
        $user = $options['user'];

        $this->menu->addChild('Reportes')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
//        $this->menu['Reportes']->addChild('Reporte diario', array('route' => 'imprimir_auxiliar_producto',
//            'routeParameters'=>array('id'=>'3')))
//                ->setLinkAttribute('id', 'reporte1');
        $this->menu['Reportes']->addChild('Auxiliar diario', array('route' => 'imprimir_auxiliar_producto'));

        
        /* Creacion del menu estatico */
        $this->createStaticMenu($user);

        $menu = $this->menu;
        return $menu;
    }


    private function createStaticMenu($user) {
        /*
         * Ejemplo de Creacion de Menu Estatico, descomentar para su funcionamiento
         */
        /* if($user->hasRole('ROLE_USER_LISTAREXPEDIENTES') || $user->hasRole('ROLE_SUPER_ADMIN')) */
          //$this->menu['Reportes']->addChild('Expedientes Creados por Usuario', array('route' => 'bundles_inventario.admin.inv_auxiliar_producto'));
        /* if($user->hasRole('ROLE_USER_BUSCAREMERGENCIA') || $user->hasRole('ROLE_SUPER_ADMIN')){ */
          //$this->menu['IdentificaciÃ³n Paciente']->addChild('Registrar Emergencia', array('route' => 'admin_bundles_siaps_mntpaciente_buscaremergencia'));
          //$this->menu['Reportes']->addChild('Emergencias por Fecha', array('route' => 'admin_bundles_seguimiento_secemergencia_resumen_emergencia'));
          /*} */
    }

}
