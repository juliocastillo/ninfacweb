<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ReportsCatalogosController
 *
 * @author julio castillo
 * analista programador
 */
namespace Bundles\CxcBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Knp\Snappy\Pdf;

class ReportsCxcController extends Controller {
     /**
     * @Route("/reports/catalogos/{path}/{name}/{format}/", name="reports_catalogos_clientes", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function reportsCxcAction($path, $name, $format) {

        $parameters = array();
        
        $path = urldecode("%2F".$path."%2F");
        $request = $this->getRequest();
        $jasperReport = $this->container->get('jasper.build.reports');
        $jasperReport->setReportName($name);
        $jasperReport->setReportFormat(strtoupper($format));
        $jasperReport->setReportPath(urldecode($path));
        $jasperReport->setReportParams($parameters);
        return $jasperReport->buildReport();
    }
    
    
    
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/cobros_diarios/{id}", name="imprimir_cobros_diarios", options={"expose"=true})
     * @Method("GET")
     */
    public function cobros_diariosAction($id) {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        
        /*
         * Usando consulta nativa de symfony
         */

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        /* buscar el registro padre a traves de id */
        $reporte = $em->getRepository('BundlesCxcBundle:CxcCobroReporte')->find($id);
        
        /* buscar el registro padre a traves de id */
        $cobros = $em->getRepository('BundlesCxcBundle:CxcCobro')->findBy(array('fecha'=>$reporte->getFecha()));
        
        $vistaParaImpresion = $this->renderView('BundlesCxcBundle:Reportes:cobros_diarios.html.twig', array(
            'id'=>$id,
            'reporte'=>$reporte,
            'empresa'=>$empresa,
            'cobros'=>$cobros
                )
        );

        // invocar la libreria knp_snappy para generar el PDF
        return new Response(
                $this->get('knp_snappy.pdf')->getOutputFromHtml($vistaParaImpresion, array(
                    'page-size' => 'Letter',
                    'margin-top' => '15',
                    'margin-right' => '15',
                    'margin-left' => '15',
                    'margin-bottom' => '15',
                    'print-media-type' => true,
                    'title' => 'Reporte diario de CXC',
                    'enable-javascript' => true,
                    'javascript-delay' => 500,
                    'no-pdf-compression' => true)), 200, array(
                        'Content-Type' => 'application/pdf',
                        'Content-Disposition' => 'inline'
                    )
        );
        
    }
    
    
    
}
