<?php

namespace Bundles\CatalogosBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Response;

class CatalogosController extends Controller {

    /**
     * @Route("/hello/{name}")
     * @Template()
     */
    public function indexAction($name) {
        return array('name' => $name);
    }

    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/catalogo/formaspago", name="catalogo_formaspago", options={"expose"=true})
     */
    public function catalogoFormaspagoAction() {
        $em = $this->getDoctrine()->getManager();
        $formaspago = $em->getRepository('BundlesCatalogosBundle:CtlFormapago')->findAll();

        foreach ($formaspago as $f) {
            $formasp["items"][] = array(
                "key" => $f->getId(),
                "value" => $f->getNombre()
            );
        }
        return new Response(json_encode($formasp));
    }
    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */

    /**
     * @Route("/catalogo/bancos", name="catalogo_bancos", options={"expose"=true})
     */
    public function catalogoBancosAction() {
        $em = $this->getDoctrine()->getManager();
        $bancos = $em->getRepository('BundlesCatalogosBundle:CtlBanco')->findAll();

        foreach ($bancos as $f) {
            $array["items"][] = array(
                "key" => $f->getId(),
                "value" => $f->getNombre()
            );
        }
        return new Response(json_encode($array));
    }

}
