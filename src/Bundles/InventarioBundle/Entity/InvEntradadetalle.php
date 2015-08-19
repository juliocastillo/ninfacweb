<?php

namespace Bundles\InventarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * InvEntradadetalle
 *
 * @ORM\Table(name="inv_entradadetalle", indexes={@ORM\Index(name="IDX_5F2397A417D40B04", columns={"id_entrada"}), @ORM\Index(name="IDX_5F2397A4F760EA80", columns={"id_producto"})})
 * @ORM\Entity
 */
class InvEntradadetalle
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="inv_entradadetalle_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="comentario", type="string", length=2044, nullable=true)
     */
    private $comentario;

    /**
     * @var string
     *
     * @ORM\Column(name="lote", type="string", length=25, nullable=false)
     */
    private $lote;

    /**
     * @var string
     *
     * @ORM\Column(name="serie", type="string", length=50, nullable=true)
     */
    private $serie;

    /**
     * @var string
     *
     * @ORM\Column(name="modelo", type="string", length=50, nullable=true)
     */
    private $modelo;

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
     * @var \DateTime
     *
     * @ORM\Column(name="fecha_vencimiento", type="date", nullable=true)
     */
    private $fechaVencimiento;

    /**
     * @var \InvEntrada
     *
     * @ORM\ManyToOne(targetEntity="InvEntrada", inversedBy="entradaDetalle")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_entrada", referencedColumnName="id")
     * })
     */
    private $idEntrada;

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
     * Set comentario
     *
     * @param string $comentario
     * @return InvEntradadetalle
     */
    public function setComentario($comentario)
    {
        $this->comentario = $comentario;

        return $this;
    }

    /**
     * Get comentario
     *
     * @return string 
     */
    public function getComentario()
    {
        return $this->comentario;
    }

    /**
     * Set lote
     *
     * @param string $lote
     * @return InvEntradadetalle
     */
    public function setLote($lote)
    {
        $this->lote = $lote;

        return $this;
    }

    /**
     * Get lote
     *
     * @return string 
     */
    public function getLote()
    {
        return $this->lote;
    }

    /**
     * Set serie
     *
     * @param string $serie
     * @return InvEntradadetalle
     */
    public function setSerie($serie)
    {
        $this->serie = $serie;

        return $this;
    }

    /**
     * Get serie
     *
     * @return string 
     */
    public function getSerie()
    {
        return $this->serie;
    }

    /**
     * Set modelo
     *
     * @param string $modelo
     * @return InvEntradadetalle
     */
    public function setModelo($modelo)
    {
        $this->modelo = $modelo;

        return $this;
    }

    /**
     * Get modelo
     *
     * @return string 
     */
    public function getModelo()
    {
        return $this->modelo;
    }

    /**
     * Set cantidad
     *
     * @param string $cantidad
     * @return InvEntradadetalle
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
     * @return InvEntradadetalle
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
     * Set fechaVencimiento
     *
     * @param \DateTime $fechaVencimiento
     * @return InvEntradadetalle
     */
    public function setFechaVencimiento($fechaVencimiento)
    {
        $this->fechaVencimiento = $fechaVencimiento;

        return $this;
    }

    /**
     * Get fechaVencimiento
     *
     * @return \DateTime 
     */
    public function getFechaVencimiento()
    {
        return $this->fechaVencimiento;
    }

    /**
     * Set idEntrada
     *
     * @param \Bundles\InventarioBundle\Entity\InvEntrada $idEntrada
     * @return InvEntradadetalle
     */
    public function setIdEntrada(\Bundles\InventarioBundle\Entity\InvEntrada $idEntrada = null)
    {
        $this->idEntrada = $idEntrada;

        return $this;
    }

    /**
     * Get idEntrada
     *
     * @return \Bundles\InventarioBundle\Entity\InvEntrada 
     */
    public function getIdEntrada()
    {
        return $this->idEntrada;
    }

    /**
     * Set idProducto
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlProducto $idProducto
     * @return InvEntradadetalle
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
