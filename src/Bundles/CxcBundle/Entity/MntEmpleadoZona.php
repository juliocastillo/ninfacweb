<?php

namespace Bundles\CxcBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MntEmpleadoZona
 *
 * @ORM\Table(name="mnt_empleado_zona", indexes={@ORM\Index(name="IDX_6C7F3E20890253C7", columns={"id_empleado"}), @ORM\Index(name="IDX_6C7F3E202CA6181C", columns={"id_zona"})})
 * @ORM\Entity
 */
class MntEmpleadoZona
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="mnt_empleado_zona_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlEmpleado")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     */
    private $idEmpleado;

    /**
     * @var \Bundles\CatalogosBundle\Entity\CtlZona
     *
     * @ORM\ManyToOne(targetEntity="\Bundles\CatalogosBundle\Entity\CtlZona")
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
     * Set idEmpleado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado
     * @return MntEmpleadoZona
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
     * Set idZona
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlZona $idZona
     * @return MntEmpleadoZona
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
}
