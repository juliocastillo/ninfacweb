<?php

// src/Bundles/InventarioBundle/Repository/InvProductoMovRepository.php

/**
 * Description of InvProductoMovRepository
 *
 * @author julio castillo
 */

namespace Bundles\InventarioBundle\Repository;

use Doctrine\ORM\EntityRepository;


class InvProductoMovRepository extends EntityRepository {
     /*
     * DESCRIPCION: Calculo de cobros diarios.
     * Julio Castillo
     * Analista programadors
     */
    public function actualizarEntradas($fecha=null){
        /*verifica que los registros aún no hayan sido enviados al historico
         * por cierre de periodo funcion COALESCE para evitar problemas con
         * datos sin ningún valor
         */
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET cantidad_entrada = (
            SELECT
            sum(cantidad)
            FROM inv_entradadetalle f
            WHERE f.id_inv_producto_mov = inv_producto_mov.id AND 
            COALESCE(f.historial,false) != true AND fecha <= '$fecha')
            
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
     /*
     * DESCRIPCION: Actualizar saldo de entrada de producto en base a las devoluciones
     * Julio Castillo
     * Analista programador
     */
    public function actualizarEntradasNotaCredito($fecha=null){
        /*verifica que los registros aún no hayan sido enviados al historico
         * por cierre de periodo funcion COALESCE para evitar problemas con
         * datos sin ningún valor
         */
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET cantidad_entrada = cantidad_entrada +
                (
                SELECT
                COALESCE(sum(cantidad),0)
                FROM fac_notacreditodetalle f
                WHERE f.id_inv_producto_mov = inv_producto_mov.id AND
                    COALESCE(f.historial,false) != true AND fecha <= '$fecha'
                    )
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
     /*
     * DESCRIPCION: Calculo de cobros diarios.
     * Julio Castillo
     * Analista programador
     */
    public function actualizarEntradasCero(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET cantidad_entrada = 0 WHERE cantidad_entrada is null
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }

/*
     * DESCRIPCION: Calculo de cobros diarios.
     * Julio Castillo
     * Analista programador
     */
    public function actualizarSalidas($fecha=null){
        $em = $this->getEntityManager();
        $sql = "
                UPDATE inv_producto_mov SET cantidad_salida = (
                SELECT
                sum(cantidad)
                FROM fac_factura f, fac_facturadetalle d
                WHERE f.id = d.id_factura AND
                d.id_inv_producto_mov = inv_producto_mov.id AND
                f.estado!='ANULADO' AND COALESCE(d.historial,false) != true AND fecha <= '$fecha')
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
     /*
     * DESCRIPCION: Calculo de cobros diarios.
     * Julio Castillo
     * Analista programador
     */
    public function actualizarSalidasCero(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET cantidad_salida = 0 WHERE cantidad_salida is null
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }

    /*
     * DESCRIPCION: Actualizar saldos.
     * Julio Castillo
     * Analista programador
     */
    public function actualizarSaldos(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET saldo = COALESCE(cantidad_inicial,0) +
                COALESCE(cantidad_entrada,0) - COALESCE(cantidad_salida,0);
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }


    /*
     * DESCRIPCION: inactivar producto saldo cero true.
     * Julio Castillo
     * Analista programador
     */
    public function inactivarProductoSaldoCero(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET activo = FALSE WHERE saldo = 0
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }

    /*
     * DESCRIPCION: inactivar producto saldo cero true.
     * Julio Castillo
     * Analista programador
     */
    public function activarProducto(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET activo = TRUE WHERE saldo > 0
            ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: inactivar producto saldo cero true.
     * Julio Castillo
     * Analista programador
     */
    public function recalcularEstadoFacturas(){
        $em = $this->getEntityManager();
        // recalculando facturas para clientes no agentes de retención
        // para clientes no agentes de retencion
        $sql = "
                UPDATE fac_factura SET estado = 'PAGADO'
                    FROM ctl_cliente WHERE venta_total <= (COALESCE(cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) + total_notacredito AND
                    (id_condicionpago = 2 OR id_condicionpago = 3) AND fac_factura.estado != 'ANULADO' AND ctl_cliente.agente_retencion = FALSE;
            ";
        $em->getConnection()->executeQuery($sql);

        // para agentes de retención
        $sql = "
            UPDATE fac_factura SET estado = 'PAGADO'
            FROM ctl_cliente WHERE venta_total <= (COALESCE(cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) + total_notacredito AND
            (id_condicionpago = 2 OR id_condicionpago = 3) AND fac_factura.estado != 'ANULADO' AND ctl_cliente.agente_retencion = FALSE;
            ";
        $em->getConnection()->executeQuery($sql);

        return;
    }

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
				0 AS cantidad_entrada_nc,
                0 AS cantidad_salida,
                p.precio_costo AS precio_costo
                FROM
                ctl_producto p
                LEFT JOIN inv_producto_mov m ON m.id_producto = p.id
                WHERE p.id = '$id'
                UNION /* unir las entradas */
                SELECT
                i.fecha AS fecha,
                '2' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                e.cantidad AS cantidad_entrada,
				0 AS cantidad_entrada_nc,
                0 AS cantidad_salida,
                e.costo_adicional AS precio_costo
                FROM
                inv_entrada i, inv_entradadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada AND COALESCE(e.historial,false) != true
				UNION  /* unir las notas de credito  */
                SELECT
                i.fecha AS fecha,
                '4' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
                e.cantidad AS cantidad_entrada_nc,
				0 AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_notacredito i, fac_notacreditodetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_notacredito AND i.activo = true AND COALESCE(e.historial,false) != true				
                UNION  /* unir las salida  */
                SELECT
                i.fecha AS fecha,
                '3' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
				0 AS cantidad_entrada_nc,
                e.cantidad AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_factura i, fac_facturadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura AND i.estado != 'ANULADO' AND COALESCE(e.historial,false) != true
                ) d
            ORDER BY fecha, lote, tipo_movimiento";
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
				0 AS cantidad_entrada_nc,
                0 AS cantidad_salida,
                p.precio_costo AS precio_costo
                FROM
                ctl_producto p
                LEFT JOIN inv_producto_mov m ON m.id_producto = p.id
                WHERE p.id = '$id'
                UNION /* unir las entradas */
                SELECT
                i.fecha AS fecha,
                '2' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                e.cantidad AS cantidad_entrada,
				0 AS cantidad_entrada_nc,
                0 AS cantidad_salida,
                e.costo_adicional AS precio_costo
                FROM
                inv_entrada i, inv_entradadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada AND COALESCE(e.historial,false) != true
				UNION  /* unir las notas de credito  */
                SELECT
                i.fecha AS fecha,
                '4' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
                e.cantidad AS cantidad_entrada_nc,
				0 AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_notacredito i, fac_notacreditodetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_notacredito AND i.activo = true AND COALESCE(e.historial,false) != true				
                UNION  /* unir las salida  */
                SELECT
                i.fecha AS fecha,
                '3' AS tipo_movimiento,
                i.numero AS documento,
                '??' AS nombre,
                m.lote,
                0 AS cantidad_inicial,
                0 AS cantidad_entrada,
				0 AS cantidad_entrada_nc,
                e.cantidad AS cantidad_salida,
                0 AS precio_costo
                FROM
                fac_factura i, fac_facturadetalle e
                INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura AND i.estado != 'ANULADO' AND COALESCE(e.historial,false) != true
                ) d
            ORDER BY fecha, lote, tipo_movimiento";
        }
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }


         /*
     * DESCRIPCION: Reporte Historial Auxiliar de producto (kardex).
     * Julio Castillo
     * Analista programador
     */
    public function HistorialAuxiliarProducto($id, $fini = null){
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
                LEFT JOIN inv_producto_mov_historial m ON m.id_producto = p.id
                WHERE
                    m.fecha_cierre = '$fini' AND
                    p.id = '$id'
                UNION /* unir las entradas al inventario*/
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
                INNER JOIN inv_producto_mov_historial m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada AND COALESCE(e.historial,false) = true AND
                e.fecha_cierre = '$fini'
                UNION /* unir las salidas del inventario */
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
                INNER JOIN inv_producto_mov_historial m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura AND i.estado != 'ANULADO' AND COALESCE(e.historial,false) = true AND
                e.fecha_cierre = '$fini'
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
                LEFT JOIN inv_producto_mov_historial m ON m.id_producto = p.id AND m.tipo_mov = 'I'
                WHERE
                 m.fecha_cierre = '$fini' AND p.id = '$id'
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
                INNER JOIN inv_producto_mov_historial m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_entrada  AND COALESCE(e.historial,false) = true AND
                e.fecha_cierre = '$fini'
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
                INNER JOIN inv_producto_mov_historial m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
                WHERE i.id = e.id_factura AND i.estado != 'ANULADO' AND COALESCE(e.historial,false) = true
                ) d
            ORDER BY lote, tipo_movimiento, fecha";
        }
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }





