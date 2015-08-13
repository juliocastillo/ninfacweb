<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacFactura
 *
 * @ORM\Table(name="fac_factura", indexes={@ORM\Index(name="IDX_60ACA1A52A813255", columns={"id_cliente"}), @ORM\Index(name="IDX_60ACA1A538BCA62A", columns={"id_condicionpago"}), @ORM\Index(name="IDX_60ACA1A58D737C65", columns={"id_tipofactura"}), @ORM\Index(name="IDX_60ACA1A546D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_60ACA1A5AC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_60ACA1A5890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_60ACA1A56A540E", columns={"id_estado"})})
 * @ORM\Entity
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
     */
    private $numero;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

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
     * @ORM\Column(name="date_mod", type="date", nullable=false)
     */
    private $dateMod;

    /**
     * @var string
     *
     * @ORM\Column(name="iva", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $iva;

    /**
     * @var string
     *
     * @ORM\Column(name="iva_retenido", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ivaRetenido;

    /**
     * @var string
     *
     * @ORM\Column(name="subtotal", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $subtotal;

    /**
     * @var string
     *
     * @ORM\Column(name="venta_total", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventaTotal;

    /**
     * @var string
     *
     * @ORM\Column(name="ventas_gravadas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $ventasGravadas;

    /**
     * @var \CtlCliente
     *
     * @ORM\ManyToOne(targetEntity="CtlCliente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cliente", referencedColumnName="id")
     * })
     */
    private $idCliente;

    /**
     * @var \CtlCondicionpago
     *
     * @ORM\ManyToOne(targetEntity="CtlCondicionpago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_condicionpago", referencedColumnName="id")
     * })
     */
    private $idCondicionpago;

    /**
     * @var \CtlTipofactura
     *
     * @ORM\ManyToOne(targetEntity="CtlTipofactura")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_tipofactura", referencedColumnName="id")
     * })
     */
    private $idTipofactura;

    /**
     * @var \FosUserUser
     *
     * @ORM\ManyToOne(targetEntity="FosUserUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_add", referencedColumnName="id")
     * })
     */
    private $idUserAdd;

    /**
     * @var \FosUserUser
     *
     * @ORM\ManyToOne(targetEntity="FosUserUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_mod", referencedColumnName="id")
     * })
     */
    private $idUserMod;

    /**
     * @var \CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     */
    private $idEmpleado;

    /**
     * @var \CtlEstado
     *
     * @ORM\ManyToOne(targetEntity="CtlEstado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_estado", referencedColumnName="id")
     * })
     */
    private $idEstado;



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
     * @param \Bundles\CatalogosBundle\Entity\FosUserUser $idUserAdd
     * @return FacFactura
     */
    public function setIdUserAdd(\Bundles\CatalogosBundle\Entity\FosUserUser $idUserAdd = null)
    {
        $this->idUserAdd = $idUserAdd;

        return $this;
    }

    /**
     * Get idUserAdd
     *
     * @return \Bundles\CatalogosBundle\Entity\FosUserUser 
     */
    public function getIdUserAdd()
    {
        return $this->idUserAdd;
    }

    /**
     * Set idUserMod
     *
     * @param \Bundles\CatalogosBundle\Entity\FosUserUser $idUserMod
     * @return FacFactura
     */
    public function setIdUserMod(\Bundles\CatalogosBundle\Entity\FosUserUser $idUserMod = null)
    {
        $this->idUserMod = $idUserMod;

        return $this;
    }

    /**
     * Get idUserMod
     *
     * @return \Bundles\CatalogosBundle\Entity\FosUserUser 
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
     * Set idEstado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEstado $idEstado
     * @return FacFactura
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
}
