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
        
        $idCliente = $factura->getIdCliente();
        $idNotaremision = $factura->getIdNotaremision();
        
        if (is_null($idNotaremision)){
            $idNotaremision = 0;
        }

        /* buscar el registro padre a traves de id */
        $cliente = $em->getRepository('BundlesCatalogosBundle:CtlCliente')->find($idCliente);
        $notaremision = $em->getRepository('BundlesFacturaBundle:FacNotaremision')->find($idNotaremision);
        $items = $em->getRepository('BundlesFacturaBundle:FacFacturaDetalle')->findBy(array('idFactura'=>$id));
        
        $numItems = count($items);
        
        /* buscar los registros hijos a traves del id padre y otros filtros */
        //$muni = $em->getRepository('MinsalCatalogosBundle:Muni')->findBy(array('depto'=>$id,'activo'=>TRUE));
       
        
        /* buscar registro usando SQL*/
        //$muni = $em->getRepository('MinsalCatalogosBundle:Depto')->listarMuni($id);
        
        $idFormatoDocumento = $factura->getIdFormatoDocumento()->getId();
        $idTipofactura = $factura->getIdTipofactura()->getId();
        var_dump($idTipofactura);
        if ($idTipofactura==1){ //Consumidor final
            $formato = $em->getRepository('BundlesCatalogosBundle:CfgFormatoDocumento')->find($idFormatoDocumento);
            $formatoNombre = $formato->getIdPlantilla()->getNombre();
            if ($formatoNombre == 'factura_cfinal.html.twig'){ //ccf con detalle multiple
                // renderizar la vista con los array de las consualtas
                $vistaParaImpresion = $this->renderView('BundlesFacturaBundle:Reportes:factura_cfinal.html.twig', array(
                    'id'=>$id,
                    'factura'=>$factura,
                    'cliente'=>$cliente,
                    'notaremision'=>$notaremision,
                    'items'=>$items,
                    'formato'=>$formato,
                    'numItems'=>$numItems
                        )
                );
            } elseif($formatoNombre == 'factura_cfinal_manual.html.twig') { //ccf con detalle manual
                // renderizar la vista con los array de las consualtas
                $vistaParaImpresion = $this->renderView('BundlesFacturaBundle:Reportes:factura_ccf_manual.html.twig', array(
                    'id'=>$id,
                    'factura'=>$factura,
                    'cliente'=>$cliente,
                    'notaremision'=>$notaremision,
                    'items'=>$items,
                    'formato'=>$formato,
                    'numItems'=>$numItems
                        )
                );
            }
        } elseif ($idTipofactura==2){ //Factura consumidor final
            $formato = $em->getRepository('BundlesCatalogosBundle:CfgFormatoDocumento')->find($idFormatoDocumento);
            $formatoNombre = $formato->getIdPlantilla()->getNombre();
            if ($formatoNombre == 'factura_ccf.html.twig'){ //factura consumidor final
                // renderizar la vista con los array de las consualtas
                $vistaParaImpresion = $this->renderView('BundlesFacturaBundle:Reportes:factura_ccf.html.twig', array(
                    'id'=>$id,
                    'factura'=>$factura,
                    'cliente'=>$cliente,
                    'notaremision'=>$notaremision,
                    'items'=>$items,
                    'formato'=>$formato,
                    'numItems'=>$numItems
                        )
                );
            } elseif($formatoNombre == 'factura_ccf_manual.html.twig') { //consumidor final detalle manual
                // renderizar la vista con los array de las consualtas
                $vistaParaImpresion = $this->renderView('BundlesFacturaBundle:Reportes:factura_ccf_manual.html.twig', array(
                    'id'=>$id,
                    'factura'=>$factura,
                    'cliente'=>$cliente,
                    'notaremision'=>$notaremision,
                    'items'=>$items,
                    'formato'=>$formato,
                    'numItems'=>$numItems
                        )
                );
            }
        }
        // invocar la libreria knp_snappy para generar el PDF
        return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($vistaParaImpresion, array(
                    'page-size' => $formato->getPapel(),
                    'margin-top' => $formato->getMargenSuperior(),
                    'margin-right' => $formato->getMargenDerecho(),
                    'margin-left' => $formato->getMargenIzquierdo(),
                    'margin-bottom' => $formato->getMargenInferior(),
                    'print-media-type' => true,
                    'title' => 'Factura_ccf',
                    'enable-javascript' => true,
                    'javascript-delay' => 500,
                    'no-pdf-compression' => true)), 200, array(
                        'Content-Type' => 'application/pdf',
                        'Content-Disposition' => 'inline'
                    )
        );
        
    }

}
