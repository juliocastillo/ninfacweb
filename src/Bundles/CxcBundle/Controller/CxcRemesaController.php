<?php

namespace Bundles\CxcBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Response;

class CxcRemesaController extends Controller
{
    /**
     * @Route("/hello/{name}")
     * @Template()
     */
    public function indexAction($name)
    {
        return array('name' => $name);
    }
    
    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/remesas/facturas/{numero_factura}", name="remesas_facturas", options={"expose"=true})
     */
    public function remesasFacturasAction($numero_factura) {
        $em = $this->getDoctrine()->getManager();
        $facturas = $em->getRepository('BundlesFacturaBundle:FacFactura')->getFactura($numero_factura); //entrada

        foreach ($facturas as $f) {
            $array["items"][] = array(
                "key" => $f->getId(),
                "value" => $f->getNombre()
            );
        }
        return new Response(json_encode($array));
    }
    
}
