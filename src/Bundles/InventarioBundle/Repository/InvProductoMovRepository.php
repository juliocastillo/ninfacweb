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
     * Analista programador
     */
    public function actualizarEntradas(){
        $em = $this->getEntityManager();
        $sql = "
            UPDATE inv_producto_mov SET cantidad_entrada = (
            SELECT 
            sum(cantidad) 
            FROM inv_entradadetalle f
            WHERE id_inv_producto_mov = inv_producto_mov.id)
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
    public function actualizarSalidas(){
        $em = $this->getEntityManager();
        $sql = "
                UPDATE inv_producto_mov SET cantidad_salida = (
                SELECT 
                sum(cantidad) 
                FROM fac_facturadetalle f
                WHERE id_inv_producto_mov = inv_producto_mov.id)
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
            UPDATE inv_producto_mov SET saldo = cantidad_inicial + cantidad_entrada- cantidad_salida;
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

    
}
