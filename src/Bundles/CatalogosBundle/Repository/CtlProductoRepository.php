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
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function crearHistorial($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
            INSERT INTO inv_producto_mov_historial(
                    id_producto, fecha, lote, cantidad_inicial, activo, fecha_vencimiento,
                    date_add, date_mod, id_user_add, id_user_mod, cantidad_entrada,
                    cantidad_salida, saldo, id, tipo_mov,precio_cif, fecha_cierre)
            SELECT id_producto, fecha, lote, cantidad_inicial, activo, fecha_vencimiento,
                    date_add, date_mod, id_user_add, id_user_mod, cantidad_entrada,
                    cantidad_salida, saldo, id, tipo_mov,precio_cif, '$fini' FROM inv_producto_mov
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }

    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function crearSaldoInicial($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
        UPDATE inv_producto_mov SET
        cantidad_inicial = saldo,
        cantidad_entrada = 0, cantidad_salida = 0,
        tipo_mov = 'I',
        fecha = '$fini'
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function enviarDetallesEntradaHistorial($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
        UPDATE inv_entradadetalle SET
            fecha_cierre = '$fini',
            historial = TRUE
    	        WHERE
            id_entrada IN (select e.id from  inv_entrada e, inv_entradadetalle d
                            WHERE e.id = d.id_entrada AND e.fecha <='$fini' AND d.historial is null
                            GROUP BY e.id
                            order by e.id)
            AND historial is null

        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function enviarHistorialMovimientosSalidas($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
                    UPDATE fac_facturadetalle SET
                                fecha_cierre = '$fini',
                                historial = TRUE         
                            WHERE id_factura in (
                                select e.id from  fac_factura e, fac_facturadetalle d
                                WHERE e.id = d.id_factura AND e.fecha <='$fini' AND d.historial is null
                                GROUP BY e.id
                                order by e.id)
                    AND historial is null
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function actualizarPrecioCif($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
        UPDATE inv_producto_mov SET precio_cif =
		(CASE WHEN
			(SELECT AVG(costo_adicional) FROM inv_entradadetalle 
                        WHERE inv_entradadetalle.id_inv_producto_mov = inv_producto_mov.id AND 
                        inv_entradadetalle.costo_adicional > 0 AND 
                        historial is null and inv_entradadetalle.id_inv_producto_mov = inv_producto_mov.id) IS NULL THEN 0
		 ELSE
			(SELECT AVG(costo_adicional) FROM inv_entradadetalle 
                        WHERE inv_entradadetalle.id_inv_producto_mov = inv_producto_mov.id AND 
                        inv_entradadetalle.costo_adicional > 0 AND 
                        historial is null and inv_entradadetalle.id_inv_producto_mov = inv_producto_mov.id)
		 END)
		 WHERE precio_cif = 0;   
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function actualizarPrecioCosto($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
        UPDATE ctl_producto SET precio_costo =
		(CASE WHEN
			(SELECT precio_cif FROM inv_producto_mov 
                        WHERE inv_producto_mov.id_producto = ctl_producto.id AND 
                        inv_producto_mov.precio_cif > 0 AND 
                        inv_producto_mov.tipo_mov = 'E'  ORDER BY id DESC LIMIT 1) IS NULL THEN 0
		 ELSE
			(SELECT precio_cif FROM inv_producto_mov 
                        WHERE inv_producto_mov.id_producto = ctl_producto.id AND 
                        inv_producto_mov.precio_cif > 0 AND 
                        inv_producto_mov.tipo_mov = 'E' ORDER BY id DESC LIMIT 1)
		 END)
		 WHERE precio_costo = 0;    
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de notas de credito del periodo
     * Julio Castillo
     * Analista programador
     */
    public function enviarHistorialDevoluciones($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
       UPDATE fac_notacreditodetalle SET
            fecha_cierre = '$fini',
            historial = TRUE
        WHERE id_notacredito in (
                                select e.id from  fac_notacredito e, fac_notacreditodetalle d
                                WHERE e.id = d.id_notacredito AND e.fecha <='$fini' AND d.historial is null
                                GROUP BY e.id
                                order by e.id)
                    AND historial is null
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function enviarHistorialEntradas($fini=null){
        $em = $this->getEntityManager();
        $sql    = "
        UPDATE inv_entrada SET
        fecha_cierre = '$fini',
        historial = TRUE WHERE historial is null and fecha <= '$fini'
        ";
        $em->getConnection()->executeQuery($sql);
        return;
    }
}
