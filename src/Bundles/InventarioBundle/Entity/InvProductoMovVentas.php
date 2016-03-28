<?php

namespace Bundles\InventarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * InvProductoMov
 *
 * @ORM\Table(name="inv_producto_mov", uniqueConstraints={@ORM\UniqueConstraint(name="uk_inv_producto_mov", columns={"id_producto", "lote"}), @ORM\UniqueConstraint(name="unique_id", columns={"id"})})
 * @ORM\Entity
 */
class InvProductoMovVentas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="inv_producto_mov_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

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
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="lote", type="string", length=25, nullable=true)
     */
    private $lote;

    /**
     * @var string
     *
     * @ORM\Column(name="cantidad_inicial", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $cantidadInicial;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha_vencimiento", type="date", nullable=true)
     */
    private $fechaVencimiento;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_add", type="date", nullable=true)
     */
    private $dateAdd;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_mod", type="date", nullable=true)
     */
    private $dateMod;

    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="\Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_add", referencedColumnName="id")
     * })
     */
    private $idUserAdd;

    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="\Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_mod", referencedColumnName="id")
     * })
     */
    private $idUserMod;

    /**
     * @var string
     *
     * @ORM\Column(name="cantidad_entrada", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $cantidadEntrada;

    /**
     * @var string
     *
     * @ORM\Column(name="cantidad_salida", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $cantidadSalida;

    /**
     * @var string
     *
     * @ORM\Column(name="saldo", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $saldo;

    
    /**
     * @var string
     *
     * @ORM\Column(name="tipo_mov", type="string", length=1, nullable=true)
     */
    private $tipo_mov;


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
     * Set idProducto
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlProducto $idProducto
     * @return InvInicial
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

    /**
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return InvProductoMov
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
     * Set lote
     *
     * @param string $lote
     * @return InvProductoMov
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
     * Set tipo_mov
     *
     * @param string $tipo_mov
     * @return InvProductoMov
     */
    public function setTipoMov($tipo_mov)
    {
        $this->tipo_mov = $tipo_mov;

        return $this;
    }

    /**
     * Get tipo_mov
     *
     * @return string 
     */
    public function getTipoMov()
    {
        return $this->tipo_mov;
    }
    
    
    
    /**
     * Set cantidadInicial
     *
     * @param string $cantidadInicial
     * @return InvProductoMov
     */
    public function setCantidadInicial($cantidadInicial)
    {
        $this->cantidadInicial = $cantidadInicial;

        return $this;
    }

    /**
     * Get cantidadInicial
     *
     * @return string 
     */
    public function getCantidadInicial()
    {
        return $this->cantidadInicial;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     * @return InvProductoMov
     */
    public function setActivo($activo)
    {
        $this->activo = $activo;

        return $this;
    }

    /**
     * Get activo
     *
     * @return boolean 
     */
    public function getActivo()
    {
        return $this->activo;
    }

    /**
     * Set fechaVencimiento
     *
     * @param \DateTime $fechaVencimiento
     * @return InvProductoMov
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
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return InvProductoMov
     */
    public function setDateAdd($dateAdd)
    {
        $this->dateAdd = $dateAdd;

        return $this;
    }

    /**
     * Get dateAdd
     *
     * @return \DateTime 
     */
    public function getDateAdd()
    {
        return $this->dateAdd;
    }

    /**
     * Set dateMod
     *
     * @param \DateTime $dateMod
     * @return InvProductoMov
     */
    public function setDateMod($dateMod)
    {
        $this->dateMod = $dateMod;

        return $this;
    }

    /**
     * Get dateMod
     *
     * @return \DateTime 
     */
    public function getDateMod()
    {
        return $this->dateMod;
    }

    /**
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     * @return InvEntrada
     */
    public function setIdUserAdd(\Application\Sonata\UserBundle\Entity\User $idUserAdd = null)
    {
        $this->idUserAdd = $idUserAdd;

        return $this;
    }

    /**
     * Get idUserAdd
     *
     * @return \Application\Sonata\UserBundle\Entity\User
     */
    public function getIdUserAdd()
    {
        return $this->idUserAdd;
    }


    /**
     * Set idUserMod
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserMod
     * @return InvEntrada
     */
    public function setIdUserMod(\Application\Sonata\UserBundle\Entity\User $idUserMod = null)
    {
        $this->idUserMod = $idUserMod;

        return $this;
    }

    /**
     * Get idUserMod
     *
     * @return \Application\Sonata\UserBundle\Entity\User
     */
    public function getIdUserMod()
    {
        return $this->idUserMod;
    }

    /**
     * Set cantidadEntrada
     *
     * @param string $cantidadEntrada
     * @return InvProductoMov
     */
    public function setCantidadEntrada($cantidadEntrada)
    {
        $this->cantidadEntrada = $cantidadEntrada;

        return $this;
    }

    /**
     * Get cantidadEntrada
     *
     * @return string 
     */
    public function getCantidadEntrada()
    {
        return $this->cantidadEntrada;
    }

    /**
     * Set cantidadSalida
     *
     * @param string $cantidadSalida
     * @return InvProductoMov
     */
    public function setCantidadSalida($cantidadSalida)
    {
        $this->cantidadSalida = $cantidadSalida;

        return $this;
    }

    /**
     * Get cantidadSalida
     *
     * @return string 
     */
    public function getCantidadSalida()
    {
        return $this->cantidadSalida;
    }

    /**
     * Set saldo
     *
     * @param string $saldo
     * @return InvProductoMov
     */
    public function setSaldo($saldo)
    {
        $this->saldo = $saldo;

        return $this;
    }

    /**
     * Get saldo
     *
     * @return string 
     */
    public function getSaldo()
    {
        return $this->saldo;
    }
    
    public function __toString() {
        return ''.$this->idProducto;
    }
    
}
