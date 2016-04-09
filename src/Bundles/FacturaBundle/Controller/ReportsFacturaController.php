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

class ReportsFacturaController extends Controller {
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /*! 
      @function num2letras () 
      @abstract Dado un n?mero lo devuelve escrito. 
      @param $num number - N?mero a convertir. 
      @param $fem bool - Forma femenina (true) o no (false). 
      @param $dec bool - Con decimales (true) o no (false). 
      @result string - Devuelve el n?mero escrito en letra. 

    */ 
    function num2letras($num, $fem = false, $dec = true) { 
       $matuni[2]  = "dos"; 
       $matuni[3]  = "tres"; 
       $matuni[4]  = "cuatro"; 
       $matuni[5]  = "cinco"; 
       $matuni[6]  = "seis"; 
       $matuni[7]  = "siete"; 
       $matuni[8]  = "ocho"; 
       $matuni[9]  = "nueve"; 
       $matuni[10] = "diez"; 
       $matuni[11] = "once"; 
       $matuni[12] = "doce"; 
       $matuni[13] = "trece"; 
       $matuni[14] = "catorce"; 
       $matuni[15] = "quince"; 
       $matuni[16] = "dieciseis"; 
       $matuni[17] = "diecisiete"; 
       $matuni[18] = "dieciocho"; 
       $matuni[19] = "diecinueve"; 
       $matuni[20] = "veinte"; 
       $matunisub[2] = "dos"; 
       $matunisub[3] = "tres"; 
       $matunisub[4] = "cuatro"; 
       $matunisub[5] = "quin"; 
       $matunisub[6] = "seis"; 
       $matunisub[7] = "sete"; 
       $matunisub[8] = "ocho"; 
       $matunisub[9] = "nove"; 

       $matdec[2] = "veint"; 
       $matdec[3] = "treinta"; 
       $matdec[4] = "cuarenta"; 
       $matdec[5] = "cincuenta"; 
       $matdec[6] = "sesenta"; 
       $matdec[7] = "setenta"; 
       $matdec[8] = "ochenta"; 
       $matdec[9] = "noventa"; 
       $matsub[3]  = 'mill'; 
       $matsub[5]  = 'bill'; 
       $matsub[7]  = 'mill'; 
       $matsub[9]  = 'trill'; 
       $matsub[11] = 'mill'; 
       $matsub[13] = 'bill'; 
       $matsub[15] = 'mill'; 
       $matmil[4]  = 'millones'; 
       $matmil[6]  = 'billones'; 
       $matmil[7]  = 'de billones'; 
       $matmil[8]  = 'millones de billones'; 
       $matmil[10] = 'trillones'; 
       $matmil[11] = 'de trillones'; 
       $matmil[12] = 'millones de trillones'; 
       $matmil[13] = 'de trillones'; 
       $matmil[14] = 'billones de trillones'; 
       $matmil[15] = 'de billones de trillones'; 
       $matmil[16] = 'millones de billones de trillones'; 

       //Zi hack
       $float=explode('.',$num);
       $num=$float[0];

       $num = trim((string)@$num); 
       if ($num[0] == '-') { 
          $neg = 'menos '; 
          $num = substr($num, 1); 
       }else 
          $neg = ''; 
       while ($num[0] == '0') $num = substr($num, 1); 
       if ($num[0] < '1' or $num[0] > 9) $num = '0' . $num; 
       $zeros = true; 
       $punt = false; 
       $ent = ''; 
       $fra = ''; 
       for ($c = 0; $c < strlen($num); $c++) { 
          $n = $num[$c]; 
          if (! (strpos(".,'''", $n) === false)) { 
             if ($punt) break; 
             else{ 
                $punt = true; 
                continue; 
             } 

          }elseif (! (strpos('0123456789', $n) === false)) { 
             if ($punt) { 
                if ($n != '0') $zeros = false; 
                $fra .= $n; 
             }else 

                $ent .= $n; 
          }else 

             break; 

       } 
       $ent = '     ' . $ent; 
       if ($dec and $fra and ! $zeros) { 
          $fin = ' coma'; 
          for ($n = 0; $n < strlen($fra); $n++) { 
             if (($s = $fra[$n]) == '0') 
                $fin .= ' cero'; 
             elseif ($s == '1') 
                $fin .= $fem ? ' una' : ' un'; 
             else 
                $fin .= ' ' . $matuni[$s]; 
          } 
       }else 
          $fin = ''; 
       if ((int)$ent === 0) return 'Cero ' . $fin; 
       $tex = ''; 
       $sub = 0; 
       $mils = 0; 
       $neutro = false; 
       while ( ($num = substr($ent, -3)) != '   ') { 
          $ent = substr($ent, 0, -3); 
          if (++$sub < 3 and $fem) { 
             $matuni[1] = 'una'; 
             $subcent = 'as'; 
          }else{ 
             $matuni[1] = $neutro ? 'un' : 'uno'; 
             $subcent = 'os'; 
          } 
          $t = ''; 
          $n2 = substr($num, 1); 
          if ($n2 == '00') { 
          }elseif ($n2 < 21) 
             $t = ' ' . $matuni[(int)$n2]; 
          elseif ($n2 < 30) { 
             $n3 = $num[2]; 
             if ($n3 != 0) $t = 'i' . $matuni[$n3]; 
             $n2 = $num[1]; 
             $t = ' ' . $matdec[$n2] . $t; 
          }else{ 
             $n3 = $num[2]; 
             if ($n3 != 0) $t = ' y ' . $matuni[$n3]; 
             $n2 = $num[1]; 
             $t = ' ' . $matdec[$n2] . $t; 
          } 
          $n = $num[0]; 
          if ($n == 1) { 
             $t = ' ciento' . $t; 
          }elseif ($n == 5){ 
             $t = ' ' . $matunisub[$n] . 'ient' . $subcent . $t; 
          }elseif ($n != 0){ 
             $t = ' ' . $matunisub[$n] . 'cient' . $subcent . $t; 
          } 
          if ($sub == 1) { 
          }elseif (! isset($matsub[$sub])) { 
             if ($num == 1) { 
                $t = ' mil'; 
             }elseif ($num > 1){ 
                $t .= ' mil'; 
             } 
          }elseif ($num == 1) { 
             $t .= ' ' . $matsub[$sub] . '?n'; 
          }elseif ($num > 1){ 
             $t .= ' ' . $matsub[$sub] . 'ones'; 
          }   
          if ($num == '000') $mils ++; 
          elseif ($mils != 0) { 
             if (isset($matmil[$sub])) $t .= ' ' . $matmil[$sub]; 
             $mils = 0; 
          } 
          $neutro = true; 
          $tex = $t . $tex; 
       } 
       $tex = $neg . substr($tex, 1) . $fin; 
       //Zi hack --> return ucfirst($tex);
       $end_num=ucfirst($tex).' '.$float[1].'/100 dolares';
       return $end_num; 
    } 
    
    
    
