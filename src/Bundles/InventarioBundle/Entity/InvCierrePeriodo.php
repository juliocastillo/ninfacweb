<?php

namespace Bundles\InventarioBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * InvCierrePeriodo
 *
 * @ORM\Table(name="inv_cierre_periodo")
 * @ORM\Entity
 */
class InvCierrePeriodo
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="inv_cierre_periodo_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha_cierre", type="date", nullable=false)
     */
    private $fechaCierre;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;


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
     * Set fechaCierre
     *
     * @param \DateTime $fechaCierre
     * @return InvCierrePeriodo
     */
    public function setFechaCierre($fechaCierre)
    {
        $this->fechaCierre = $fechaCierre;

        return $this;
    }

    /**
     * Get fechaCierre
     *
     * @return \DateTime
     */
    public function getFechaCierre()
    {
        return $this->fechaCierre;
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


    public function __toString() {
        return $this->fechaCierre;
    }
}
