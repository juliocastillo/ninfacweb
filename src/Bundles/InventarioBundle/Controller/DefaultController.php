<?php

namespace Bundles\InventarioBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Symfony\Component\HttpFoundation\RedirectResponse;


class DefaultController extends Controller
{
    /**
     * @Route("/hello/{name}")
     * @Template()
     */
    public function indexAction($name)
    {
        return array('name' => $name);
    }
    
    /**
     * @Route("/lista_productos")
     * @Template()
     */
    public function listaProductosAction()
    {
        $em = $this->getDoctrine()->getEntityManager();
        $productos = $em->getRepository('CatalogosBundle:CtlProducto')->findAll();
        return $this->render(
            'InventarioBundle:Default:listaProductos.html.twig',
            array('productos' => $productos)
        );
    }

    
    

    
}
