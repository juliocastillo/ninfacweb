<?php

namespace Bundles\CxcBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

use Sonata\AdminBundle\Validator\ErrorElement;

/**
 * CxcRemesa
 *
 * @ORM\Table(name="cxc_remesa", indexes={@ORM\Index(name="IDX_8D545D8B890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_8D545D8BB1476DEC", columns={"id_forma_pago"}), @ORM\Index(name="IDX_8D545D8B27760979", columns={"id_factura"}), @ORM\Index(name="IDX_8D545D8B46D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_8D545D8BAC39DE56", columns={"id_user_mod"}), @ORM\Index(name="IDX_8D545D8B995BA0E1", columns={"id_banco"})})
 * @ORM\Entity(repositoryClass="Bundles\CxcBundle\Repository\CxcRemesaRepository")
 */
class CxcRemesa
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cxc_remesa_id_seq", allocationSize=1, initialValue=1)
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
     * @ORM\Column(name="id_remesa", type="integer", nullable=false)
     *
     * @Assert\Range(min="1")
     */
    private $idRemesa;
    
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
     * @ORM\Column(name="monto", type="decimal", precision=10, scale=2, nullable=false)
     *
     * @Assert\Range(
     *      min = "0.01",
     * )
     */
    private $monto;
    
    /**
     * @var string
     *
     * @ORM\Column(name="sumas", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $sumas;

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
     * @ORM\Column(name="estado", type="string", length=5, nullable=false)
     */
    private $estado;

     /**
     *
     * @ORM\OneToMany(targetEntity="CxcCobro", mappedBy="idRemesa", cascade={"all"}, orphanRemoval=true)
     *
     */
    private $remesaCobro;


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
     * @return CxcRemesa
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
     * Add remesaCobro
     *
     * @param \Bundles\CxcBundle\Entity\CxcRemesaCobro $remesaCobro
     * @return CxcRemesa
     */
    public function addRemesaCobro(\Bundles\CxcBundle\Entity\CxcCobro $remesaCobro)
    {
        $this->remesaCobro[] = $remesaCobro;

        return $this;
    }

    /**
     * Remove remesaCobro
     *
     * @param \Bundles\CxcBundle\Entity\CxcCobro $remesaCobro
     */
    public function removeRemesaCobro(\Bundles\CxcBundle\Entity\CxcCobro $remesaCobro)
    {
        $this->remesaCobro->removeElement($remesaCobro);
    }

    /**
     * Get remesaCobro
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getRemesaCobro()
    {
        return $this->remesaCobro;
    }

    /**
     * Set idRemesa
     *
     * @param integer $idRemesa
     * @return CxcRemesa
     */
    public function setIdRemesa($idRemesa)
    {
        $this->idRemesa = $idRemesa;

        return $this;
    }

    /**
     * Get idRemesa
     *
     * @return integer
     */
    public function getIdRemesa()
    {
        return $this->idRemesa;
    }

    /**
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return CxcRemesa
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
     * @return CxcRemesa
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
     * Set monto
     *
     * @param string $monto
     * @return CxcRemesa
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
     * Set sumas
     *
     * @param string $sumas
     * @return CxcRemesa
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
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     * @return CxcRemesa
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
     * @return CxcRemesa
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
     * @return CxcRemesa
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


    public function __toString() {
        return 'Remesa: ' . $this->idRemesa . ', Monto: ' . $this->monto . ', ' . $this->idBanco;
    }
    
}
