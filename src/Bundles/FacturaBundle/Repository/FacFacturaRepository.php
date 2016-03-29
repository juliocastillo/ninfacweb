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
     * DESCRIPCION: actualizar saldo de lo cobrado.
     * Julio Castillo
     * Analista programador
     */
    public function actualizaPagos($idFactura){
        $em = $this->getEntityManager();
        $sql = "UPDATE fac_factura SET cobro_total =
                (SELECT sum(monto) FROM cxc_cobro WHERE id_factura = '$idFactura' GROUP BY id_factura)
                WHERE id = '$idFactura'";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    
    /*
     * DESCRIPCION: actualizar el estado en base a la evaluación de venta y cobro total
     * Julio Castillo
     * Analista programador
     */
    public function actualizaEstado($idFactura){
        $em = $this->getEntityManager();
        $sql = "UPDATE fac_factura SET estado = 'PAGADO'
                WHERE venta_total <= cobro_total AND estado != 'PAGADO' AND id='$idFactura'";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    
    /*
     * DESCRIPCION: actualizar el estado en base a la evaluación de venta y cobro total
     * Julio Castillo
     * Analista programador
     */
    /*
     * Obtener datos para el reporte de Diario de facturación
     * 
     */
    public function diarioFacturacion($fini = null,$ffin = null){
        $em = $this->getEntityManager();
        $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.subtotal AS ventaneta,
                    f.iva_retenido AS iva,
                    f.venta_total AS total
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = id_tipofactura
                WHERE fecha >= '$fini' AND fecha <= '$ffin'
                ORDER BY f.fecha, f.id_tipofactura;
               ";
        return $em->getConnection()->executeQuery($sql);
    }
    
    
}
