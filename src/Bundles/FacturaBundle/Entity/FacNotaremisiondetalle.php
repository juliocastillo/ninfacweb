<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacNotaremisiondetalle
 *
 * @ORM\Table(name="fac_notaremisiondetalle", indexes={@ORM\Index(name="IDX_59A630888FB1E60D", columns={"id_notaremision"}), @ORM\Index(name="IDX_59A63088F760EA80", columns={"id_producto"})})
 * @ORM\Entity
 */
class FacNotaremisiondetalle
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_notaremisiondetalle_id_seq", allocationSize=1, initialValue=1)
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
     * @ORM\Column(name="total", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $total;

    /**
     * @var \FacNotaremision
     *
     * @ORM\ManyToOne(targetEntity="FacNotaremision", inversedBy="facnotaremisionDetalle")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_notaremision", referencedColumnName="id")
     * })
     */
    private $idNotaremision;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlProducto
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlProducto")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_producto", referencedColumnName="id")
     * })
     */
    private $idProducto;



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
     * @return FacNotaremisiondetalle
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
     * @return FacNotaremisiondetalle
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
     * Set total
     *
     * @param string $total
     * @return FacNotaremisiondetalle
     */
    public function setTotal($total)
    {
        $this->total = $total;

        return $this;
    }

    /**
     * Get total
     *
     * @return string 
     */
    public function getTotal()
    {
        return $this->total;
    }

    /**
     * Set idNotaremision
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotaremision $idNotaremision
     * @return FacNotaremisiondetalle
     */
    public function setIdNotaremision(\Bundles\FacturaBundle\Entity\FacNotaremision $idNotaremision = null)
    {
        $this->idNotaremision = $idNotaremision;

        return $this;
    }

    /**
     * Get idNotaremision
     *
     * @return \Bundles\FacturaBundle\Entity\FacNotaremision 
     */
    public function getIdNotaremision()
    {
        return $this->idNotaremision;
    }

    /**
     * Set idProducto
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlProducto $idProducto
     * @return FacNotaremisiondetalle
     */
    public function setIdProducto(\Bundles\CatalogosBundle\Entity\CtlProducto $idProducto = null)
    {
        $this->idProducto = $idProducto;

        return $this;
    }

    /**
     * Get idProducto
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlProducto 
     */
    public function getIdProducto()
    {
        return $this->idProducto;
    }
    
    public function __toString() {
        return $this->idProducto;
    }
}
