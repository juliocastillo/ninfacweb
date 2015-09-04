<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of FacFacturaRepository
 *
 * @author julio
 */

namespace Bundles\FacturaBundle\Repository;

use Doctrine\ORM\EntityRepository;

class FacFacturaRepository extends EntityRepository {
    /*
     * DESCRIPCION: guardar lo cobrado
     * Julio Castillo
     * Analista programador
     */
    public function sumaPagos($idFactura){
        $em = $this->getEntityManager();
        $sql = "UPDATE fac_factura SET cobro_total =
                (SELECT sum(monto) FROM cxc_cobro WHERE id_factura = '$idFactura' GROUP BY id_factura)
                WHERE id = '$idFactura'";
        $em->getConnection()->executeQuery($sql);
        return;
    }
}
