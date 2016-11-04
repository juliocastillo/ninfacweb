<?php

namespace Bundles\InventarioBundle\Controller;

use Sonata\AdminBundle\Controller\CRUDController;

class InvAuxiliarProductoController extends CRUDController
{
    public function showAction($id = null) {
        // instanciar el EntityManager
        $em = $this->getDoctrine()->getManager();

        $producto = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->find($id);

        $empresa = $em->getRepository('BundlesCatalogosBundle:CfgEmpresa')->findOneBy(array('activo'=>TRUE));

        if (isset($_REQUEST['fini'])){
            $fini = $_REQUEST['fini'];
            $ffin = $_REQUEST['ffin'];

        } else {
            $fini = date('Y-m-d');
            $ffin = date('Y-m-d');
        }

        /* buscar movimientos del producto*/
        $movimientos = $em->getRepository('BundlesCatalogosBundle:CtlProducto')->AuxiliarProducto($id,$fini,$ffin);

        return $this->render('BundlesInventarioBundle:CRUD:InvAuxiliarProducto/show.html.twig', array(
            'id'=>$id,
            'producto' => $producto,
            'empresa' => $empresa,
            'movimientos' => $movimientos,
            'fini' => $fini,
            'ffin' => $ffin
        ));
    }
}
