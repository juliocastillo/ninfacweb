<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CxcCobroReporteRepository
 *
 * @author julio castillo
 */

namespace Bundles\CxcBundle\Repository;

use Doctrine\ORM\EntityRepository;


class CxcCobroReporteRepository extends EntityRepository {
     /*
     * DESCRIPCION: Calculo de cobros diarios.
     * Julio Castillo
     * Analista programador
     */
    public function sumaCobrosDia($fecha){
        $fecha = date_format($fecha,'Y-m-d');
        $em = $this->getEntityManager();
        $sql = "SELECT SUM(c.monto) AS monto FROM cxc_cobro c WHERE c.fecha = '$fecha' AND c.activo=TRUE";
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        $result = $result[0];
        return $result;
    }
     /*
     * DESCRIPCION: Cambiar estado a pagados los recibos de cobros
     * Julio Castillo
     * Analista programador
     */
    public function cierreCobrosDia($fecha){
        $fecha = date_format($fecha,'Y-m-d');
        $em = $this->getEntityManager();
        $sql = "UPDATE cxc_cobro SET estado = 'PAGADO' WHERE fecha = '$fecha'";
        $em->getConnection()->executeQuery($sql);
        return;
    }
}
