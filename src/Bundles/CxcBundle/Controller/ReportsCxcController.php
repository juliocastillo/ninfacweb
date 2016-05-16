<?php

// src/Bundles/CxcBundle/Controller/ReportsCxcController.php

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
     * Funcion que permite crear el reporte de cuentas por cobrar
     * por cliente. 
     * 
     * @Route("/estado_cuentas_cobrar", name="imprimir_estado_cuentas_cobrar", options={"expose"=true})
     * @Method("GET")
     */
    public function estado_cuentas_cobrarAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $clientes = $em->getRepository('BundlesCatalogosBundle:CtlCliente')->findAll();
        
        $tipos = $em->getRepository('BundlesCatalogosBundle:CtlTipofactura')->findAll();
        
        if (isset($_REQUEST['id'])){
            $id_cliente = $_REQUEST['id'];
            $id_tipofactura = $_REQUEST['id_tipofactura'];
            $movimientos = $em->getRepository('BundlesCxcBundle:CxcCobro')->estadoCuentasCobrar($id_cliente,$id_tipofactura);
            $id_tipofactura = $_REQUEST['id_tipofactura'];
            $nombrecliente = "";
            $requestvalid = TRUE; 
        } else {
            $id_cliente = '';
            $id_tipofactura = '';
            $fini = Date('Y-m-d');
            $ffin = Date('Y-m-d');
            $movimientos = "";
            $nombrecliente = "";
            $requestvalid = FALSE;
        }

        
        return $this->render('BundlesCxcBundle:Reportes:filtrar_estado_cuentas_cobrar.html.twig', array(
            'id' => $id_cliente,
            'tipos' => $tipos,
            'id_tipofactura'=>$id_tipofactura,
            'movimientos'=>$movimientos,
            'clientes' => $clientes,
            'empresa' => $empresa,
            'requestvalid' => $requestvalid,
            'nombrecliente' => $nombrecliente,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }
    
    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    /**
     * Funcion que permite crear el reporte de cuentas por cobrar
     * por cliente. 
     * 
     * @Route("/cuentas_cobrar_resumen", name="imprimir_cuentas_cobrar_resumen", options={"expose"=true})
     * @Method("GET")
     */
    public function cuentas_cobrar_resumenAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $clientes = $em->getRepository('BundlesCatalogosBundle:CtlCliente')->findAll();
        
        if (isset($_REQUEST['id_cliente'])){
            $id_cliente = $_REQUEST['id_cliente'];
            $movimientos = $em->getRepository('BundlesCxcBundle:CxcCobro')->cuentasCobrarResumen($id_cliente);
            $nombrecliente = $em->getRepository('BundlesCatalogosBundle:CtlCliente')->find($id_cliente)->getNombre();;
            $requestvalid = TRUE; 
        } else {
            $id_cliente = '';
            $movimientos = "";
            $nombrecliente = "";
            $requestvalid = FALSE;
        }

        
        return $this->render('BundlesCxcBundle:Reportes:cuentas_cobrar_resumen.html.twig', array(
            'id_cliente' => $id_cliente,
            'movimientos'=>$movimientos,
            'clientes' => $clientes,
            'empresa' => $empresa,
            'requestvalid' => $requestvalid,
            'nombrecliente' => $nombrecliente,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
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
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/recibos_cobro", name="imprimir_recibos_cobro", options={"expose"=true})
     * @Method("GET")
     */
    public function recibos_cobroAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));
        
        if (isset($_REQUEST['fini'])){
            $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];
            $movimientos = $em->getRepository('BundlesCxcBundle:CxcCobro')->recibosCobro($fini,$ffin);
            $requestvalid = TRUE; 
        } else {
            $movimientos = "";
            $requestvalid = FALSE;
            $fini = Date('Y-m-d');
            $ffin = Date('Y-m-d');
        }

        
        return $this->render('BundlesCxcBundle:Reportes:recibos_cobro.html.twig', array(
            'fini' => $fini,
            'ffin' => $ffin,
            'movimientos'=>$movimientos,
            'empresa' => $empresa,
            'requestvalid' => $requestvalid,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }
    
    
}
