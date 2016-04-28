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
    public function diarioFacturacion($id_tipofactura = null, $fini = null,$ffin = null){
        $em = $this->getEntityManager();
        if ($id_tipofactura){
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = id_tipofactura
                WHERE fecha >= '$fini' AND fecha <= '$ffin' AND f.estado != 'ANULADO' AND
                    f.id_tipofactura = '$id_tipofactura'
                ORDER BY f.id_tipofactura, f.numero;
               ";
        }
        else {
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = id_tipofactura
                WHERE fecha >= '$fini' AND fecha <= '$ffin' AND f.estado != 'ANULADO'
                ORDER BY f.id_tipofactura, f.numero;
               ";
        }
        return $em->getConnection()->executeQuery($sql);
    }
    
    /*
     * DESCRIPCION: obtener listado de facturas por vendedor
     * Julio Castillo
     * Analista programador
     */
    public function facturasVendedor($id_tipofactura = null, $fini = null,$ffin = null,$id=null){
        $em = $this->getEntityManager();
        if ($id_tipofactura){
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.nombre AS tipo,
                    t.id AS id_tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = id_tipofactura
                WHERE fecha >= '$fini' AND fecha <= '$ffin' AND id_empleado = '$id' AND f.estado != 'ANULADO' AND
                    f.id_tipofactura = '$id_tipofactura'
                ORDER BY  f.id_tipofactura, f.numero;
               ";
        } else {
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.nombre AS tipo,
                    t.id AS id_tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = id_tipofactura
                WHERE fecha >= '$fini' AND fecha <= '$ffin' AND id_empleado = '$id' AND f.estado != 'ANULADO'
                ORDER BY  f.id_tipofactura, f.numero;
               ";
            
        }
        return $em->getConnection()->executeQuery($sql);
    }

    /*
     * DESCRIPCION: obtener listado de facturas por vendedor
     * Julio Castillo
     * Analista programador
     */
    public function facturasDetalleCliente($id_tipofactura=null, $fini = null,$ffin = null,$id=null){
        $em = $this->getEntityManager();
        if ($id_tipofactura){
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.id AS id_tipo,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total,
                    o.nombre AS nombre_producto,
                    d.precio_unitario,
                    d.cantidad,
                    d.ventas_gravadas
                FROM fac_factura f
                LEFT JOIN ctl_cliente 		c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago 	p ON p.id = f.id_condicionpago
                LEFT JOIN ctl_tipofactura 	t ON t.id = f.id_tipofactura,
		fac_facturadetalle d,
		inv_producto_mov m 
		LEFT JOIN ctl_producto o ON o.id = m.id_producto
                WHERE m.id = d.id_inv_producto_mov AND f.id=d.id_factura AND 
			f.fecha >= '$fini' AND f.fecha <= '$ffin' AND
                        c.id = $id AND f.estado != 'ANULADO' AND
                        f.id_tipofactura = '$id_tipofactura'
                ORDER BY f.id_tipofactura, f.numero
                ";
        } else {
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.id AS id_tipo,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    0 AS descuento,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total,
                    o.nombre AS nombre_producto,
                    d.precio_unitario,
                    d.cantidad,
                    d.ventas_gravadas
                FROM fac_factura f
                LEFT JOIN ctl_cliente 		c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago 	p ON p.id = f.id_condicionpago
                LEFT JOIN ctl_tipofactura 	t ON t.id = f.id_tipofactura,
		fac_facturadetalle d,
		inv_producto_mov m 
		LEFT JOIN ctl_producto o ON o.id = m.id_producto
                WHERE m.id = d.id_inv_producto_mov AND f.id=d.id_factura AND 
			f.fecha >= '$fini' AND f.fecha <= '$ffin' AND
                        c.id = $id AND f.estado != 'ANULADO'
                ORDER BY f.id_tipofactura, f.numero
                ";
        }
        return $em->getConnection()->executeQuery($sql);
    }

    
}
