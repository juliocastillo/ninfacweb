<?php

namespace Bundles\CxcBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;


/**
 * CxcCobro
 *
 * @ORM\Table(name="cxc_cobro", uniqueConstraints={@ORM\UniqueConstraint(name="uk_numero_fecha", columns={"numero_recibo","fecha", "id_factura"})}, indexes={@ORM\Index(name="IDX_8D545D8B890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_8D545D8BB1476DEC", columns={"id_forma_pago"}), @ORM\Index(name="IDX_8D545D8B27760979", columns={"id_factura"}), @ORM\Index(name="IDX_8D545D8B46D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_8D545D8BAC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_8D545D8B995BA0E1", columns={"id_banco"})})
 * @ORM\Entity(repositoryClass="Bundles\CxcBundle\Repository\CxcCobroReporteRepository")
 * @UniqueEntity(
 *     fields={"numeroRecibo", "fecha", "id_factura"},
 *     message="Ya existe este recibo en la base de datos"
 *  )
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
     * 
     */
    private $fecha;

    /**
     * @var integer
     *
     * @ORM\Column(name="numero_recibo", type="integer", nullable=false)
     * 
     * @Assert\Range(min="1")
     */
    private $numeroRecibo;

    /**
     * @var string
     *
     * @ORM\Column(name="numero_cheque", type="string", length=25, nullable=true)
     * 
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
     * @ORM\Column(name="date_mod", type="date", nullable=true)
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
     * 
     * @Assert\Range(
     *      min = "0.01",
     * )
     */
    private $monto;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     * 
     * @Assert\NotNull()
     */
    private $idEmpleado;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlFormapago
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlFormapago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_forma_pago", referencedColumnName="id")
     * })
     */
    private $idFormaPago;

    /**
     * @var \Bundles\FacturaBundle\Entity\FacFactura
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\FacturaBundle\Entity\FacFactura")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_factura", referencedColumnName="id")
     * })
     */
    private $idFactura;

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
     * @var \Bundles\CatalogosBundle\Entity\CtlBanco
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlBanco")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_banco", referencedColumnName="id")
     * })
     */
    private $idBanco;

    
     /**
     * @var string
     *
     * @ORM\Column(name="observacion", type="string", length=2044, nullable=true)
     */
    private $observacion;
    
     /**
     * @var string
     *
     * @ORM\Column(name="estado", type="string", length=5, nullable=false)
     */
    private $estado;

    
    


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
     * Set observacion
     *
     * @param string $observacion
     * @return FacFacturadetalle
     */
    public function setObservacion($observacion)
    {
        $this->observacion = $observacion;

        return $this;
    }

    /**
     * Get observacion
     *
     * @return string 
     */
    public function getObservacion()
    {
        return $this->observacion;
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
     * @param \Bundles\FacturaBundle\Entity\FacFactura $idFactura
     * @return CxcCobro
     */
    public function setIdFactura(\Bundles\FacturaBundle\Entity\FacFactura $idFactura = null)
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
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     * @return CxcCobro
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
     * @return CxcCobro
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
    
    public function __toString() {
        return 'Recibo: '.$this->numeroRecibo;
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
    

    
    
}