	/*
     * DESCRIPCION: Reporte Auxiliar de producto (kardex).
     * Julio Castillo
     * Analista programador
     */
    public function VentaProducto($id, $fini = null, $ffin = null, $id_cliente = null){
        $em = $this->getEntityManager();
        if ($id_cliente != NULL ){ $where = " AND i.id_cliente = '$id_cliente'"; } else {$where = ""; }
        $sql =
        "SELECT
            i.fecha AS fecha,
            '3' AS tipo_movimiento,
            t.nombre AS tipo,
            i.numero AS numero,
            c.nombre AS cliente,
            m.lote,
            e.cantidad AS cantidad_salida,
            precio_unitario AS precio_unitario
            FROM
            fac_factura i, ctl_tipofactura t, ctl_cliente c, fac_facturadetalle e
            INNER JOIN inv_producto_mov m ON m.id = e.id_inv_producto_mov AND m.id_producto = '$id'
            WHERE i.id = e.id_factura AND i.id_tipofactura = t.id AND i.id_cliente = c.id AND
                i.fecha >= '$fini' AND i.fecha <= '$ffin' $where ";
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }

    /*
     * DESCRIPCION: Reporte Auxiliar de producto (kardex).
     * Julio Castillo
     * Analista programador
     */
    public function InventarioAldia($ffin = null, $id_marca = null){
        $em = $this->getEntityManager();
        $fini = null;
        if ($id_marca!='000'){ $where = "WHERE t02.id_marca = '$id_marca'"; } else {$where = ""; }

        if (isset($ffin)){ //filtra todos los movimientos de un producto por fechas
            $sql =
            "SELECT
                    t02.nombre,
                    t02.precio_costo,
                    t01.lote,
                    t01.fecha_vencimiento AS vence,
                    t01.cantidad_inicial,
                    t03.cantidad AS cantidad_entrada,
                    t04.cantidad AS cantidad_salida,
                    CASE
                        WHEN (t01.tipo_mov = 'I') THEN
                            t01.precio_cif
                        ELSE
                            t03.preciocif_entrada
                        END AS preciocif
            FROM    inv_producto_mov 	t01
                    LEFT JOIN ctl_producto	t02 ON t02.id = t01.id_producto
                    LEFT JOIN (SELECT id_inv_producto_mov, sum(cantidad) AS cantidad, avg(costo_adicional) AS preciocif_entrada FROM inv_entradadetalle d, inv_entrada e WHERE d.id_entrada = e.id AND e.fecha <= '$ffin'  AND COALESCE(d.historial,false) != true GROUP BY id_inv_producto_mov) t03 ON t03.id_inv_producto_mov = t01.id
                    LEFT JOIN (SELECT id_inv_producto_mov, SUM(cantidad) AS cantidad FROM fac_facturadetalle d, fac_factura f WHERE d.id_factura = f.id AND f.fecha <= '$ffin' AND f.estado != 'ANULADO'  AND COALESCE(d.historial,false) != true GROUP BY id_inv_producto_mov) t04 ON t04.id_inv_producto_mov = t01.id
            $where
            ORDER BY t02.nombre,t02.id_categoria,t01.lote";
        }
        else { // devuelve todos los registros de un producto sin importar fecha
            $sql =
            "SELECT
                    t02.nombre,
                    t02.precio_costo,
                    t01.lote,
                    t01.cantidad_inicial,
                    t03.cantidad AS cantidad_entrada,
                    t04.cantidad AS cantidad_salida
            FROM
                    inv_producto_mov 	t01
                    LEFT JOIN ctl_producto	t02 ON t02.id = t01.id_producto
                    LEFT JOIN (SELECT id_inv_producto_mov, sum(cantidad) AS cantidad FROM inv_entradadetalle d, inv_entrada e WHERE d.id_entrada = e.id AND e.fecha <= '$ffin' GROUP BY id_inv_producto_mov) t03 ON t03.id_inv_producto_mov = t01.id
                    LEFT JOIN (SELECT id_inv_producto_mov, SUM(cantidad) AS cantidad FROM fac_facturadetalle d, fac_factura f WHERE d.id_factura = f.id AND f.fecha <= '$ffin' AND f.estado != 'ANULADO' GROUP BY id_inv_producto_mov) t04 ON t04.id_inv_producto_mov = t01.id
            $where
            ORDER BY t02.nombre,t02.id_categoria,t01.lote";
        }
        $result = $em->getConnection()->executeQuery($sql)->fetchAll();
        return $result;
    }

}
