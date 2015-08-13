<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * InvNotaenviodetalle
 *
 * @ORM\Table(name="inv_notaenviodetalle", indexes={@ORM\Index(name="IDX_EE945AD793BCA8A7", columns={"id_notaenvio"}), @ORM\Index(name="IDX_EE945AD7F760EA80", columns={"id_producto"})})
 * @ORM\Entity
 */
class InvNotaenviodetalle
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="inv_notaenviodetalle_id_seq", allocationSize=1, initialValue=1)
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
     * @var \InvNotaenvio
     *
     * @ORM\ManyToOne(targetEntity="InvNotaenvio")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_notaenvio", referencedColumnName="id")
     * })
     */
    private $idNotaenvio;

    /**
     * @var \CtlProducto
     *
     * @ORM\ManyToOne(targetEntity="CtlProducto")
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
     * @return InvNotaenviodetalle
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
     * @return InvNotaenviodetalle
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
     * @return InvNotaenviodetalle
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
     * Set idNotaenvio
     *
     * @param \Bundles\CatalogosBundle\Entity\InvNotaenvio $idNotaenvio
     * @return InvNotaenviodetalle
     */
    public function setIdNotaenvio(\Bundles\CatalogosBundle\Entity\InvNotaenvio $idNotaenvio = null)
    {
        $this->idNotaenvio = $idNotaenvio;

        return $this;
    }

    /**
     * Get idNotaenvio
     *
     * @return \Bundles\CatalogosBundle\Entity\InvNotaenvio 
     */
    public function getIdNotaenvio()
    {
        return $this->idNotaenvio;
    }

    /**
     * Set idProducto
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlProducto $idProducto
     * @return InvNotaenviodetalle
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
}
