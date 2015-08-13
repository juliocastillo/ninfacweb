<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CxcCobro
 *
 * @ORM\Table(name="cxc_cobro", indexes={@ORM\Index(name="IDX_8D545D8B995BA0E1", columns={"id_banco"}), @ORM\Index(name="IDX_8D545D8B890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_8D545D8BB1476DEC", columns={"id_forma_pago"}), @ORM\Index(name="IDX_8D545D8B27760979", columns={"id_factura"}), @ORM\Index(name="IDX_8D545D8B46D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_8D545D8BAC39DE56", columns={"id_user_mod"})})
 * @ORM\Entity
 */
class CxcCobro
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cxc_cobro_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha", type="date", nullable=false)
     */
    private $fecha;

    /**
     * @var integer
     *
     * @ORM\Column(name="numero_recibo", type="integer", nullable=false)
     */
    private $numeroRecibo;

    /**
     * @var string
     *
     * @ORM\Column(name="numero_cheque", type="string", length=2044, nullable=false)
     */
    private $numeroCheque;

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
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var string
     *
     * @ORM\Column(name="monto", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $monto;

    /**
     * @var \CtlBanco
     *
     * @ORM\ManyToOne(targetEntity="CtlBanco")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_banco", referencedColumnName="id")
     * })
     */
    private $idBanco;

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
     * @var \CtlFormapago
     *
     * @ORM\ManyToOne(targetEntity="CtlFormapago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_forma_pago", referencedColumnName="id")
     * })
     */
    private $idFormaPago;

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
     * @return CxcCobro
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
     * Set numeroRecibo
     *
     * @param integer $numeroRecibo
     * @return CxcCobro
     */
    public function setNumeroRecibo($numeroRecibo)
    {
        $this->numeroRecibo = $numeroRecibo;

        return $this;
    }

    /**
     * Get numeroRecibo
     *
     * @return integer 
     */
    public function getNumeroRecibo()
    {
        return $this->numeroRecibo;
    }

    /**
     * Set numeroCheque
     *
     * @param string $numeroCheque
     * @return CxcCobro
     */
    public function setNumeroCheque($numeroCheque)
    {
        $this->numeroCheque = $numeroCheque;

        return $this;
    }

    /**
     * Get numeroCheque
     *
     * @return string 
     */
    public function getNumeroCheque()
    {
        return $this->numeroCheque;
    }

    /**
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return CxcCobro
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
     * @return CxcCobro
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
     * Set activo
     *
     * @param boolean $activo
     * @return CxcCobro
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
     * Set monto
     *
     * @param string $monto
     * @return CxcCobro
     */
    public function setMonto($monto)
    {
        $this->monto = $monto;

        return $this;
    }

    /**
     * Get monto
     *
     * @return string 
     */
    public function getMonto()
    {
        return $this->monto;
    }

    /**
     * Set idBanco
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlBanco $idBanco
     * @return CxcCobro
     */
    public function setIdBanco(\Bundles\CatalogosBundle\Entity\CtlBanco $idBanco = null)
    {
        $this->idBanco = $idBanco;

        return $this;
    }

    /**
     * Get idBanco
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlBanco 
     */
    public function getIdBanco()
    {
        return $this->idBanco;
    }

    /**
     * Set idEmpleado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado
     * @return CxcCobro
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
     * Set idFormaPago
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlFormapago $idFormaPago
     * @return CxcCobro
     */
    public function setIdFormaPago(\Bundles\CatalogosBundle\Entity\CtlFormapago $idFormaPago = null)
    {
        $this->idFormaPago = $idFormaPago;

        return $this;
    }

    /**
     * Get idFormaPago
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlFormapago 
     */
    public function getIdFormaPago()
    {
        return $this->idFormaPago;
    }

    /**
     * Set idFactura
     *
     * @param \Bundles\CatalogosBundle\Entity\FacFactura $idFactura
     * @return CxcCobro
     */
    public function setIdFactura(\Bundles\CatalogosBundle\Entity\FacFactura $idFactura = null)
    {
        $this->idFactura = $idFactura;

        return $this;
    }

    /**
     * Get idFactura
     *
     * @return \Bundles\CatalogosBundle\Entity\FacFactura 
     */
    public function getIdFactura()
    {
        return $this->idFactura;
    }

    /**
     * Set idUserAdd
     *
     * @param \Bundles\CatalogosBundle\Entity\FosUserUser $idUserAdd
     * @return CxcCobro
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
     * @return CxcCobro
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
}
