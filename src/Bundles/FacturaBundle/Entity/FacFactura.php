<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * FacFactura
 *
 * @ORM\Table(name="fac_factura", uniqueConstraints={@ORM\UniqueConstraint(name="uk_tipofactura_numero", columns={"numero","tipoFactura"})}, indexes={@ORM\Index(name="IDX_60ACA1A52A813255", columns={"id_cliente"}), @ORM\Index(name="IDX_60ACA1A538BCA62A", columns={"id_condicionpago"}), @ORM\Index(name="IDX_60ACA1A58D737C65", columns={"id_tipofactura"}), @ORM\Index(name="IDX_60ACA1A546D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_60ACA1A5AC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_60ACA1A5890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_60ACA1A56A540E", columns={"id_estado"})})
 * @ORM\Entity
 * @UniqueEntity(
 *     fields={"numero", "idTipofactura"},
 *     message="Ya existe este numero de factura"
 *  )
 */
class FacFactura
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_factura_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="numero", type="integer", nullable=false)
     * @Assert\NotNull()
     * @Assert\Range(min="1")
     */
    private $numero;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     * @Assert\NotNull()
     */
    private $fecha;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=true)
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
     * @var string
     *
     * @ORM\Column(name="iva", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $iva;

    /**
     * @var string
     *
     * @ORM\Column(name="iva_retenido", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ivaRetenido;

    /**
     * @var string
     *
     * @ORM\Column(name="subtotal", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $subtotal;

    /**
     * @var string
     *
     * @ORM\Column(name="venta_total", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ventaTotal;

    /**
     * @var string
     *
     * @ORM\Column(name="sumas", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $sumas;
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="ventas_gravadas", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $ventasGravadas;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlCliente
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlCliente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cliente", referencedColumnName="id")
     * })
     * @Assert\NotNull()
     */
    private $idCliente;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlCondicionpago
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlCondicionpago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_condicionpago", referencedColumnName="id")
     * })
     * @Assert\NotNull()
     */
    private $idCondicionpago;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlTipofactura
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlTipofactura")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_tipofactura", referencedColumnName="id")
     * })
     * @Assert\NotNull()
     */
    private $idTipofactura;

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
     * @var \Bundles\CatalogosBundle\Entity\CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     * @Assert\NotNull()
     */
    private $idEmpleado;

     /**
     * @var string
     *
     * @ORM\Column(name="estado", type="string", length=5, nullable=false)
     */
    private $estado;


    /**
     *
     * @ORM\OneToMany(targetEntity="FacFacturadetalle", mappedBy="idFactura", cascade={"all"}, orphanRemoval=true)
     *
     */
    private $facturaDetalle;    
    
    
    
    

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
     * @return FacFactura
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
     * Set activo
     *
     * @param boolean $activo
     * @return FacFactura
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
     * @return FacFactura
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
     * @return FacFactura
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
     * Set iva
     *
     * @param string $iva
     * @return FacFactura
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
     * Set ivaRetenido
     *
     * @param string $ivaRetenido
     * @return FacFactura
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
     * Set subtotal
     *
     * @param string $subtotal
     * @return FacFactura
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
     * Set ventaTotal
     *
     * @param string $ventaTotal
     * @return FacFactura
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
     * Set ventasGravadas
     *
     * @param string $ventasGravadas
     * @return FacFactura
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
     * Set sumas
     *
     * @param string $sumas
     * @return FacFactura
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
     * Set idCliente
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCliente $idCliente
     * @return FacFactura
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
     * Set idCondicionpago
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCondicionpago $idCondicionpago
     * @return FacFactura
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
     * Set idTipofactura
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlTipofactura $idTipofactura
     * @return FacFactura
     */
    public function setIdTipofactura(\Bundles\CatalogosBundle\Entity\CtlTipofactura $idTipofactura = null)
    {
        $this->idTipofactura = $idTipofactura;

        return $this;
    }

    /**
     * Get idTipofactura
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlTipofactura 
     */
    public function getIdTipofactura()
    {
        return $this->idTipofactura;
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
     * Set idEmpleado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado
     * @return FacFactura
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

    /**
     * Set estado
     *
     * @param string $estado
     * @return FacFactura
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
     * Constructor
     */
    public function __construct()
    {
        $this->facturaDetalle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add facturaDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacFacturaDetalle $facturaDetalle
     * @return FacFactura
     */
    public function addFacturaDetalle(\Bundles\FacturaBundle\Entity\FacFacturaDetalle $facturaDetalle)
    {
        $this->facturaDetalle[] = $facturaDetalle;

        return $this;
    }

    /**
     * Remove facturaDetalle
     *
     * @param \Bundles\FacturaBundle\Entity\FacFacturaDetalle $facturaDetalle
     */
    public function removeFacturaDetalle(\Bundles\FacturaBundle\Entity\FacFacturaDetalle $facturaDetalle)
    {
        $this->facturaDetalle->removeElement($facturaDetalle);
    }

    /**
     * Get facturaDetalle
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFacturaDetalle()
    {
        return $this->facturaDetalle;
    }
    
    public function __toString() {
        return $this->numero .' ' . $this->idTipofactura;
    }
}
