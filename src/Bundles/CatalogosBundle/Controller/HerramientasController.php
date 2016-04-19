<?php

/*
 * Herramientas para el buen funcionamiento y
 * mantenimiento del sistema nifac
 */

/**
 *
 * @author julio castillo
 * analista programador
 */
namespace Bundles\CatalogosBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class HerramientasController extends Controller {

    /*
     * agregar para usarlo en admin con el templete de sonata
     */
    
    /**
     * @return \Sonata\AdminBundle\Admin\Pool
     */
    protected function getAdminPool()
    {
        return $this->container->get('sonata.admin.pool');
    }
    /**
     * @return \Sonata\AdminBundle\Search\SearchHandler
     */
    protected function getSearchHandler()
    {
        return $this->get('sonata.admin.search.handler');
    }
    /**
     * @param Request $request
     *
     * @return string
     */
    protected function getBaseTemplate(Request $request = null)
    {
        // to be BC
        if (null === $request) {
            $request = $this->getRequest();
        }
        if ($request->isXmlHttpRequest()) {
            return $this->getAdminPool()->getTemplate('ajax');
        }
        return $this->getAdminPool()->getTemplate('layout');
    }
    
    
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    /**
     * Funcion que actualiza saldos del inventario y a la vez inactiva y activa productos-lote
     * por cliente. 
     * 
     * @Route("/actualizar_saldos", name="actualizar_saldos", options={"expose"=true})
     * @Method("GET")
     */
    public function actualizar_saldosAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradas();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidas();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSaldos();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->inactivarProductoSaldoCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->activarProducto();

        return $this->render('BundlesCatalogosBundle:HerramientasController:actualizar_saldos.html.twig', array(            
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );
    }
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    /**
     * Funcion para hacer la copia de respaldo
     * 
     * @Route("/copia_respaldo", name="copia_respaldo", options={"expose"=true})
     * @Method("GET")
     */
    public function copia_respaldoAction() {
        // instanciar el EntityManager
        
        
        /* Respalda una base de datos de postgresql en un archivo ASCII
        * Copyright GPL(C) 2003-2004 Manuel Montoya (wistar@biomedicas.unam.mx)
        * http://www.atenas.ath.cx/members/mmontoya/index.php?idp=48
        */

        //Fecha del backup
        $hoy=(date("d-M-Y"));

        //Nombre del archivo
        $name="/home/julio/Documents/centauro-". $hoy . "-backup";

        //Extensi?n
        $RESPALDO='/home/julio/Documents/copia.sql';

        // Limpio el cache
        header("Pragma: cache");

        // Especifico el mime-type
        //header("Content-type: text/plain;");
        //header("Content-Disposition: attachment; filename=".urlencode($name).".sql");

        //Limpio el cabezal HTTP
        ob_start();

        //Donde est? el pgdump?
        $pg_dump="/usr/bin/pg_dump";

        //Comando
        $comando="pg_dump -i -h localhost -p 5432 -d ninfac -U postgres -f '/home/julio/Documents/copia.sql'";

        //"$comando <b>r"; // s?lo lo pinto para pruebas

        shell_exec("pg_dump -i -h localhost -p 5432 -d ninfac -U backup -f '/home/julio/Documents/copia.sql'");

        //-- Lee el archivo y colocalo en el buffer
        //readfile ('/home/julio/Documents/copia.sql');

//        //-- Lo cierro pero no lo borro (s?lo para pruebas)
        //fclose('/home/julio/Documents/copia.sql');

        //-- Borrar el archivo
        //unlink ('/home/julio/Documents/copia.sql');

        //E voila!!
        
        
        
        
        
        
//        $em = $this->getDoctrine()->getManager();
//        $sql = "SELECT * FROM ctl_cliente";
//        $query = $em->createQuery($sql);
//        $result = $query->getResult();
//        
//        
//        
//        /* buscar el registro padre a traves de id */
//        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        return $this->render('BundlesCatalogosBundle:HerramientasController:copia_respaldo.html.twig', array(
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );
    }
}
