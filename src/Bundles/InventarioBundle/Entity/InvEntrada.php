<?php

namespace Bundles\InventarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * InvEntrada
 *
 * @ORM\Table(name="inv_entrada", indexes={@ORM\Index(name="IDX_D4AA0BAD96F5D4E9", columns={"id_proveedor"}), @ORM\Index(name="IDX_D4AA0BADBDD17E18", columns={"id_tipoentrada"}), @ORM\Index(name="IDX_D4AA0BAD46D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_D4AA0BADAC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_D4AA0BAD6A540E", columns={"id_estado"})})
 * @ORM\Entity
 */
class InvEntrada
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="inv_entrada_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_add", type="date", nullable=false)
     */
    private $dateAdd;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_mod", type="date", nullable=true)
     */
    private $dateMod;

    /**
     * @var integer
     *
     * @ORM\Column(name="numero", type="integer", nullable=false)
     */
    private $numero;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlProveedor
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlProveedor")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_proveedor", referencedColumnName="id")
     * })
     */
    private $idProveedor;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlAlmacen
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlAlmacen")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_almacen", referencedColumnName="id")
     * })
     */
    private $idAlmacen;
    
    
    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlTipoentrada
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlTipoentrada")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_tipoentrada", referencedColumnName="id")
     * })
     */
    private $idTipoentrada;

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
     * @var \Bundles\CatalogosBundle\Entity\\CtlEstado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEstado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_estado", referencedColumnName="id")
     * })
     */
    private $idEstado;

    
    /**
     *
     * @ORM\OneToMany(targetEntity="InvEntradadetalle", mappedBy="idEntrada", cascade={"all"}, orphanRemoval=true)
     *
     */
    private $entradaDetalle;


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
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return InvEntrada
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
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return InvEntrada
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
     * @return InvEntrada
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
     * Set numero
     *
     * @param integer $numero
     * @return InvEntrada
     */
    public function setNumero($numero)
    {
        $this->numero = $numero;

        return $this;
    }

    /**
     * Get numero
     *
     * @return integer 
     */
    public function getNumero()
    {
        return $this->numero;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     * @return InvEntrada
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
     * Set idProveedor
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlProveedor $idProveedor
     * @return InvEntrada
     */
    public function setIdProveedor(\Bundles\CatalogosBundle\Entity\CtlProveedor $idProveedor = null)
    {
        $this->idProveedor = $idProveedor;

        return $this;
    }

    /**
     * Get idProveedor
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlProveedor 
     */
    public function getIdProveedor()
    {
        return $this->idProveedor;
    }

    
    /**
     * Set idAlmacen
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlAlmacen $idAlmacen
     * @return InvEntrada
     */
    public function setIdAlmacen(\Bundles\CatalogosBundle\Entity\CtlAlmacen $idAlmacen = null)
    {
        $this->idAlmacen = $idAlmacen;

        return $this;
    }

    /**
     * Get idAlmacen
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlAlmacen 
     */
    public function getIdAlmacen()
    {
        return $this->idAlmacen;
    }    
    
    
    /**
     * Set idTipoentrada
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlTipoentrada $idTipoentrada
     * @return InvEntrada
     */
    public function setIdTipoentrada(\Bundles\CatalogosBundle\Entity\CtlTipoentrada $idTipoentrada = null)
    {
        $this->idTipoentrada = $idTipoentrada;

        return $this;
    }

    /**
     * Get idTipoentrada
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlTipoentrada 
     */
    public function getIdTipoentrada()
    {
        return $this->idTipoentrada;
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
     * Set idEstado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEstado $idEstado
     * @return InvEntrada
     */
    public function setIdEstado(\Bundles\CatalogosBundle\Entity\CtlEstado $idEstado = null)
    {
        $this->idEstado = $idEstado;

        return $this;
    }

    /**
     * Get idEstado
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlEstado 
     */
    public function getIdEstado()
    {
        return $this->idEstado;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->entradaDetalle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add entradaDetalle
     *
     * @param \Bundles\InventarioBundle\Entity\InvEntradadetalle $entradaDetalle
     * @return InvEntrada
     */
    public function addEntradaDetalle(\Bundles\InventarioBundle\Entity\InvEntradadetalle $entradaDetalle)
    {
        $this->entradaDetalle[] = $entradaDetalle;

        return $this;
    }

    /**
     * Remove entradaDetalle
     *
     * @param \Bundles\InventarioBundle\Entity\InvEntradadetalle $entradaDetalle
     */
    public function removeEntradaDetalle(\Bundles\InventarioBundle\Entity\InvEntradadetalle $entradaDetalle)
    {
        $this->entradaDetalle->removeElement($entradaDetalle);
    }

    /**
     * Get entradaDetalle
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getEntradaDetalle()
    {
        return $this->entradaDetalle;
    }
    
    public function __toString() {
        return $this->idTipoentrada.' '.$this->numero;
    }
}
