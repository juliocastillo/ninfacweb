<?php

namespace Bundles\FacturaBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FacFacturaAnulada
 *
 * @ORM\Table(name="fac_factura_anulada", indexes={@ORM\Index(name="index_id1", columns={"id_user_add"}), @ORM\Index(name="IDX_3075F9EC27760979", columns={"id_factura"}), @ORM\Index(name="IDX_3075F9ECDEDAFAA8", columns={"id_motivo_anulacion"})})
 * @ORM\Entity
 */
class FacFacturaAnulada
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="fac_factura_anulada_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_add", type="date", nullable=true)
     */
    private $dateAdd;

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
     * @ORM\ManyToOne(targetEntity="Bundles\CatalogosBundle\Entity\CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     */

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_mod", type="date", nullable=false)
     */
    private $dateMod;

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
     * @var \Bundles\CatalogosBundle\Entity\CtlMotivoAnulacion
     *
     * @ORM\ManyToOne(targetEntity="Bundles\CatalogosBundle\Entity\CtlMotivoAnulacion")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_motivo_anulacion", referencedColumnName="id")
     * })
     */

    private $idMotivoAnulacion;



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
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return FacFacturaAnulada
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
     * Set dateMod
     *
     * @param \DateTime $dateMod
     * @return FacFacturaAnulada
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
     * Set idFactura
     *
     * @param \Bundles\FacturaBundle\Entity\FacFactura $idFactura
     * @return FacFacturaAnulada
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
     * Set idMotivoAnulacion
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlMotivoAnulacion $idMotivoAnulacion
     * @return FacFacturaAnulada
     */
    public function setIdMotivoAnulacion(\Bundles\CatalogosBundle\Entity\CtlMotivoAnulacion $idMotivoAnulacion = null)
    {
        $this->idMotivoAnulacion = $idMotivoAnulacion;

        return $this;
    }

    /**
     * Get idMotivoAnulacion
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlMotivoAnulacion 
     */
    public function getIdMotivoAnulacion()
    {
        return $this->idMotivoAnulacion;
    }
    
    public function __toString() {
        return $this->id . '';
    }
}
