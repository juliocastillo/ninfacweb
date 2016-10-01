<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacNotacreditodetalle
 *
 * @ORM\Table(name="fac_notacreditodetalle", indexes={@ORM\Index(name="index_fac_facturadetalle_id", columns={"id_facturadetalle"}), @ORM\Index(name="index_fac_notacredito_id", columns={"id_notacredito"})})
 * @ORM\Entity
 */
class FacNotacreditodetalle
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_notacreditodetalle_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="cantidad", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $cantidad;

    /**
     * @var string
     *
     * @ORM\Column(name="precio_unitario", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $precioUnitario;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_exentas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventasExentas;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_gravadas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventasGravadas;

    /**
     * @var boolean
     *
     * @ORM\Column(name="historial", type="boolean", nullable=false)
     */
    private $historial;

    
    /**
     * @var \FacNotacredito
     *
     * @ORM\ManyToOne(targetEntity="FacNotacredito", inversedBy="notacreditoDetalle")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_notacredito", referencedColumnName="id")
     * })
     */
    private $idNotacredito;

    
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
     * Set cantidad
     *
     * @param string $cantidad
     * @return FacNotacreditodetalle
     */
    public function setCantidad($cantidad)
    {
        $this->cantidad = $cantidad;

        return $this;
    }

    /**
     * Get cantidad
     *
     * @return string 
     */
    public function getCantidad()
    {
        return $this->cantidad;
    }

    /**
     * Set precioUnitario
     *
     * @param string $precioUnitario
     * @return FacNotacreditodetalle
     */
    public function setPrecioUnitario($precioUnitario)
    {
        $this->precioUnitario = $precioUnitario;

        return $this;
    }

    /**
     * Get precioUnitario
     *
     * @return string 
     */
    public function getPrecioUnitario()
    {
        return $this->precioUnitario;
    }

    /**
     * Set ventasExentas
     *
     * @param string $ventasExentas
     * @return FacNotacreditodetalle
     */
    public function setVentasExentas($ventasExentas)
    {
        $this->ventasExentas = $ventasExentas;

        return $this;
    }

    /**
     * Get ventasExentas
     *
     * @return string 
     */
    public function getVentasExentas()
    {
        return $this->ventasExentas;
    }

    /**
     * Set ventasGravadas
     *
     * @param string $ventasGravadas
     * @return FacNotacreditodetalle
     */
    public function setVentasGravadas($ventasGravadas)
    {
        $this->ventasGravadas = $ventasGravadas;

        return $this;
    }

    /**
     * Get ventasGravadas
     *
     * @return string 
     */
    public function getVentasGravadas()
    {
        return $this->ventasGravadas;
    }

    /**
     * Set historial
     *
     * @param boolean $historial
     * @return FacNotacreditodetalle
     */
    public function setHistorial($historial)
    {
        $this->historial = $historial;

        return $this;
    }

    /**
     * Get historial
     *
     * @return boolean 
     */
    public function getHistorial()
    {
        return $this->historial;
    }

    /**
     * Set idNotacredito
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotacredito $idNotacredito
     * @return FacNotacreditodetalle
     */
    public function setIdNotacredito(\Bundles\FacturaBundle\Entity\FacNotacredito $idNotacredito = null)
    {
        $this->idNotacredito = $idNotacredito;

        return $this;
    }

    /**
     * Get idNotacredito
     *
     * @return \Bundles\FacturaBundle\Entity\FacNotacredito 
     */
    public function getIdNotacredito()
    {
        return $this->idNotacredito;
    }

    /**
     * Set idFacturadetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacFacturadetalle $idFacturadetalle
     * @return FacNotacreditodetalle
     */
    public function setIdFacturadetalle(\Bundles\FacturaBundle\Entity\FacFacturadetalle $idFacturadetalle = null)
    {
        $this->idFacturadetalle = $idFacturadetalle;

        return $this;
    }

    /**
     * Get idFacturadetalle
     *
     * @return \Bundles\FacturaBundle\Entity\FacFacturadetalle 
     */
    public function getIdFacturadetalle()
    {
        return $this->idFacturadetalle;
    }
    
    public function __toString() {
        return $this->id;
    }
}
