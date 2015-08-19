<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacNotaremision
 *
 * @ORM\Table(name="fac_notaremision", indexes={@ORM\Index(name="IDX_744D2C9B2A813255", columns={"id_cliente"}), @ORM\Index(name="IDX_744D2C9B46D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_744D2C9BAC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_744D2C9B38BCA62A", columns={"id_condicionpago"}), @ORM\Index(name="IDX_744D2C9B6A540E", columns={"id_estado"})})
 * @ORM\Entity
 */
class FacNotaremision
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_notaremision_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

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
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var integer
     *
     * @ORM\Column(name="numero", type="integer", nullable=false)
     */
    private $numero;

    /**
     * @var string
     *
     * @ORM\Column(name="venta_total", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventaTotal;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlCliente
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlCliente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cliente", referencedColumnName="id")
     * })
     */
    private $idCliente;

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
     * @var \Bundles\CatalogosBundle\Entity\CtlCondicionpago
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlCondicionpago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_condicionpago", referencedColumnName="id")
     * })
     */
    private $idCondicionpago;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlEstado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEstado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_estado", referencedColumnName="id")
     * })
     */
    private $idEstado;

    /**
     *
     * @ORM\OneToMany(targetEntity="FacNotaremisiondetalle", mappedBy="idNotaremision", cascade={"all"}, orphanRemoval=true)
     *
     */
    private $facnotaremisionDetalle;
    
    

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
     * Set activo
     *
     * @param boolean $activo
     * @return FacNotaremision
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
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return FacNotaremision
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
     * @return FacNotaremision
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
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return FacNotaremision
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
     * Set numero
     *
     * @param integer $numero
     * @return FacNotaremision
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
     * Set ventaTotal
     *
     * @param string $ventaTotal
     * @return FacNotaremision
     */
    public function setVentaTotal($ventaTotal)
    {
        $this->ventaTotal = $ventaTotal;

        return $this;
    }

    /**
     * Get ventaTotal
     *
     * @return string 
     */
    public function getVentaTotal()
    {
        return $this->ventaTotal;
    }

    /**
     * Set idCliente
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCliente $idCliente
     * @return FacNotaremision
     */
    public function setIdCliente(\Bundles\CatalogosBundle\Entity\CtlCliente $idCliente = null)
    {
        $this->idCliente = $idCliente;

        return $this;
    }

    /**
     * Get idCliente
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlCliente 
     */
    public function getIdCliente()
    {
        return $this->idCliente;
    }

    /**
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     * @return FacNotaremision
     */
    public function setIdUserAdd(\Bundles\FacturaBundle\Entity\FosUserUser $idUserAdd = null)
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
     * @return FacNotaremision
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
     * Set idCondicionpago
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCondicionpago $idCondicionpago
     * @return FacNotaremision
     */
    public function setIdCondicionpago(\Bundles\CatalogosBundle\Entity\CtlCondicionpago $idCondicionpago = null)
    {
        $this->idCondicionpago = $idCondicionpago;

        return $this;
    }

    /**
     * Get idCondicionpago
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlCondicionpago 
     */
    public function getIdCondicionpago()
    {
        return $this->idCondicionpago;
    }

    /**
     * Set idEstado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEstado $idEstado
     * @return FacNotaremision
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
        $this->facnotaremisionDetalle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add facnotaremisionDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotaremisiondetalle $facnotaremisionDetalle
     * @return FacNotaremision
     */
    public function addFacnotaremisionDetalle(\Bundles\FacturaBundle\Entity\FacNotaremisiondetalle $facnotaremisionDetalle)
    {
        $this->facnotaremisionDetalle[] = $facnotaremisionDetalle;

        return $this;
    }

    /**
     * Remove facnotaremisionDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotaremisiondetalle $facnotaremisionDetalle
     */
    public function removeFacnotaremisionDetalle(\Bundles\FacturaBundle\Entity\FacNotaremisiondetalle $facnotaremisionDetalle)
    {
        $this->facnotaremisionDetalle->removeElement($facnotaremisionDetalle);
    }

    /**
     * Get facnotaremisionDetalle
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFacnotaremisionDetalle()
    {
        return $this->facnotaremisionDetalle;
    }
    
    public function __toString() {
        return $this->numero;
    }
}
