<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ReportsInventarioController
 *
 * @author julio castillo
 * analista programador
 */
namespace Bundles\InventarioBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Knp\Snappy\Pdf;


class ReportsInventarioController extends Controller {
    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/imprimir_auxiliar_producto/{id}", name="imprimir_auxiliar_producto", options={"expose"=true})
     * @Method("GET")
     */
    public function imprimir_auxiliar_productoAction($id) {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        
        /*
         * Usando consulta nativa de symfony
         */

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $producto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id);
        
        /* buscar movimientos del producto*/
        $movimientos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->AuxiliarProducto($id);
        
        $vistaParaImpresion = $this->renderView('BundlesInventarioBundle:Reportes:auxiliar_producto.html.twig', array(
            'id'=>$id,
            'producto' => $producto,
            'empresa' => $empresa,
            'movimientos' => $movimientos
                )
        );

        // invocar la libreria knp_snappy para generar el PDF
        return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($vistaParaImpresion, array(
                    'page-size' => 'Letter',
                    'margin-top' => '15',
                    'margin-right' => '10',
                    'margin-left' => '10',
                    'margin-bottom' => '15',
                    'print-media-type' => true,
                    'title' => 'Kardex',
                    'enable-javascript' => true,
                    'javascript-delay' => 500,
                    'no-pdf-compression' => true)), 200, array(
                        'Content-Type' => 'application/pdf',
                        'Content-Disposition' => 'inline'
                    )
        );
        
    }
    
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
    
    
    
    /**
     * @Route("/auxiliar_producto", name="imprimir_auxiliar_producto", options={"expose"=true})
     * @Method("GET")
     */
    public function auxiliar_productoAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $productos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->findBy(array('activo'=>TRUE));
        
        if (isset($_REQUEST['id'])){
            $id = $_REQUEST['id'];
            $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];
            $movimientos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->AuxiliarProducto($id,$fini,$ffin);
            $nombreproducto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id)->getNOmbre();
            $requestvalid = TRUE; 
        } else {
            $id = '';
            $fini = '';
            $ffin = '';
            $movimientos = "";
            $nombreproducto = "";
            $requestvalid = FALSE;
        }

        
        return $this->render('BundlesInventarioBundle:Reportes:filtrar_auxiliar_producto.html.twig', array(
            'id' => $id,
            'movimientos'=>$movimientos,
            'productos' => $productos,
            'empresa' => $empresa,
            'fini' => $fini,
            'ffin' => $ffin,
            'requetvalid' => $requestvalid,
            'nombreproducto' => $nombreproducto,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }

    
    
    
}
