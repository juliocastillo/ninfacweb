<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CtlEmpleado
 *
 * @ORM\Table(name="ctl_empleado", indexes={@ORM\Index(name="IDX_B02953844D9AE085", columns={"id_cargofuncional"})})
 * @ORM\Entity
 */
class CtlEmpleado
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ctl_empleado_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombres", type="string", length=50, nullable=false)
     */
    private $nombres;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var string
     *
     * @ORM\Column(name="apellidos", type="string", length=2044, nullable=false)
     */
    private $apellidos;

    /**
     * @var string
     *
     * @ORM\Column(name="dui", type="string", length=25, nullable=false)
     */
    private $dui;

    /**
     * @var string
     *
     * @ORM\Column(name="nit", type="string", length=25, nullable=false)
     */
    private $nit;

    /**
     * @var string
     *
     * @ORM\Column(name="direccion", type="string", length=100, nullable=false)
     */
    private $direccion;

    /**
     * @var \CtlCargofuncional
     *
     * @ORM\ManyToOne(targetEntity="CtlCargofuncional")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cargofuncional", referencedColumnName="id")
     * })
     */
    private $idCargofuncional;



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
     * Set nombres
     *
     * @param string $nombres
     * @return CtlEmpleado
     */
    public function setNombres($nombres)
    {
        $this->nombres = $nombres;

        return $this;
    }

    /**
     * Get nombres
     *
     * @return string 
     */
    public function getNombres()
    {
        return $this->nombres;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     * @return CtlEmpleado
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
     * Set apellidos
     *
     * @param string $apellidos
     * @return CtlEmpleado
     */
    public function setApellidos($apellidos)
    {
        $this->apellidos = $apellidos;

        return $this;
    }

    /**
     * Get apellidos
     *
     * @return string 
     */
    public function getApellidos()
    {
        return $this->apellidos;
    }

    /**
     * Set dui
     *
     * @param string $dui
     * @return CtlEmpleado
     */
    public function setDui($dui)
    {
        $this->dui = $dui;

        return $this;
    }

    /**
     * Get dui
     *
     * @return string 
     */
    public function getDui()
    {
        return $this->dui;
    }

    /**
     * Set nit
     *
     * @param string $nit
     * @return CtlEmpleado
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
     * Set direccion
     *
     * @param string $direccion
     * @return CtlEmpleado
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
     * Set idCargofuncional
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCargofuncional $idCargofuncional
     * @return CtlEmpleado
     */
    public function setIdCargofuncional(\Bundles\CatalogosBundle\Entity\CtlCargofuncional $idCargofuncional = null)
    {
        $this->idCargofuncional = $idCargofuncional;

        return $this;
    }

    /**
     * Get idCargofuncional
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlCargofuncional 
     */
    public function getIdCargofuncional()
    {
        return $this->idCargofuncional;
    }
    
    
    public function __toString() {
        return $this->nombres.' '.$this->apellidos;
    }
}
