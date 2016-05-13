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
        $sql = "UPDATE fac_factura SET cobro_total = COALESCE(cobro_total_sin_detalle,0) +
                (SELECT sum(monto) FROM cxc_cobro c
                    WHERE c.id_factura = '$idFactura'
                    GROUP BY id_factura), estado = 'PENDIENTE'
                WHERE id = '$idFactura'";
        $em->getConnection()->executeQuery($sql);
        
        //actualizar el estado de los pagos realizados que fueron aplicados a la factura
        $sql = "UPDATE cxc_cobro c SET estado = 'PAGADO'
                WHERE c.id_factura = '$idFactura' AND
                        c.estado='PENDIENTE'";
        $em->getConnection()->executeQuery($sql);
        
        return;
    }
    
    /*
     * DESCRIPCION: actualizar el estado en base a la evaluación de venta y cobro total
     * Julio Castillo
     * Analista programador
     * 
     * actualiza el estado de la factura en base a todos los abotos realizados
     * evalua cantidades pagadas a la factura
     */
    public function actualizaEstado($idFactura){ 
        //actualizar estado de factura en base a los pagos realizados
        $em = $this->getEntityManager();
        $sql = "UPDATE fac_factura SET estado = 'PAGADO'
                WHERE venta_total <= (COALESCE(cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) AND estado != 'PAGADO' AND id='$idFactura'";
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

    /*
     * DESCRIPCION: obtener listado de facturas anuladas
     * Julio Castillo
     * Analista programador
     */
    public function facturaAnulada($id_tipofactura=null, $fini = null,$ffin = null){
        $em = $this->getEntityManager();
        if ($id_tipofactura){
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    a.date_add AS fecha_anulacion,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.id AS id_tipo,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total,
                    m.nombre AS id_motivo_anulacion
                FROM fac_factura_anulada a
                LEFT JOIN fac_factura 		f ON f.id = a.id_factura
                LEFT JOIN ctl_cliente 		c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago 	p ON p.id = f.id_condicionpago
                LEFT JOIN ctl_tipofactura 	t ON t.id = f.id_tipofactura
                LEFT JOIN ctl_motivo_anulacion  m ON m.id = a.id_motivo_anulacion
                WHERE a.date_add >= '$fini' AND a.date_add <= '$ffin' AND
                      f.id_tipofactura = '$id_tipofactura'
                ORDER BY f.id_tipofactura, f.numero
                ";
        } else {
            $sql = " 
                SELECT 
                    f.numero,
                    f.fecha,
                    a.date_add AS fecha_anulacion,
                    c.nombre AS cliente,
                    p.nombre AS condicion,
                    f.id_condicionpago,
                    t.id AS id_tipo,
                    t.nombre AS tipo,
                    f.sumas AS subtotal,
                    f.sumas AS ventaneta,
                    f.iva AS iva,
                    f.venta_total AS total,
                    m.nombre AS id_motivo_anulacion
                FROM fac_factura_anulada a
                LEFT JOIN fac_factura 		f ON f.id = a.id_factura
                LEFT JOIN ctl_cliente 		c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago 	p ON p.id = f.id_condicionpago
                LEFT JOIN ctl_tipofactura 	t ON t.id = f.id_tipofactura
                LEFT JOIN ctl_motivo_anulacion  m ON m.id = a.id_motivo_anulacion
                WHERE a.date_add >= '$fini' AND a.date_add <= '$ffin'
                ORDER BY f.id_tipofactura, f.numero
                ";
        }
        return $em->getConnection()->executeQuery($sql);
    }

    
}
