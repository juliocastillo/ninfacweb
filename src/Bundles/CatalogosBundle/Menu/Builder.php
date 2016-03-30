<?php
// src/Bundles/CatalogosBundle/Menu/Builder.php

/**
 * Description of Builder
 *
 * @author Julio Castillo
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

        // Agregar nodo principal para las opciones del menú
        $this->menu->addChild('Reportes')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        $this->menu->addChild('Herramientas')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        
        /*
         * Agregando las opciones del nodo principal del menú,
         * invocando una ruta que se encuentra en el service.yml de los Bundles
         *
         */ 
        $this->menu['Reportes']->addChild('Auxiliar diario de productos', array('route' => 'imprimir_auxiliar_producto'));
        $this->menu['Reportes']->addChild('Diario de facturación', array('route' => 'imprimir_diario_factura'));
        $this->menu['Reportes']->addChild('Estado cuentas por cobrar', array('route' => 'imprimir_estado_cuentas_cobrar'));
        
        $this->menu['Herramientas']->addChild('Actualizar saldos', array('route' => 'actualizar_saldos')); //
        
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
