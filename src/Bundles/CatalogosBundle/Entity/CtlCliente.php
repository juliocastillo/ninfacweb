<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CtlCliente
 *
 * @ORM\Table(name="ctl_cliente", indexes={@ORM\Index(name="IDX_232B3B66325E299", columns={"id_departamento"}), @ORM\Index(name="IDX_232B3B67EAD49C7", columns={"id_municipio"}), @ORM\Index(name="IDX_232B3B646D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_232B3B6AC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_232B3B62CA6181C", columns={"id_zona"})})
 * @ORM\Entity
 */
class CtlCliente
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ctl_cliente_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre_comercial", type="string", length=100, nullable=false)
     */
    private $nombreComercial;

    /**
     * @var string
     *
     * @ORM\Column(name="giro", type="string", length=100, nullable=false)
     */
    private $giro;

    /**
     * @var string
     *
     * @ORM\Column(name="nit", type="string", length=25, nullable=false)
     */
    private $nit;

    /**
     * @var string
     *
     * @ORM\Column(name="nrc", type="string", length=25, nullable=false)
     */
    private $nrc;

    /**
     * @var string
     *
     * @ORM\Column(name="direccion", type="string", length=100, nullable=false)
     */
    private $direccion;

    /**
     * @var string
     *
     * @ORM\Column(name="telefono", type="string", length=25, nullable=false)
     */
    private $telefono;

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
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=100, nullable=true)
     */
    private $email;

    /**
     * @var boolean
     *
     * @ORM\Column(name="exento", type="boolean", nullable=true)
     */
    private $exento;

    /**
     * @var \CtlDepartamento
     *
     * @ORM\ManyToOne(targetEntity="CtlDepartamento")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_departamento", referencedColumnName="id")
     * })
     */
    private $idDepartamento;

    /**
     * @var \CtlMunicipio
     *
     * @ORM\ManyToOne(targetEntity="CtlMunicipio")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_municipio", referencedColumnName="id")
     * })
     */
    private $idMunicipio;

    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_mod", referencedColumnName="id")
     * })
     */
    private $idUserMod;

    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_add", referencedColumnName="id")
     * })
     */
    private $idUserAdd;

    /**
     * @var \CtlZona
     *
     * @ORM\ManyToOne(targetEntity="CtlZona")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_zona", referencedColumnName="id")
     * })
     */
    private $idZona;



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
     * Set nombre
     *
     * @param string $nombre
     * @return CtlCliente
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set nombreComercial
     *
     * @param string $nombreComercial
     * @return CtlCliente
     */
    public function setNombreComercial($nombreComercial)
    {
        $this->nombreComercial = $nombreComercial;

        return $this;
    }

    /**
     * Get nombreComercial
     *
     * @return string 
     */
    public function getNombreComercial()
    {
        return $this->nombreComercial;
    }

    /**
     * Set giro
     *
     * @param string $giro
     * @return CtlCliente
     */
    public function setGiro($giro)
    {
        $this->giro = $giro;

        return $this;
    }

    /**
     * Get giro
     *
     * @return string 
     */
    public function getGiro()
    {
        return $this->giro;
    }

    /**
     * Set nit
     *
     * @param string $nit
     * @return CtlCliente
     */
    public function setNit($nit)
    {
        $this->nit = $nit;

        return $this;
    }

    /**
     * Get nit
     *
     * @return string 
     */
    public function getNit()
    {
        return $this->nit;
    }

    /**
     * Set nrc
     *
     * @param string $nrc
     * @return CtlCliente
     */
    public function setNrc($nrc)
    {
        $this->nrc = $nrc;

        return $this;
    }

    /**
     * Get nrc
     *
     * @return string 
     */
    public function getNrc()
    {
        return $this->nrc;
    }

    /**
     * Set direccion
     *
     * @param string $direccion
     * @return CtlCliente
     */
    public function setDireccion($direccion)
    {
        $this->direccion = $direccion;

        return $this;
    }

    /**
     * Get direccion
     *
     * @return string 
     */
    public function getDireccion()
    {
        return $this->direccion;
    }

    /**
     * Set telefono
     *
     * @param string $telefono
     * @return CtlCliente
     */
    public function setTelefono($telefono)
    {
        $this->telefono = $telefono;

        return $this;
    }

    /**
     * Get telefono
     *
     * @return string 
     */
    public function getTelefono()
    {
        return $this->telefono;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     * @return CtlCliente
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
     * @return CtlCliente
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
     * @return CtlCliente
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
     * Set email
     *
     * @param string $email
     * @return CtlCliente
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set exento
     *
     * @param boolean $exento
     * @return CtlCliente
     */
    public function setExento($exento)
    {
        $this->exento = $exento;

        return $this;
    }

    /**
     * Get exento
     *
     * @return boolean 
     */
    public function getExento()
    {
        return $this->exento;
    }

    /**
     * Set idDepartamento
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlDepartamento $idDepartamento
     * @return CtlCliente
     */
    public function setIdDepartamento(\Bundles\CatalogosBundle\Entity\CtlDepartamento $idDepartamento = null)
    {
        $this->idDepartamento = $idDepartamento;

        return $this;
    }

    /**
     * Get idDepartamento
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlDepartamento 
     */
    public function getIdDepartamento()
    {
        return $this->idDepartamento;
    }

    /**
     * Set idMunicipio
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlMunicipio $idMunicipio
     * @return CtlCliente
     */
    public function setIdMunicipio(\Bundles\CatalogosBundle\Entity\CtlMunicipio $idMunicipio = null)
    {
        $this->idMunicipio = $idMunicipio;

        return $this;
    }

    /**
     * Get idMunicipio
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlMunicipio 
     */
    public function getIdMunicipio()
    {
        return $this->idMunicipio;
    }

    /**
     * Set idUserMod
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserMod
     *
     * @return CtlCliente
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
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     *
     * @return CtlCliente
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
     * Set idZona
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlZona $idZona
     * @return CtlCliente
     */
    public function setIdZona(\Bundles\CatalogosBundle\Entity\CtlZona $idZona = null)
    {
        $this->idZona = $idZona;

        return $this;
    }

    /**
     * Get idZona
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlZona 
     */
    public function getIdZona()
    {
        return $this->idZona;
    }
    
    
    public function __toString() {
        return $this->nombre;
    }
}
