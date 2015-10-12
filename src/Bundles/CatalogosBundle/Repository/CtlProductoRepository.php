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

namespace Bundles\CatalogosBundle\Repository;

use Doctrine\ORM\EntityRepository;


class CtlProductoRepository extends EntityRepository {
     /*
     * DESCRIPCION: Reporte Auxiliar de producto (kardex).
     * Julio Castillo
     * Analista programador
     */
    public function AuxiliarProducto($id, $fini = null, $ffin = null){
        $em = $this->getEntityManager();
        if (isset($fini)){ //filtra todos los movimientos de un producto por fechas
            $sql = 
            " SELECT
                *
            FROM
                (SELECT
                  'Entrada' AS tipo_movimiento,
                  pt.fecha as fecha,
                  pt.documento AS documento,
                  (case WHEN (pt.cantidad is not null) THEN pt.cantidad ELSE 0 END) AS cantidad_entrada,
                  (case WHEN (pt.precio_unitario is not null) THEN pt.precio_unitario ELSE 0 END) AS precio_entrada,
                  0 AS cantidad_salida,
                  0 AS precio_salida
                 FROM ctl_producto p
                   LEFT JOIN (SELECT CONCAT(e.numero, ' ' , te.nombre) as documento, e.fecha, ed.lote, ed.id_producto, ed.cantidad, ed.precio_unitario
                               FROM inv_entrada e, inv_entradadetalle ed, ctl_tipoentrada te
                               WHERE e.id = ed.id_entrada AND ed.id_producto = '$id' AND e.id_tipoentrada = te.id AND
                        e.fecha >= '$fini' AND e.fecha <= '$ffin') pt ON pt.id_producto = p.id
                WHERE p.id = '$id'
                UNION
                SELECT
                  'Salida' AS tipo_movimiento,
                  fa.fecha AS fecha,
                  CONCAT(fa.numero,' ' , fa.tipofactura) AS documento,
                  0 AS cant_entrada,
                  0 AS precio_entrada,
                  (case WHEN (fa.cantidad_salida is not null) THEN fa.cantidad_salida ELSE 0 END) AS cantidad_salida,
                  (case WHEN (fa.precio_unitario is not null) THEN fa.precio_unitario ELSE 0 END) AS precio_salida
             FROM ctl_producto p
                  LEFT JOIN (SELECT t.nombre AS tipofactura,f.numero,f.fecha,f.id_cliente,c.nombre AS cliente,c.nombre_comercial,fd.id_producto,fd.cantidad AS cantidad_salida, fd.precio_unitario
                              FROM fac_facturadetalle fd,
                                   fac_factura f
                                   LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                                   LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                              WHERE fd.id_producto = '$id' AND fd.id_factura = f.id  AND
                        f.fecha >= '$fini' AND f.fecha <= '$ffin') fa ON fa.id_producto = p.id
                WHERE p.id = '$id') a
            WHERE
                a.fecha is not null
            ORDER BY a.fecha ASC, a.tipo_movimiento ASC";
        }
        else { // devuelve todos los registros de un producto sin importar fecha
            $sql = 
            " SELECT
                *
            FROM
                (SELECT
                  'Entrada' AS tipo_movimiento,
                  pt.fecha as fecha,
                  pt.documento AS documento,
                  (case WHEN (pt.cantidad is not null) THEN pt.cantidad ELSE 0 END) AS cantidad_entrada,
                  (case WHEN (pt.precio_unitario is not null) THEN pt.precio_unitario ELSE 0 END) AS precio_entrada,
                  0 AS cantidad_salida,
                  0 AS precio_salida
                 FROM ctl_producto p
                   LEFT JOIN (SELECT CONCAT(e.numero, ' ' , te.nombre) as documento, e.fecha, ed.lote, ed.id_producto, ed.cantidad, ed.precio_unitario
                               FROM inv_entrada e, inv_entradadetalle ed, ctl_tipoentrada te
                               WHERE e.id = ed.id_entrada AND ed.id_producto = '$id' AND e.id_tipoentrada = te.id) pt ON pt.id_producto = p.id
                WHERE p.id = '$id'
                UNION
                SELECT
                  'Salida' AS tipo_movimiento,
                  fa.fecha AS fecha,
                  CONCAT(fa.numero,' ' , fa.tipofactura) AS documento,
                  0 AS cant_entrada,
                  0 AS precio_entrada,
                  (case WHEN (fa.cantidad_salida is not null) THEN fa.cantidad_salida ELSE 0 END) AS cantidad_salida,
                  (case WHEN (fa.precio_unitario is not null) THEN fa.precio_unitario ELSE 0 END) AS precio_salida
             FROM ctl_producto p
                  LEFT JOIN (SELECT t.nombre AS tipofactura,f.numero,f.fecha,f.id_cliente,c.nombre AS cliente,c.nombre_comercial,fd.id_producto,fd.cantidad AS cantidad_salida, fd.precio_unitario
                              FROM fac_facturadetalle fd,
                                   fac_factura f
                                   LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                                   LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                              WHERE fd.id_producto = '$id' AND fd.id_factura = f.id) fa ON fa.id_producto = p.id
                WHERE p.id = '$id') a
            WHERE
                a.fecha is not null
            ORDER BY a.fecha ASC, a.tipo_movimiento ASC";
        }
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }
}
