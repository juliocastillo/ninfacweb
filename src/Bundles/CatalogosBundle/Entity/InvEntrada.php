<?php

namespace Bundles\CatalogosBundle\Entity;

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
     * @ORM\Column(name="date_mod", type="date", nullable=false)
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
     * @var \CtlProveedor
     *
     * @ORM\ManyToOne(targetEntity="CtlProveedor")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_proveedor", referencedColumnName="id")
     * })
     */
    private $idProveedor;

    /**
     * @var \CtlTipoentrada
     *
     * @ORM\ManyToOne(targetEntity="CtlTipoentrada")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_tipoentrada", referencedColumnName="id")
     * })
     */
    private $idTipoentrada;

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
     * @param \Bundles\CatalogosBundle\Entity\FosUserUser $idUserAdd
     * @return InvEntrada
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
     * @return InvEntrada
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
}
