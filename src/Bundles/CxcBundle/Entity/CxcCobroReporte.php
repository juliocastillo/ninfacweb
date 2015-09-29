<?php

namespace Bundles\CxcBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * CxcCobroReporte
 *
 * @ORM\Table(name="cxc_cobro_reporte", uniqueConstraints={@ORM\UniqueConstraint(name="uk_cobro_reporte", columns={"fecha"})}, indexes={@ORM\Index(name="IDX_E3B9DC50890253C7", columns={"id_empleado"})})
* @UniqueEntity(
 *     fields={"fecha"},
 *     message="Ya existe ya hay un informe en esta fecha"
 *  )
 * @ORM\Entity
 */
class CxcCobroReporte
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cxc_cobro_reporte_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="abonos", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $abonos;

    /**
     * @var string
     *
     * @ORM\Column(name="estado", type="string", length=10, nullable=false)
     */
    private $estado;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="total_credito", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $totalCredito;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventas;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     */
    private $idEmpleado;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set abonos
     *
     * @param string $abonos
     * @return CxcCobroReporte
     */
    public function setAbonos($abonos)
    {
        $this->abonos = $abonos;

        return $this;
    }

    /**
     * Get abonos
     *
     * @return string 
     */
    public function getAbonos()
    {
        return $this->abonos;
    }

    /**
     * Set estado
     *
     * @param string $estado
     * @return CxcCobroReporte
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;

        return $this;
    }

    /**
     * Get estado
     *
     * @return string 
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return CxcCobroReporte
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;

        return $this;
    }

    /**
     * Get fecha
     *
     * @return \DateTime 
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * Set totalCredito
     *
     * @param string $totalCredito
     * @return CxcCobroReporte
     */
    public function setTotalCredito($totalCredito)
    {
        $this->totalCredito = $totalCredito;

        return $this;
    }

    /**
     * Get totalCredito
     *
     * @return string 
     */
    public function getTotalCredito()
    {
        return $this->totalCredito;
    }

    /**
     * Set ventas
     *
     * @param string $ventas
     * @return CxcCobroReporte
     */
    public function setVentas($ventas)
    {
        $this->ventas = $ventas;

        return $this;
    }

    /**
     * Get ventas
     *
     * @return string 
     */
    public function getVentas()
    {
        return $this->ventas;
    }

    /**
     * Set idEmpleado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado
     * @return CxcCobro
     */
    public function setIdEmpleado(\Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado = null)
    {
        $this->idEmpleado = $idEmpleado;

        return $this;
    }

    /**
     * Get idEmpleado
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlEmpleado 
     */
    public function getIdEmpleado()
    {
        return $this->idEmpleado;
    }
    
    
    public function __toString() {
        return 'Reporte ' ?: date_format($this->fecha, 'd/m/Y');
    }
}
