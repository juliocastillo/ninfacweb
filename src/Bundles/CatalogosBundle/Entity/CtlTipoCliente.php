<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CtlTipoCliente
 *
 * @ORM\Table(name="ctl_tipo_cliente", uniqueConstraints={@ORM\UniqueConstraint(name="uk_tipo_cliente_nombre", columns={"nombre"})})
 * @ORM\Entity
 */
class CtlTipoCliente
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ctl_tipo_cliente_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;



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
     * @return CtlTipoCliente
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
    
    
    public function __toString() {
        return $this->nombre;
    }
}
