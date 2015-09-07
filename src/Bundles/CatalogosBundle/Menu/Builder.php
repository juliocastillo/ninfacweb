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
    private $cat = array('AD' => array('label' => 'AdministraciÃ³n', 'icon' => 'glyphicon glyphicon-cog'),
                         'IP' => array('label' => 'IdentificaciÃ³n Paciente', 'icon' => 'glyphicon glyphicon-edit'),
                         'RP' => array('label' => 'Reporte', 'icon' => 'glyphicon glyphicon-file'),
                         'US' => array('label' => 'Usuario', 'icon' => 'glyphicon glyphicon-user'));
   
    public function mainMenu(FactoryInterface $factory, array $options) {
       
//       $menu = $factory->createItem('root');
       $this->menu = $factory->createItem('root');
       $this->menu->setChildrenAttribute('class', 'sidebar-menu');
      
      $admin = $options['admin'];
       $user=$options['user'];
//        /* Creacion del Menu dinamico */
        foreach ($admin as $key => $value) {
//
//            if ($key == "sonata_user")
                $key = "US-1-GestiÃ³n de Usuario";
//
            list($category, $level, $label) = split("-", $key);
//
            $this->createDropDownMenu($value['items'], $this->cat[$category]['label'], $label, $level, $this->cat[$category]['icon']);
        }
      
//       $menu->addChild('home',array('route'=>'homepage'));
//      
//       // access services from the container!
//      
//        // create another menu item
//        $menu->addChild('About Me', array('route' => 'homepage'));
//        // you can also add sub level's to your menu's as follows
//        $menu['About Me']->addChild('Edit profile', array('route' => 'homepage'));
//        $menu->addChild('Home', array('route' => 'homepage'));

        // ... add more children
       
        $this->menu->addChild('Reportes')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'glyphicon glyphicon-file')->setAttribute('class', 'custom-menu');
        $this->menu['Reportes']->addChild('Reporte 1', array('uri' => '#'))
                ->setLinkAttribute('id', 'reporte1');
        $this->menu['Reportes']->addChild('Reporte 2', array('uri' => '#'))
                ->setLinkAttribute('id', 'reporte2');
        $this->menu->addChild('Ayuda')->setUri('#')->setAttribute('dropdown', true)->setAttribute('icon', 'fa fa-question-circle')->setAttribute('class', 'custom-menu');
        $this->menu['Ayuda']->addChild('Acerca de', array('uri' => '#myModal'))
                ->setLinkAttribute('id', 'about_info_modal')
                ->setLinkAttribute('custom-modal', 'true')
                ->setLinkAttribute('role', 'button')
                ->setLinkAttribute('btnCustom', 'true')
                ->setLinkAttribute('data-toggle', 'modal')
                ->setLinkAttribute('tabindex', '-1');

        $this->menu['Ayuda']->addChild('Manual de Usuario', array('uri' => '#'))
                ->setLinkAttribute('id', 'manualUsuario');
        $this->menu->addChild('Redes Sociales', array('route', 'homepage'))->setAttribute('dropdown', true)->setAttribute('icon', 'fa fa-group');
        $this->menu['Redes Sociales']->addChild('Facebook')->setUri('www.facebook.com')
                ->setLinkAttribute('id', 'manualUsuario');
        $this->menu['Redes Sociales']->addChild('Twiter')->setUri('www.twiter.com')
                ->setLinkAttribute('id', 'manualUsuario');
        $this->menu->addChild('MINSAL', array('route', 'homepage'))->setAttribute('dropdown', true)->setAttribute('icon', 'fa fa-building-o');
       
        /* Creacion del menu estatico */
      $this->createStaticMenu($user);

$menu = $this->menu;
        return $menu;
    }
   
    private function countItemsGranted(array $items) {
        $array = array();

        foreach ($items as $key => $object) {
            if ($object->hasroute('list') && $object->isGranted('LIST')) {
                if ($object->getLabel() == "groups") {
                    $array[] = array('label' => "Grupos", 'url' => $object->generateUrl('list'));
                } else if ($object->getLabel() == "users") {
                        $array[] = array('label' => "Usuarios", 'url' => $object->generateUrl('list'));
                    } else {
                        $array[] = array('label' => $object->getLabel(), 'url' => $object->generateUrl('list'));
                    }
            }
        }

        return $array;
    }

    private function createDropDownMenu($object, $catLabel, $label, $level, $icon) {
        $contMenu = $this->countItemsGranted($object);

        if (count($contMenu) != 0) {
            if (!$this->menu[$catLabel]) {
                $this->menu->addChild($catLabel)->setAttribute('dropdown', true)->setAttribute('icon', $icon);
            }

            switch ($level) {
                case '1':
                    foreach ($contMenu as $keya => $itema) {
                        $this->menu[$catLabel]->addChild($itema['label'], array('uri' => $itema['url']));
                    }
                    break;
                case '2':
                    if (!$this->menu[$catLabel][$label]) {
                        $this->menu[$catLabel]->addChild($label)->setAttribute('dropdown', true);
                    }

                    foreach ($contMenu as $keyb => $itemb) {
                        $this->menu[$catLabel][$label]->addChild($itemb['label'], array('uri' => $itemb['url']));
                    }
                    break;

                default:

                    break;
            }
        }
    }

    private function createStaticMenu($user) {
        /*
         * Ejemplo de Creacion de Menu Estatico, descomentar para su funcionamiento
         */
        /*if($user->hasRole('ROLE_USER_LISTAREXPEDIENTES') || $user->hasRole('ROLE_SUPER_ADMIN'))
            $this->menu['Reporte']->addChild('Expedientes Creados por Usuario', array('route' => 'admin_bundles_siaps_mntexpediente_listarexpedientes'));
        if($user->hasRole('ROLE_USER_BUSCAREMERGENCIA') || $user->hasRole('ROLE_SUPER_ADMIN')){
            $this->menu['IdentificaciÃ³n Paciente']->addChild('Registrar Emergencia', array('route' => 'admin_bundles_siaps_mntpaciente_buscaremergencia'));
            $this->menu['Reporte']->addChild('Emergencias por Fecha', array('route' => 'admin_bundles_seguimiento_secemergencia_resumen_emergencia'));
        }*/
    }
}