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

class CtlClienteRepository extends EntityRepository {

    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function getClienteVendedor($id_vendedor=null, $id_zona=null){
        $where = "";
        if ($id_vendedor!=null){
            $where .= " AND ctl_empleado.id = ".$id_vendedor;
        }

        if ($id_zona!=null){
            $where .= " AND ctl_zona.id = ".$id_zona;
        }

        $em = $this->getEntityManager();
        $sql    = "
            SELECT 
                ctl_cliente.id as id_cliente,
                ctl_cliente.nombre as nombre_cliente,
                ctl_empleado.id as id_empleado,
                ctl_empleado.nombres as nombre_vendedor,
                ctl_zona.id as id_zona,
                ctl_zona.nombre as nombre_zona
            FROM 
                mnt_empleado_zona,
                ctl_cliente,
                ctl_zona,
                ctl_empleado
            WHERE 
                mnt_empleado_zona.id_zona = ctl_zona.id AND 
                mnt_empleado_zona.id_empleado = ctl_empleado.id AND 
                ctl_cliente.id_zona = ctl_zona.id $where
        ";
        return $em->getConnection()->executeQuery($sql);
    }
}
