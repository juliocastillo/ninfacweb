<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CtlProducto
 *
 * @ORM\Table(name="ctl_producto", indexes={@ORM\Index(name="IDX_CE4BEAC3CE25AE0A", columns={"id_categoria"}), @ORM\Index(name="IDX_CE4BEAC3D5D165C2", columns={"id_unidad"}), @ORM\Index(name="IDX_CE4BEAC346D7FEF9", columns={"id_user_add"}), @ORM\Index(name="IDX_CE4BEAC3AC39DE56", columns={"id_user_mod"})})
 * @ORM\Entity
 */
class CtlProducto
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ctl_producto_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="presentacion", type="string", length=100, nullable=false)
     */
    private $presentacion;

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
     * @var string
     *
     * @ORM\Column(name="existencia", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $existencia;

    /**
     * @var string
     *
     * @ORM\Column(name="existencia_maxima", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $existenciaMaxima;

    /**
     * @var string
     *
     * @ORM\Column(name="existencia_minima", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $existenciaMinima;

    /**
     * @var string
     *
     * @ORM\Column(name="precio_costo", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $precioCosto;

    /**
     * @var string
     *
     * @ORM\Column(name="precio_venta", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $precioVenta;

    /**
     * @var string
     *
     * @ORM\Column(name="reservado", type="decimal", precision=10, scale=2, nullable=false)
     */
    private $reservado;

    /**
     * @var string
     *
     * @ORM\Column(name="codigo", type="string", length=25, nullable=false)
     */
    private $codigo;

    /**
     * @var boolean
     *
     * @ORM\Column(name="activo", type="boolean", nullable=false)
     */
    private $activo;

    /**
     * @var \CtlCategoria
     *
     * @ORM\ManyToOne(targetEntity="CtlCategoria")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_categoria", referencedColumnName="id")
     * })
     */
    private $idCategoria;

    /**
     * @var \CtlMarca
     *
     * @ORM\ManyToOne(targetEntity="CtlMarca")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_marca", referencedColumnName="id")
     * })
     */
    private $idMarca;    
    
    
    /**
     * @var \CtlUnidad
     *
     * @ORM\ManyToOne(targetEntity="CtlUnidad")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_unidad", referencedColumnName="id")
     * })
     */
    private $idUnidad;


    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_mod", referencedColumnName="id")
     * })
     */
    private $idUserMod;

    /**
     * @var \Application\Sonata\UserBundle\Entity\User
     *
     * @ORM\ManyToOne(targetEntity="Application\Sonata\UserBundle\Entity\User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user_add", referencedColumnName="id")
     * })
     */
    private $idUserAdd;


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
     * @return CtlProducto
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
     * Set presentacion
     *
     * @param string $presentacion
     * @return CtlProducto
     */
    public function setPresentacion($presentacion)
    {
        $this->presentacion = $presentacion;

        return $this;
    }

    /**
     * Get presentacion
     *
     * @return string 
     */
    public function getPresentacion()
    {
        return $this->presentacion;
    }

    /**
     * Set dateAdd
     *
     * @param \DateTime $dateAdd
     * @return CtlProducto
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
     * @return CtlProducto
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
     * Set existencia
     *
     * @param string $existencia
     * @return CtlProducto
     */
    public function setExistencia($existencia)
    {
        $this->existencia = $existencia;

        return $this;
    }

    /**
     * Get existencia
     *
     * @return string 
     */
    public function getExistencia()
    {
        return $this->existencia;
    }

    /**
     * Set existenciaMaxima
     *
     * @param string $existenciaMaxima
     * @return CtlProducto
     */
    public function setExistenciaMaxima($existenciaMaxima)
    {
        $this->existenciaMaxima = $existenciaMaxima;

        return $this;
    }

    /**
     * Get existenciaMaxima
     *
     * @return string 
     */
    public function getExistenciaMaxima()
    {
        return $this->existenciaMaxima;
    }

    /**
     * Set existenciaMinima
     *
     * @param string $existenciaMinima
     * @return CtlProducto
     */
    public function setExistenciaMinima($existenciaMinima)
    {
        $this->existenciaMinima = $existenciaMinima;

        return $this;
    }

    /**
     * Get existenciaMinima
     *
     * @return string 
     */
    public function getExistenciaMinima()
    {
        return $this->existenciaMinima;
    }

    /**
     * Set precioCosto
     *
     * @param string $precioCosto
     * @return CtlProducto
     */
    public function setPrecioCosto($precioCosto)
    {
        $this->precioCosto = $precioCosto;

        return $this;
    }

    /**
     * Get precioCosto
     *
     * @return string 
     */
    public function getPrecioCosto()
    {
        return $this->precioCosto;
    }

    /**
     * Set precioVenta
     *
     * @param string $precioVenta
     * @return CtlProducto
     */
    public function setPrecioVenta($precioVenta)
    {
        $this->precioVenta = $precioVenta;

        return $this;
    }

    /**
     * Get precioVenta
     *
     * @return string 
     */
    public function getPrecioVenta()
    {
        return $this->precioVenta;
    }

    /**
     * Set reservado
     *
     * @param string $reservado
     * @return CtlProducto
     */
    public function setReservado($reservado)
    {
        $this->reservado = $reservado;

        return $this;
    }

    /**
     * Get reservado
     *
     * @return string 
     */
    public function getReservado()
    {
        return $this->reservado;
    }

    /**
     * Set codigo
     *
     * @param string $codigo
     * @return CtlProducto
     */
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get codigo
     *
     * @return string 
     */
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Set activo
     *
     * @param boolean $activo
     * @return CtlProducto
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
     * Set idCategoria
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlCategoria $idCategoria
     * @return CtlProducto
     */
    public function setIdCategoria(\Bundles\CatalogosBundle\Entity\CtlCategoria $idCategoria = null)
    {
        $this->idCategoria = $idCategoria;

        return $this;
    }

    /**
     * Get idCategoria
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlCategoria 
     */
    public function getIdCategoria()
    {
        return $this->idCategoria;
    }

    /**
     * Set idMarca
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlMarca $idMarca
     * @return CtlProducto
     */
    public function setIdMarca(\Bundles\CatalogosBundle\Entity\CtlMarca $idMarca = null)
    {
        $this->idMarca = $idMarca;

        return $this;
    }

    /**
     * Get idMarca
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlMarca 
     */
    public function getIdMarca()
    {
        return $this->idMarca;
    }
    
    
    /**
     * Set idUnidad
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlUnidad $idUnidad
     * @return CtlProducto
     */
    public function setIdUnidad(\Bundles\CatalogosBundle\Entity\CtlUnidad $idUnidad = null)
    {
        $this->idUnidad = $idUnidad;

        return $this;
    }

    /**
     * Get idUnidad
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlUnidad 
     */
    public function getIdUnidad()
    {
        return $this->idUnidad;
    }


    /**
     * Set idUserMod
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserMod
     *
     * @return CtlCliente
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
     * Set idUserAdd
     *
     * @param \Application\Sonata\UserBundle\Entity\User $idUserAdd
     *
     * @return CtlCliente
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
    
    public function __toString() {
        return $this->nombre;
    }

}
