<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MntEmpleadoMmCliente
 *
 * @ORM\Table(name="mnt_empleado_MM_cliente", indexes={@ORM\Index(name="IDX_F11043712A813255", columns={"id_cliente"}), @ORM\Index(name="IDX_F1104371890253C7", columns={"id_empleado"})})
 * @ORM\Entity
 */
class MntEmpleadoMmCliente
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="mnt_empleado_MM_cliente_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \CtlCliente
     *
     * @ORM\ManyToOne(targetEntity="CtlCliente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_cliente", referencedColumnName="id")
     * })
     */
    private $idCliente;

    /**
     * @var \CtlEmpleado
     *
     * @ORM\ManyToOne(targetEntity="CtlEmpleado")
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
     * Set idCliente
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCliente $idCliente
     * @return MntEmpleadoMmCliente
     */
    public function setIdCliente(\Bundles\CatalogosBundle\Entity\CtlCliente $idCliente = null)
    {
        $this->idCliente = $idCliente;

        return $this;
    }

    /**
     * Get idCliente
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlCliente 
     */
    public function getIdCliente()
    {
        return $this->idCliente;
    }

    /**
     * Set idEmpleado
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlEmpleado $idEmpleado
     * @return MntEmpleadoMmCliente
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
}