     /*
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
        
        $totalenletras = 'SON: '.$this->num2letras($factura->getVentaTotal());
        
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
                    'numItems'=>$numItems,
                    'totalenletras' => $totalenletras
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
                    'numItems'=>$numItems,
                    'totalenletras' => $totalenletras
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
                    'numItems'=>$numItems,
                    'totalenletras' => $totalenletras
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
                    'numItems'=>$numItems,
                    'totalenletras' => $totalenletras
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
    
    
    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    
     
     /**
     * @Route("/build/report/{name}/{format}/{path}/", name="build_report", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function buildReportAction($name, $format, $path ) {

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
     * @Route("/diario_factura", name="imprimir_diario_factura", options={"expose"=true})
     * @Method("GET")
     */
    public function diario_facturaAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $productos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->findBy(array('activo'=>TRUE));
        
        if (isset($_REQUEST['fini'])){
            $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];
            $movimientos = $em->getRepository('BundlesFacturaBundle:FacFactura')->diarioFacturacion($fini,$ffin);
            $requestvalid = TRUE; 
        } else {
            $fini = Date('Y-m-d');
            $ffin = Date('Y-m-d');
            $movimientos = "";
            $nombreproducto = "";
            $requestvalid = FALSE;
        }

        return $this->render('BundlesFacturaBundle:Reportes:filtrar_diario_factura.html.twig', array(
            'movimientos'=>$movimientos,
            'empresa' => $empresa,
            'fini' => $fini,
            'ffin' => $ffin,
            'requestvalid' => $requestvalid,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }

    
     /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    /**
     * @Route("/facturas_vendedor", name="imprimir_facturas_vendedor", options={"expose"=true})
     * @Method("GET")
     */
    public function facturas_vendedorAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $vendedores = $em->getRepository('BundlesCatalogosBundle:CtlEmpleado')->findBy(array('activo'=>TRUE,'autorizarVenta'=>TRUE));
        
        if (isset($_REQUEST['fini'])){
            $id = $_REQUEST['id'];
            $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];
            $movimientos = $em->getRepository('BundlesFacturaBundle:FacFactura')->facturasVendedor($fini,$ffin,$id);
            $requestvalid = TRUE; 
        } else {
            $id = '';
            $fini = Date('Y-m-d');
            $ffin = Date('Y-m-d');
            $movimientos = "";
            $nombreproducto = "";
            $requestvalid = FALSE;
        }

        return $this->render('BundlesFacturaBundle:Reportes:facturas_vendedor.html.twig', array(
            'id' => $id,
            'vendedores'=>$vendedores,
            'movimientos'=>$movimientos,
            'empresa' => $empresa,
            'fini' => $fini,
            'ffin' => $ffin,
            'requestvalid' => $requestvalid,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );        
    }
    
}
