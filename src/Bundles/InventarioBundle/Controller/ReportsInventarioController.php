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


use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;



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
            if (isset($_REQUEST['saldocero'])) {
                $saldocero = true;
            } else {
                $saldocero = false;
            }
            $movimientos = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->AuxiliarProducto($id);
            $nombreproducto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id)->getNOmbre(). ' '. $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id)->getIdMarca();
            $requestvalid = TRUE;
        } else {
            $id = '';
            $saldocero = false;
            $movimientos = "";
            $nombreproducto = "";
            $requestvalid = FALSE;
        }


        return $this->render('BundlesInventarioBundle:Reportes:filtrar_auxiliar_producto.html.twig', array(
            'id' => $id,
            'movimientos'=>$movimientos,
            'productos' => $productos,
            'saldocero' => $saldocero,
            'empresa' => $empresa,
            'requestvalid' => $requestvalid,
            'nombreproducto' => $nombreproducto,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );
    }

    /**
     * @Route("/historial_auxiliar_producto", name="historial_imprimir_auxiliar_producto", options={"expose"=true})
     * @Method("GET")
     */
    public function historial_auxiliar_productoAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $productos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->findBy(array('activo'=>TRUE));

        $fechascierre = $em->getRepository('BundlesInventarioBundle:InvCierrePeriodo')->findBy(array('activo'=>TRUE));

        if (isset($_REQUEST['id'])){
            $id = $_REQUEST['id'];
            $fecha = $_REQUEST['fecha'];
            $movimientos = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->HistorialAuxiliarProducto($id,$fecha);
            $nombreproducto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id)->getNOmbre();
            $requestvalid = TRUE;
        } else {
            $id = '';
            $movimientos = "";
            $nombreproducto = "";
            $requestvalid = FALSE;
        }


        return $this->render('BundlesInventarioBundle:Reportes:historial_filtrar_auxiliar_producto.html.twig', array(
            'id' => $id,
            'movimientos'=>$movimientos,
            'productos' => $productos,
            'empresa' => $empresa,
            'requestvalid' => $requestvalid,
            'nombreproducto' => $nombreproducto,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool'),
            'fechacierre'   => $fechascierre
        )
        );
    }

    /**
     * @Route("/venta_producto", name="imprimir_venta_producto", options={"expose"=true})
     * @Method("GET")
     */
    public function venta_productoAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        //instanciar la variable request para acceder a todas las variables disponibles
        $request = $this->getRequest();

        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $productos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->findBy(array('activo'=>TRUE));

        $clientes = $em->getRepository('BundlesCatalogosBundle:CtlCliente')->findAll();

        if ($request->get('id')){
            $id = $request->get('id');
            $id_cliente = $request->get('id_cliente');
            $movimientos = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->VentaProducto($id,$request->get('fini'),$request->get('ffin'),$id_cliente);
            $nombreproducto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id)->getNOmbre();
            $requestvalid = TRUE;
            $fini           = $request->get('fini');
            $ffin           = $request->get('ffin');
        } else {
            $id             = '';
            $movimientos    = "";
            $nombreproducto = "";
            $id_cliente     = '';
            $requestvalid   = FALSE;
            $fini           = date_format(new \DateTime(), 'Y-m-d'); //fecha de hoy
            $ffin           = date_format(new \DateTime(), 'Y-m-d'); //fecha de hoy
        }


        return $this->render('BundlesInventarioBundle:Reportes:venta_producto.html.twig', array(
            'id'                => $id,
            'fini'              => $fini,
            'ffin'              => $ffin,
            'movimientos'       => $movimientos,
            'productos'         => $productos,
            'clientes'          => $clientes,
            'id_cliente'        => $id_cliente,
            'empresa'           => $empresa,
            'requestvalid'      => $requestvalid,
            'nombreproducto'    => $nombreproducto,
            'base_template'     => $this->getBaseTemplate(),
            'admin_pool'        => $this->container->get('sonata.admin.pool')
        )
        );
    }

    /**
     * @Route("/inventario_aldia", name="imprimir_inventario_aldia", options={"expose"=true})
     * @Method("GET")
     */
    public function inventario_aldiaAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();
        $request = $this->getRequest();
        !is_null($request->get('id_almacen')) ? $id_almacen = $request->get('id_almacen'): $id_almacen = null ;
        /* buscar el registro padre a traves de id */
        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        $marcas = $em->getRepository('BundlesCatalogosBundle:CtlMarca')->findBy(
                            array('activo'=>TRUE), 
                            array('nombre' => 'ASC')
                        );

        $almacenes = $em->getRepository('BundlesCatalogosBundle:CtlAlmacen')->findBy(
                            array('activo'=>TRUE), 
                            array('nombre' => 'ASC')
                        );

        if (isset($_REQUEST['ffin'])){
            // $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];
            isset($_REQUEST['ocultarsaldoscero']) ? $ocultarsaldoscero = $_REQUEST['ocultarsaldoscero'] : $ocultarsaldoscero=false;
            $id_marca = $_REQUEST['id_marca'];
            $movimientos = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->InventarioAldia($ffin,$id_marca,$id_almacen);
            $requestvalid = TRUE;
        } else {
            $id_marca = '';
            // $fini = Date('Y-m-d');
            $ffin = Date('Y-m-d');
            $movimientos = "";
            $requestvalid = FALSE;
            $ocultarsaldoscero=FALSE;
        }


        return $this->render('BundlesInventarioBundle:Reportes:inventario_aldia.html.twig', array(
            'id_marca'=>$id_marca,
            'marcas'=>$marcas,
            'id_almacen'=>$id_almacen,
            'almacenes'=>$almacenes,
            'movimientos'=>$movimientos,
            'empresa' => $empresa,
            // 'fini' => $fini,
            'ocultarsaldoscero' => $ocultarsaldoscero,
            'ffin' => $ffin,
            'requestvalid' => $requestvalid,
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );
    }

    /**
     * @Route("/exportar_archivo", name="exportar_archivo_csv", options={"expose"=true})
     * @Method("GET")
     */
    public function exportar_archivoAction() {

        $response = new StreamedResponse();
        $response->setCallback(function() {
            $handle = fopen('php://output', 'w+');

            // Add the header of the CSV file
            fputcsv($handle, array('Name', 'Surname', 'Age', 'Sex'),';');
            // Query data from database
            $em = $this->getDoctrine()->getManager();
            $results = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->InventarioAldia('2016-01-01','2016-04-30');
            // Add the data queried from database
            while($row = $em->fetch($results)) {
                fputcsv(
                    $handle, // The file pointer
                    array($row['name'], $row['surname'], $row['age'], $row['sex']), // The fields
                    ';' // The delimiter
                );
            }

            fclose($handle);
        });

        $response->setStatusCode(200);
//        $response->headers->set('Content-Type', 'text/csv; charset=utf-8');
//        $response->headers->set('Content-Disposition', 'attachment; filename="export.csv"');

        return $response;
    }

     /**
     * @Route("/lista/llenaralmacen", name="lista_llenaralmacen", options={"expose"=true})
     * @Method("GET")
     */
    public function listaLlenaralmacen() {
        $request = $this->getRequest();
        $em = $this->getDoctrine()->getManager();
        $marcas = $em->getRepository('BundlesInventarioBundle:InvProductoMov')->getMarcasPorAlmacen($request->get('id_almacen'));
        foreach ($marcas as $marca) {
            $data[] = array('id' => $marca['id'], 'text' => $marca['nombre']);        
        }
       return new Response(json_encode($data));
    }

}
