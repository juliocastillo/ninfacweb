<?php

namespace Bundles\InventarioBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;


class DefaultController extends Controller
{

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
     * Funcion que actualiza saldos del inventario y a la vez inactiva y activa productos-lote
     * por cliente. 
     * 
     * @Route("/actualizar_saldos", name="actualizar_saldos", options={"expose"=true})
     * @Method("GET")
     */
    public function actualizar_saldosAction() {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradas();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarEntradasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidas();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSalidasCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->actualizarSaldos();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->inactivarProductoSaldoCero();
        $em->getRepository('BundlesInventarioBundle:InvProductoMov')->activarProducto();

        return $this->render('BundlesInventarioBundle:Default:actualizar_saldos.html.twig', array(            
            'base_template' => $this->getBaseTemplate(),
            'admin_pool'    => $this->container->get('sonata.admin.pool')
        )
        );
    }
    
    
    /*
     * ANALISTA PROGRAMADOR: Julio Castillo
     */
    /**
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
