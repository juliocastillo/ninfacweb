<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CfgEmpresa
 *
 * @ORM\Table(name="cfg_empresa")
 * @ORM\Entity
 */
class CfgEmpresa
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cfg_empresa_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var string
     *
     * @ORM\Column(name="direccion", type="string", length=100, nullable=false)
     */
    private $direccion;

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
     * @ORM\Column(name="nrc", type="string", length=25, nullable=false)
     */
    private $nrc;

    /**
     * @var string
     *
     * @ORM\Column(name="telefono", type="string", length=25, nullable=false)
     */
    private $telefono;



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
     * Set activo
     *
     * @param boolean $activo
     * @return CfgEmpresa
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
     * Set direccion
     *
     * @param string $direccion
     * @return CfgEmpresa
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
     * Set giro
     *
     * @param string $giro
     * @return CfgEmpresa
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
     * @return CfgEmpresa
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
     * Set nombre
     *
     * @param string $nombre
     * @return CfgEmpresa
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
     * @return CfgEmpresa
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
     * Set nrc
     *
     * @param string $nrc
     * @return CfgEmpresa
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
     * Set telefono
     *
     * @param string $telefono
     * @return CfgEmpresa
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
    
    
    public function __toString() {
        return $this->nombre;
    }
}
