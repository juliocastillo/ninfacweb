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
            "SELECT * FROM (
                SELECT
                m.fecha AS fecha,
                '1' AS tipo_movimiento,
                m.id AS documento,
                p.nombre,
                m.lote,
                m.cantidad_inicial AS cantidad_inicial,
                0 AS cantidad_entrada,
                0 AS cantidad_salida,
                p.precio_costo AS precio_costo
                FROM
                ctl_producto p
                LEFT JOIN inv_producto_mov m ON m.id_producto = p.id AND m.tipo_mov = 'I'
                WHERE p.id = '$id'
                UNION
                SELECT
                i.fecha AS fecha,
                '2' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                e.cantidad AS cantidad_entrada,
                0 AS cantidad_salida,
                e.precio_unitario AS precio_costo
                FROM
                inv_entrada i, inv_entradadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada
                UNION
                SELECT
                i.fecha AS fecha,
                '3' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
                e.cantidad AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_factura i, fac_facturadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura
                ) d
            ORDER BY lote, tipo_movimiento, fecha";
        }
        else { // devuelve todos los registros de un producto sin importar fecha
            $sql = 
            "SELECT * FROM (
                SELECT
                m.fecha AS fecha,
                '1' AS tipo_movimiento,
                m.id AS documento,
                p.nombre,
                m.lote,
                m.cantidad_inicial AS cantidad_inicial,
                0 AS cantidad_entrada,
                0 AS cantidad_salida,
                p.precio_costo AS precio_costo
                FROM
                ctl_producto p
                LEFT JOIN inv_producto_mov m ON m.id_producto = p.id AND m.tipo_mov = 'I'
                WHERE p.id = '$id'
                UNION
                SELECT
                i.fecha AS fecha,
                '2' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                e.cantidad AS cantidad_entrada,
                0 AS cantidad_salida,
                e.precio_unitario AS precio_costo
                FROM
                inv_entrada i, inv_entradadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada
                UNION
                SELECT
                i.fecha AS fecha,
                '3' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
                e.cantidad AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_factura i, fac_facturadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura
                ) d
            ORDER BY lote, tipo_movimiento, fecha";
        }
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }
}
