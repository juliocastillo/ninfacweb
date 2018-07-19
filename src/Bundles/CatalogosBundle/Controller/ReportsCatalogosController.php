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
namespace Bundles\CatalogosBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class ReportsCatalogosController extends Controller {
     /**
     * @Route("/repocatalogos/clientes/{path}/{name}/{format}/", name="reports_catalogos_clientes", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function repocatalogosClientesAction($path, $name, $format) {

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

     /**
     * @Route("/repocatalogos/empleados/{path}/{name}/{format}/", name="repocatalogos_empleados", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function repocatalogosEmpleadosAction($path, $name, $format) {

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
    

     /**
     * @Route("/repocatalogos/productos/{path}/{name}/{format}/", name="repocatalogos_productos", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function repocatalogosProductosAction($path, $name, $format) {

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
    
     /**
     * @Route("/get/municipios", name="get_municipios", options={"expose"=true})
     * @Method("GET")
     *
     */
    public function getMunicipiosAction() {
        $request = $this->getRequest();
//        var_dump($request);exit();
        $id_departamento = $request->get('depto');
        $sql = "
            SELECT id, nombre FROM ctl_municipio WHERE id_departamento = ".$id_departamento;

        $stm = $this->container->get('database_connection')->prepare($sql);
        $stm->execute();
        $result = $stm->fetchAll();

        return new Response(json_encode($result));
    }
}
