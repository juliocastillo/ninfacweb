<?php

// src/Bundles/CxcBundle/Repository/CxcCobrosRepository.php

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
    
    
     /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function estadoCuentasCobrar($id_cliente=null, $id_tipofactura=null){
        $em = $this->getEntityManager();
        if ($id_tipofactura && $id_cliente){
            $sql = "
                SELECT 
                    c.nombre AS cliente,
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    (now()::date - (f.fecha::date-'0 day'::interval)) as dias_transcurridos,
                    p.nombre AS condicionpago,
                    f.venta_total,
                    (COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) as cobro_total,
                    (f.venta_total-f.cobro_total) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND
                    (now()::date - (f.fecha::date-'0 day'::interval)) >= '30 days' AND
                    f.id_cliente = '$id_cliente' AND
                    f.estado = 'PENDIENTE' AND
                    f.id_tipofactura = '$id_tipofactura'
                ORDER BY f.id_tipofactura, f.numero";
        } elseif ($id_tipofactura && !$id_cliente) {
            $sql = "
                SELECT 
                    c.nombre AS cliente,
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    (now()::date - (f.fecha::date-'0 day'::interval)) as dias_transcurridos,
                    p.nombre AS condicionpago,
                    f.venta_total,
                    (COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) as cobro_total,
                    (f.venta_total-f.cobro_total) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND
                    (now()::date - (f.fecha::date-'0 day'::interval)) >= '30 days' AND
                    f.estado = 'PENDIENTE' AND
                    f.id_tipofactura = '$id_tipofactura'
                ORDER BY f.id_tipofactura, f.numero";                     
        } elseif (!$id_tipofactura && $id_cliente) {
            $sql = "
                SELECT 
                    c.nombre AS cliente,
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    (now()::date - (f.fecha::date-'0 day'::interval)) as dias_transcurridos,
                    p.nombre AS condicionpago,
                    f.venta_total,
                    (COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) as cobro_total,
                    (f.venta_total-f.cobro_total) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND
                    (now()::date - (f.fecha::date-'0 day'::interval)) >= '30 days' AND
                    f.id_cliente = '$id_cliente' AND
                    f.estado = 'PENDIENTE'
                ORDER BY f.id_tipofactura, f.numero";
                    
        } else {
            $sql = "
                SELECT 
                    c.nombre AS cliente,
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    (now()::date - (f.fecha::date-'0 day'::interval)) as dias_transcurridos,
                    p.nombre AS condicionpago,
                    f.venta_total,
                    (COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0)) as cobro_total,
                    (f.venta_total-f.cobro_total) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND
                    (now()::date - (f.fecha::date-'0 day'::interval)) >= '30 days' AND
                    f.estado = 'PENDIENTE'
                ORDER BY f.id_tipofactura, f.numero";
                    
        }
        return $em->getConnection()->executeQuery($sql);
    }
    
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function cuentasCobrarResumen($id_cliente=null){
        $em = $this->getEntityManager();
        if ($id_cliente){
            $sql = "
                SELECT 
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    CASE WHEN (now()::date - (f.fecha::date-'0 day'::interval)) <= '30 days' THEN (f.venta_total-(COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0))) END AS menor30,
                    CASE WHEN (now()::date - (f.fecha::date-'0 day'::interval)) > '30 days' AND (now()::date - (f.fecha::date-'0 day'::interval)) <= '60 days' THEN (f.venta_total-(COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0))) END AS menor60,
                    CASE WHEN (now()::date - (f.fecha::date-'0 day'::interval)) > '60 days' AND (now()::date - (f.fecha::date-'0 day'::interval)) <= '90 days' THEN (f.venta_total-(COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0))) END AS menor90,
                    CASE WHEN (now()::date - (f.fecha::date-'0 day'::interval)) > '90 days' THEN (f.venta_total-(COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0))) END AS mayor90,
                    (f.venta_total-(COALESCE(f.cobro_total,0) + COALESCE(cobro_total_sin_detalle,0))) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND                    
                    f.id_cliente = '$id_cliente' AND
                    f.estado = 'PENDIENTE'
                ORDER BY f.id_tipofactura, f.numero";
        }
        return $em->getConnection()->executeQuery($sql);
    }
    
    /*
     * DESCRIPCION: Devolver el listado de facturas pendientes de cobros
     * Julio Castillo
     * Analista programador
     */
    public function recibosCobro($fini=null,$ffin=null){
        $em = $this->getEntityManager();
        if ($ffin){
            $sql = "
                    SELECT
                        t01.numero_recibo,
                        t01.fecha,
                        t05.nombre AS condicion_pago,
                        t01.monto AS monto,
                        t02.numero AS factura,
                        t03.nombre AS cliente,
                        t04.nombre AS tipo,
                        t02.venta_total,
                        t02.venta_total - (COALESCE(t02.cobro_total,0) + COALESCE(t02.cobro_total_sin_detalle,0)) AS saldo,
                        t02.estado

                    FROM
                        cxc_cobro 		t01,
                        fac_factura 		t02
                        LEFT JOIN ctl_cliente 	t03 ON t03.id = t02.id_cliente
                        LEFT JOIN ctl_tipofactura	t04 ON t04.id = t02.id_tipofactura
                        LEFT JOIN ctl_condicionpago	t05 ON t05.id = t02.id_condicionpago
                    WHERE
                        t02.id = t01.id_factura AND t01.fecha >= '$fini' AND t01.fecha <= '$ffin'
                    ORDER BY t01.numero_recibo                
                    ";
        }
        return $em->getConnection()->executeQuery($sql);
    }
}
