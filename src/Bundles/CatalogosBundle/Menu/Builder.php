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

        if ($user){ // el menu se activará si ya esta logeado el usuario
        // Agregar nodo principal para las opciones del menú
        $this->menu->addChild('Reportes')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        $this->menu->addChild('Herramientas')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        
        /*
         * Agregando las opciones del nodo principal del menú,
         * invocando una ruta que se encuentra en el service.yml de los Bundles
         *
         */ 
        $this->menu['Reportes']->addChild('Auxiliar de productos', array('route' => 'imprimir_auxiliar_producto'));
        $this->menu['Reportes']->addChild('Inventario al día', array('route' => 'imprimir_inventario_aldia'));
        $this->menu['Reportes']->addChild('Ventas por producto', array('route' => 'imprimir_venta_producto'));
        $this->menu['Reportes']->addChild('Diario de facturación', array('route' => 'imprimir_diario_factura'));
        $this->menu['Reportes']->addChild('Facturas por vendedor', array('route' => 'imprimir_facturas_vendedor'));
        $this->menu['Reportes']->addChild('Factura-Detalle por clientes', array('route' => 'imprimir_facturas_detalle_cliente'));
        $this->menu['Reportes']->addChild('Facturas Anuladas', array('route' => 'imprimir_factura_anulada'));
        $this->menu['Reportes']->addChild('Recibos de cobro', array('route' => 'imprimir_recibos_cobro'));
        $this->menu['Reportes']->addChild('Cuentas por cobrar listado', array('route' => 'imprimir_estado_cuentas_cobrar'));
        $this->menu['Reportes']->addChild('CXC por antiguedad', array('route' => 'imprimir_cuentas_cobrar_resumen'));
        $this->menu['Reportes']->addChild('Historial de movimientos', array('route' => 'historial_imprimir_auxiliar_producto'));
        
        $this->menu['Herramientas']->addChild('Actualizar saldos', array('route' => 'actualizar_saldos')); //
        $this->menu['Herramientas']->addChild('Copia de respaldo', array('route' => 'copia_respaldo')); //
        } else { // la opcion aparecerá si no esta logeado el usuario
            $this->menu->addChild('Acerca de')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        }
        
        /* Creacion del menu estatico */
        $this->createStaticMenu($user);

        $menu = $this->menu;
        return $menu;
    }


    private function createStaticMenu($user) {
        /*
         * Ejemplo de Creacion de Menu Estatico, descomentar para su funcionamiento
         */
        //if($user->hasRole('ROLE_USER_LISTAREXPEDIENTES') || $user->hasRole('ROLE_SUPER_ADMIN')){
          //$this->menu['Reportes']->addChild('Expedientes Creados por Usuario', array('route' => 'bundles_inventario.admin.inv_auxiliar_producto'));
        /* if($user->hasRole('ROLE_USER_BUSCAREMERGENCIA') || $user->hasRole('ROLE_SUPER_ADMIN')){ */
          //$this->menu['IdentificaciÃ³n Paciente']->addChild('Registrar Emergencia', array('route' => 'admin_bundles_siaps_mntpaciente_buscaremergencia'));
          //$this->menu['Reportes']->addChild('Emergencias por Fecha', array('route' => 'admin_bundles_seguimiento_secemergencia_resumen_emergencia'));
         // }
    }

}
