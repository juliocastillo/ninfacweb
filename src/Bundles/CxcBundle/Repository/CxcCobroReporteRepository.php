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
    public function estadoCuentasCobrar($id){
        $em = $this->getEntityManager();
        $sql = "
                SELECT 
                    c.nombre AS cliente,
                    t.nombre AS tipofactura,
                    f.numero,
                    f.fecha,
                    now()-f.fecha AS dias_transcurridos,
                    p.nombre AS condicionpago,
                    f.venta_total,
                    f.cobro_total,
                    (f.venta_total-f.cobro_total) AS saldo
                FROM fac_factura f
                LEFT JOIN ctl_cliente c ON c.id = f.id_cliente
                LEFT JOIN ctl_condicionpago p ON p.id = id_condicionpago
                LEFT JOIN ctl_tipofactura t ON t.id = f.id_tipofactura
                WHERE f.id_condicionpago != 1 AND f.id_cliente = '$id' AND f.estado != 'PENDIENTE'";
        return $em->getConnection()->executeQuery($sql);
    }
}
