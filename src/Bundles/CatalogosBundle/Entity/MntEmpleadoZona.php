<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MntEmpleadoZona
 *
 * @ORM\Table(name="mnt_empleado_zona", indexes={@ORM\Index(name="IDX_F8CA0DFD2CA6181C", columns={"id_zona"}), @ORM\Index(name="IDX_F8CA0DFD890253C7", columns={"id_empleado"})})
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
     * @var \CtlZona
     *
     * @ORM\ManyToOne(targetEntity="CtlZona")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_zona", referencedColumnName="id")
     * })
     */
    private $idZona;

    /**
     * @var \CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="Bundles\CatalogosBundle\Entity\CtlEmpleado", inversedBy="empleadoZona")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_empleado", referencedColumnName="id")
     * })
     */
    private $idEmpleado;



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

    public function __toString() {
        return $this->id ? $this->idZona->getNombre() : '';
    }

    public function getNombreEmpleadoZona() {
        return $this->id ? $this->idEmpleado->getNombres().' '.$this->idEmpleado->getApellidos().' - '.$this->idZona->getNombre() : '';
    }
}
