<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacFacturadetalle
 *
 * @ORM\Table(name="fac_facturadetalle", indexes={@ORM\Index(name="IDX_C91BC726F760EA80", columns={"id_producto"}), @ORM\Index(name="IDX_C91BC72627760979", columns={"id_factura"})})
 * @ORM\Entity
 */
class FacFacturadetalle
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_facturadetalle_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=2044, nullable=true)
     */
    private $descripcion;

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
     * @ORM\Column(name="ventas_exentas", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ventasExentas;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_gravadas", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ventasGravadas;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_nosujetas", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ventasNosujetas;

    /**
     * @var \Bundles\InventarioBundle\Entity\InvProductoMov
     *
     * @ORM\ManyToOne(targetEntity="Bundles\InventarioBundle\Entity\InvProductoMov")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_inv_producto_mov", referencedColumnName="id")
     * })
     */
    private $idInvProductoMov;

    /**
     * @var \FacFactura
     *
     * @ORM\ManyToOne(targetEntity="FacFactura", inversedBy="facturaDetalle")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_factura", referencedColumnName="id")
     * })
     */
    private $idFactura;
    
    
    
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
     * Set descripcion
     *
     * @param string $descripcion
     * @return FacFacturadetalle
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion
     *
     * @return string 
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * Set cantidad
     *
     * @param string $cantidad
     * @return FacFacturadetalle
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
     * @return FacFacturadetalle
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
     * @return FacFacturadetalle
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
     * @return FacFacturadetalle
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
     * Set ventasNosujetas
     *
     * @param string $ventasNosujetas
     * @return FacFacturadetalle
     */
    public function setVentasNosujetas($ventasNosujetas)
    {
        $this->ventasNosujetas = $ventasNosujetas;

        return $this;
    }

    /**
     * Get ventasNosujetas
     *
     * @return string 
     */
    public function getVentasNosujetas()
    {
        return $this->ventasNosujetas;
    }

    /**
     * Set idInvProductoMov
     *
     * @param \Bundles\InventarioBundle\Entity\InvProductoMov $idInvProductoMov
     * @return FacFacturadetalle
     */
    public function setIdInvProductoMov(\Bundles\InventarioBundle\Entity\InvProductoMov $idInvProductoMov = null)
    {
        $this->idInvProductoMov = $idInvProductoMov;

        return $this;
    }

    /**
     * Get idInvProductoMov
     *
     * @return \Bundles\InventarioBundle\Entity\InvProductoMov 
     */
    public function getIdInvProductoMov()
    {
        return $this->idInvProductoMov;
    }

    /**
     * Set idFactura
     *
     * @param \Bundles\FacturaBundle\Entity\FacFactura $idFactura
     * @return FacFacturadetalle
     */
    public function setIdFactura(\Bundles\FacturaBundle\Entity\FacFactura $idFactura = null)
    {
        $this->idFactura = $idFactura;

        return $this;
    }

    /**
     * Get idFactura
     *
     * @return \Bundles\FacturaBundle\Entity\FacFactura 
     */
    public function getIdFactura()
    {
        return $this->idFactura;
    }
    
    public function __toString() {
        return $this->idInvProductoMov . '';
    }
}
