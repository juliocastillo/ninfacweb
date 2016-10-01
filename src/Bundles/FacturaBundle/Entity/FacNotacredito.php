<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacNotacredito
 *
 * @ORM\Table(name="fac_notacredito", indexes={@ORM\Index(name="index_fac_factura_id", columns={"id_factura"}), @ORM\Index(name="index_ctl_motivo_notacredito_id", columns={"id_motivo_notacredito"})})
 * @ORM\Entity
 */
class FacNotacredito
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_notacredito_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;
        
    /**
     * @var integer
     *
     * @ORM\Column(name="numero", type="integer", nullable=false)
     */
    private $numero;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var string
     *
     * @ORM\Column(name="sumas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $sumas;

    /**
     * @var string
     *
     * @ORM\Column(name="iva", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $iva;

    /**
     * @var string
     *
     * @ORM\Column(name="subtotal", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $subtotal;

    /**
     * @var string
     *
     * @ORM\Column(name="iva_retenido", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ivaRetenido;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_exentas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventasExentas;

    /**
     * @var string
     *
     * @ORM\Column(name="venta_total", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventaTotal;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

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
     * @var \Bundles\CatalogosBundle\Entity\CtlMotivoNotacredito
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlMotivoNotacredito")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_motivo_notacredito", referencedColumnName="id")
     * })
     */
    private $idMotivoNotacredito;

    /**
     * @var \FacFactura
     *
     * @ORM\ManyToOne(targetEntity="FacFactura")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_factura", referencedColumnName="id")
     * })
     */
    private $idFactura;

    /**
     *
     * @ORM\OneToMany(targetEntity="FacNotacreditodetalle", mappedBy="idNotacredito", cascade={"all"}, orphanRemoval=true)
     *
     */
    private $notacreditoDetalle;

    
    
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
     * Set numero
     *
     * @param integer $numero
     * @return FacFactura
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
     * Set fecha
     *
     * @param \DateTime $fecha
     * @return FacNotacredito
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
     * Set sumas
     *
     * @param string $sumas
     * @return FacNotacredito
     */
    public function setSumas($sumas)
    {
        $this->sumas = $sumas;

        return $this;
    }

    /**
     * Get sumas
     *
     * @return string 
     */
    public function getSumas()
    {
        return $this->sumas;
    }

    /**
     * Set iva
     *
     * @param string $iva
     * @return FacNotacredito
     */
    public function setIva($iva)
    {
        $this->iva = $iva;

        return $this;
    }

    /**
     * Get iva
     *
     * @return string 
     */
    public function getIva()
    {
        return $this->iva;
    }

    /**
     * Set subtotal
     *
     * @param string $subtotal
     * @return FacNotacredito
     */
    public function setSubtotal($subtotal)
    {
        $this->subtotal = $subtotal;

        return $this;
    }

    /**
     * Get subtotal
     *
     * @return string 
     */
    public function getSubtotal()
    {
        return $this->subtotal;
    }

    /**
     * Set ivaRetenido
     *
     * @param string $ivaRetenido
     * @return FacNotacredito
     */
    public function setIvaRetenido($ivaRetenido)
    {
        $this->ivaRetenido = $ivaRetenido;

        return $this;
    }

    /**
     * Get ivaRetenido
     *
     * @return string 
     */
    public function getIvaRetenido()
    {
        return $this->ivaRetenido;
    }

    /**
     * Set ventasExentas
     *
     * @param string $ventasExentas
     * @return FacNotacredito
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
     * Set ventaTotal
     *
     * @param string $ventaTotal
     * @return FacNotacredito
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
     * Set activo
     *
     * @param boolean $activo
     * @return FacNotacredito
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
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     * @return FacFactura
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
     * @return FacFactura
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
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return FacNotacredito
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
     * @return FacNotacredito
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
     * Set idMotivoNotacredito
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlMotivoNotacredito $idMotivoNotacredito
     * @return FacNotacredito
     */
    public function setIdMotivoNotacredito(\Bundles\CatalogosBundle\Entity\CtlMotivoNotacredito $idMotivoNotacredito = null)
    {
        $this->idMotivoNotacredito = $idMotivoNotacredito;

        return $this;
    }

    /**
     * Get idMotivoNotacredito
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlMotivoNotacredito 
     */
    public function getIdMotivoNotacredito()
    {
        return $this->idMotivoNotacredito;
    }

    /**
     * Set idFactura
     *
     * @param \Bundles\FacturaBundle\Entity\FacFactura $idFactura
     * @return FacNotacredito
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
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->notacreditoDetalle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add notacreditoDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotacreditodetalle $notacreditoDetalle
     * @return FacNotacredito
     */
    public function addNotacreditoDetalle(\Bundles\FacturaBundle\Entity\FacNotacreditodetalle $notacreditoDetalle)
    {
        $this->notacreditoDetalle[] = $notacreditoDetalle;

        return $this;
    }

    /**
     * Remove notacreditoDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacNotacreditodetalle $notacreditoDetalle
     */
    public function removeNotacreditoDetalle(\Bundles\FacturaBundle\Entity\FacNotacreditodetalle $notacreditoDetalle)
    {
        $this->notacreditoDetalle->removeElement($notacreditoDetalle);
    }

    /**
     * Get notacreditoDetalle
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getNotacreditoDetalle()
    {
        return $this->notacreditoDetalle;
    }
    
    
    public function __toString() {
        return $this->idMotivoNotacredito .' # ' . $this->numero;
    }
}
