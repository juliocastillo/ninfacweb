<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ReporteController
 *
 * @author julio
 */
namespace Bundles\FacturaBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Knp\Snappy\Pdf;

class ReporteController extends Controller {
    
     /*
     * DESCRIPCIÓN: Método que devuelve un JSON con los departamentos de acuerdo
     * al idPais que se envia.
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/factura_000/{id}", name="imprimir_factura", options={"expose"=true})
     * @Method("GET")
     */
    public function factura_000Action($id) {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        
        /*
         * Usando consulta nativa de symfony
         */
        
        /* buscar el registro padre a traves de id */
        $factura = $em->getRepository('BundlesFacturaBundle:FacFactura')->find($id);
        /* buscar los registros hijos a traves del id padre y otros filtros */
        //$muni = $em->getRepository('MinsalCatalogosBundle:Muni')->findBy(array('depto'=>$id,'activo'=>TRUE));
       
        
        /* buscar registro usando SQL*/
        //$muni = $em->getRepository('MinsalCatalogosBundle:Depto')->listarMuni($id);
        
        
        
        // renderizar la vista con los array de las consualtas
        $vistaParaImpresion = $this->renderView('BundlesFacturaBundle:Reportes:factura_000.html.twig', array(
            'id'=>$id,
            'factura'=>$factura
                )
        );

        // invocar la libreria knp_snappy para generar el PDF
        return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($vistaParaImpresion, array(
                    'page-size' => 'Letter',
                    'margin-top' => '10',
                    'margin-right' => '10',
                    'margin-left' => '10',
                    'margin-bottom' => '10',
                    'print-media-type' => true,
                    'title' => 'Factura_000',
                    'enable-javascript' => true,
                    'javascript-delay' => 500,
                    'no-pdf-compression' => true)), 200, array(
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline'
                )
        );
    }
    
    
    //put your code here
}
