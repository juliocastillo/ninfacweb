<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CfgFormatoDocumento
 *
 * @ORM\Table(name="cfg_formato_documento")
 * @ORM\Entity
 */
class CfgFormatoDocumento
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="cfg_formato_documento_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;
    
    
    /**
     * @var \CfgPlantilla
     *
     * @ORM\ManyToOne(targetEntity="CfgPlantilla")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_plantilla", referencedColumnName="id")
     * })
     */
    private $idPlantilla;

    /**
     * @var \CtlTipofactura
     *
     * @ORM\ManyToOne(targetEntity="CtlTipofactura")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_tipofactura", referencedColumnName="id")
     * })
     */
    private $idTipofactura;

    
    
    
    
    
     /**
     * @var \CtlFontName
     *
     * @ORM\ManyToOne(targetEntity="CtlFontName")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_font_name", referencedColumnName="id")
     * })
     */
    private $idFontName;

    
     /**
     * @var \CtlFontSize
     *
     * @ORM\ManyToOne(targetEntity="CtlFontSize")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_font_size", referencedColumnName="id")
     * })
     */
    private $idFontSize;
    
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="detalle_interlineado", type="string", length=5, nullable=false)
     */
    private $detalleInterlineado;
    
    /**
     * @var string
     *
     * @ORM\Column(name="interlineado", type="string", length=5, nullable=false)
     */
    private $interlineado;

    /**
     * @var integer
     *
     * @ORM\Column(name="detalle_numero_items", type="integer", nullable=false)
     */
    private $detalleNumeroItems;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col1", type="string", length=5, nullable=false)
     */
    private $detalleXCol1;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_y", type="string", length=5, nullable=false)
     */
    private $detalleY;

    /**
     * @var string
     *
     * @ORM\Column(name="fila1_col1", type="string", length=5, nullable=false)
     */
    private $fila1Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila1_col2", type="string", length=5, nullable=false)
     */
    private $fila1Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila2_col1", type="string", length=5, nullable=true)
     */
    private $fila2Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila2_col2", type="string", length=5, nullable=true)
     */
    private $fila2Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila3_col1", type="string", length=5, nullable=true)
     */
    private $fila3Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila3_col2", type="string", length=5, nullable=true)
     */
    private $fila3Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila4_col1", type="string", length=5, nullable=true)
     */
    private $fila4Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila4_col2", type="string", length=5, nullable=true)
     */
    private $fila4Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila5_col1", type="string", length=5, nullable=true)
     */
    private $fila5Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila5_col2", type="string", length=5, nullable=true)
     */
    private $fila5Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila6_col1", type="string", length=5, nullable=true)
     */
    private $fila6Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila6_col2", type="string", length=5, nullable=true)
     */
    private $fila6Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="fila7_col1", type="string", length=5, nullable=true)
     */
    private $fila7Col1;

    /**
     * @var string
     *
     * @ORM\Column(name="fila7_col2", type="string", length=5, nullable=true)
     */
    private $fila7Col2;

    /**
     * @var string
     *
     * @ORM\Column(name="margen_derecho", type="string", length=5, nullable=false)
     */
    private $margenDerecho;

    /**
     * @var string
     *
     * @ORM\Column(name="margen_inferior", type="string", length=5, nullable=false)
     */
    private $margenInferior;

    /**
     * @var string
     *
     * @ORM\Column(name="margen_izquierdo", type="string", length=5, nullable=false)
     */
    private $margenIzquierdo;

    /**
     * @var string
     *
     * @ORM\Column(name="margen_superior", type="string", length=5, nullable=false)
     */
    private $margenSuperior;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="papel", type="string", length=25, nullable=false)
     */
    private $papel;
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col2", type="string", length=5, nullable=true)
     */
    private $detalleXCol2;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col3", type="string", length=5, nullable=true)
     */
    private $detalleXCol3;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col4", type="string", length=5, nullable=true)
     */
    private $detalleXCol4;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col5", type="string", length=5, nullable=true)
     */
    private $detalleXCol5;

    /**
     * @var string
     *
     * @ORM\Column(name="pie_y", type="string", length=5, nullable=true)
     */
    private $pieY;

    /**
     * @var string
     *
     * @ORM\Column(name="pie_x_col1", type="string", length=5, nullable=true)
     */
    private $pieXCol1;

    /**
     * @var string
     *
     * @ORM\Column(name="pie_x_col2", type="string", length=5, nullable=true)
     */
    private $pieXCol2;

    /**
     * @var string
     *
     * @ORM\Column(name="detalle_x_col6", type="string", length=5, nullable=true)
     */
    private $detalleXCol6;



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
     * Set idPlantilla
     *
     * @param \Bundles\CatalogosBundle\Entity\CfgPlantilla $idPlantilla
     * @return CfgPlantilla
     */
    public function setIdPlantilla(\Bundles\CatalogosBundle\Entity\CfgPlantilla $idPlantilla = null)
    {
        $this->idPlantilla = $idPlantilla;

        return $this;
    }

    /**
     * Get idPlantilla
     *
     * @return \Bundles\CatalogosBundle\Entity\CfgPlantilla
     */
    public function getIdPlantilla()
    {
        return $this->idPlantilla;
    }

    
    /**
     * Set idFontName
     *
     * @param \Bundles\CatalogosBundle\Entity\CfgPlantilla $idFontName
     * @return CfgPlantilla
     */
    public function setIdFontName(\Bundles\CatalogosBundle\Entity\CtlFontName $idFontName = null)
    {
        $this->idFontName = $idFontName;

        return $this;
    }

    /**
     * Get idFontName
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlFontName
     */
    public function getIdFontName()
    {
        return $this->idFontName;
    }
    
    
    /**
     * Set idFontSize
     *
     * @param \Bundles\CatalogosBundle\Entity\CfgPlantilla $idFontSize
     * @return CfgPlantilla
     */
    public function setIdFontSize(\Bundles\CatalogosBundle\Entity\CtlFontSize $idFontSize = null)
    {
        $this->idFontSize = $idFontSize;

        return $this;
    }

    /**
     * Get idFontSize
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlFontSize
     */
    public function getIdFontSize()
    {
        return $this->idFontSize;
    }
    
    
    
    
    
    /**
     * Set detalleInterlineado
     *
     * @param string $detalleInterlineado
     * @return CfgFormatoDocumento
     */
    public function setDetalleInterlineado($detalleInterlineado)
    {
        $this->detalleInterlineado = $detalleInterlineado;

        return $this;
    }

    /**
     * Get detalleInterlineado
     *
     * @return string 
     */
    public function getDetalleInterlineado()
    {
        return $this->detalleInterlineado;
    }

    
    /**
     * Set interlineado
     *
     * @param string $interlineado
     * @return CfgFormatoDocumento
     */
    public function setInterlineado($interlineado)
    {
        $this->interlineado = $interlineado;

        return $this;
    }

    /**
     * Get interlineado
     *
     * @return string 
     */
    public function getInterlineado()
    {
        return $this->interlineado;
    }
    
    
    
    
    
    
    
    /**
     * Set detalleNumeroItems
     *
     * @param string $detalleNumeroItems
     * @return CfgFormatoDocumento
     */
    public function setDetalleNumeroItems($detalleNumeroItems)
    {
        $this->detalleNumeroItems = $detalleNumeroItems;

        return $this;
    }

    /**
     * Get detalleNumeroItems
     *
     * @return string 
     */
    public function getDetalleNumeroItems()
    {
        return $this->detalleNumeroItems;
    }

    /**
     * Set detalleXCol1
     *
     * @param string $detalleXCol1
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol1($detalleXCol1)
    {
        $this->detalleXCol1 = $detalleXCol1;

        return $this;
    }

    /**
     * Get detalleXCol1
     *
     * @return string 
     */
    public function getDetalleXCol1()
    {
        return $this->detalleXCol1;
    }

    /**
     * Set detalleY
     *
     * @param string $detalleY
     * @return CfgFormatoDocumento
     */
    public function setDetalleY($detalleY)
    {
        $this->detalleY = $detalleY;

        return $this;
    }

    /**
     * Get detalleY
     *
     * @return string 
     */
    public function getDetalleY()
    {
        return $this->detalleY;
    }

    /**
     * Set fila1Col1
     *
     * @param string $fila1Col1
     * @return CfgFormatoDocumento
     */
    public function setFila1Col1($fila1Col1)
    {
        $this->fila1Col1 = $fila1Col1;

        return $this;
    }

    /**
     * Get fila1Col1
     *
     * @return string 
     */
    public function getFila1Col1()
    {
        return $this->fila1Col1;
    }

    /**
     * Set fila1Col2
     *
     * @param string $fila1Col2
     * @return CfgFormatoDocumento
     */
    public function setFila1Col2($fila1Col2)
    {
        $this->fila1Col2 = $fila1Col2;

        return $this;
    }

    /**
     * Get fila1Col2
     *
     * @return string 
     */
    public function getFila1Col2()
    {
        return $this->fila1Col2;
    }

    /**
     * Set fila2Col1
     *
     * @param string $fila2Col1
     * @return CfgFormatoDocumento
     */
    public function setFila2Col1($fila2Col1)
    {
        $this->fila2Col1 = $fila2Col1;

        return $this;
    }

    /**
     * Get fila2Col1
     *
     * @return string 
     */
    public function getFila2Col1()
    {
        return $this->fila2Col1;
    }

    /**
     * Set fila2Col2
     *
     * @param string $fila2Col2
     * @return CfgFormatoDocumento
     */
    public function setFila2Col2($fila2Col2)
    {
        $this->fila2Col2 = $fila2Col2;

        return $this;
    }

    /**
     * Get fila2Col2
     *
     * @return string 
     */
    public function getFila2Col2()
    {
        return $this->fila2Col2;
    }

    /**
     * Set fila3Col1
     *
     * @param string $fila3Col1
     * @return CfgFormatoDocumento
     */
    public function setFila3Col1($fila3Col1)
    {
        $this->fila3Col1 = $fila3Col1;

        return $this;
    }

    /**
     * Get fila3Col1
     *
     * @return string 
     */
    public function getFila3Col1()
    {
        return $this->fila3Col1;
    }

    /**
     * Set fila3Col2
     *
     * @param string $fila3Col2
     * @return CfgFormatoDocumento
     */
    public function setFila3Col2($fila3Col2)
    {
        $this->fila3Col2 = $fila3Col2;

        return $this;
    }

    /**
     * Get fila3Col2
     *
     * @return string 
     */
    public function getFila3Col2()
    {
        return $this->fila3Col2;
    }

    /**
     * Set fila4Col1
     *
     * @param string $fila4Col1
     * @return CfgFormatoDocumento
     */
    public function setFila4Col1($fila4Col1)
    {
        $this->fila4Col1 = $fila4Col1;

        return $this;
    }

    /**
     * Get fila4Col1
     *
     * @return string 
     */
    public function getFila4Col1()
    {
        return $this->fila4Col1;
    }

    /**
     * Set fila4Col2
     *
     * @param string $fila4Col2
     * @return CfgFormatoDocumento
     */
    public function setFila4Col2($fila4Col2)
    {
        $this->fila4Col2 = $fila4Col2;

        return $this;
    }

    /**
     * Get fila4Col2
     *
     * @return string 
     */
    public function getFila4Col2()
    {
        return $this->fila4Col2;
    }

    /**
     * Set fila5Col1
     *
     * @param string $fila5Col1
     * @return CfgFormatoDocumento
     */
    public function setFila5Col1($fila5Col1)
    {
        $this->fila5Col1 = $fila5Col1;

        return $this;
    }

    /**
     * Get fila5Col1
     *
     * @return string 
     */
    public function getFila5Col1()
    {
        return $this->fila5Col1;
    }

    /**
     * Set fila5Col2
     *
     * @param string $fila5Col2
     * @return CfgFormatoDocumento
     */
    public function setFila5Col2($fila5Col2)
    {
        $this->fila5Col2 = $fila5Col2;

        return $this;
    }

    /**
     * Get fila5Col2
     *
     * @return string 
     */
    public function getFila5Col2()
    {
        return $this->fila5Col2;
    }

    /**
     * Set fila6Col1
     *
     * @param string $fila6Col1
     * @return CfgFormatoDocumento
     */
    public function setFila6Col1($fila6Col1)
    {
        $this->fila6Col1 = $fila6Col1;

        return $this;
    }

    /**
     * Get fila6Col1
     *
     * @return string 
     */
    public function getFila6Col1()
    {
        return $this->fila6Col1;
    }

    /**
     * Set fila6Col2
     *
     * @param string $fila6Col2
     * @return CfgFormatoDocumento
     */
    public function setFila6Col2($fila6Col2)
    {
        $this->fila6Col2 = $fila6Col2;

        return $this;
    }

    /**
     * Get fila6Col2
     *
     * @return string 
     */
    public function getFila6Col2()
    {
        return $this->fila6Col2;
    }

    /**
     * Set fila7Col1
     *
     * @param string $fila7Col1
     * @return CfgFormatoDocumento
     */
    public function setFila7Col1($fila7Col1)
    {
        $this->fila7Col1 = $fila7Col1;

        return $this;
    }

    /**
     * Get fila7Col1
     *
     * @return string 
     */
    public function getFila7Col1()
    {
        return $this->fila7Col1;
    }

    /**
     * Set fila7Col2
     *
     * @param string $fila7Col2
     * @return CfgFormatoDocumento
     */
    public function setFila7Col2($fila7Col2)
    {
        $this->fila7Col2 = $fila7Col2;

        return $this;
    }

    /**
     * Get fila7Col2
     *
     * @return string 
     */
    public function getFila7Col2()
    {
        return $this->fila7Col2;
    }

    /**
     * Set margenDerecho
     *
     * @param string $margenDerecho
     * @return CfgFormatoDocumento
     */
    public function setMargenDerecho($margenDerecho)
    {
        $this->margenDerecho = $margenDerecho;

        return $this;
    }

    /**
     * Get margenDerecho
     *
     * @return string 
     */
    public function getMargenDerecho()
    {
        return $this->margenDerecho;
    }

    /**
     * Set margenInferior
     *
     * @param string $margenInferior
     * @return CfgFormatoDocumento
     */
    public function setMargenInferior($margenInferior)
    {
        $this->margenInferior = $margenInferior;

        return $this;
    }

    /**
     * Get margenInferior
     *
     * @return string 
     */
    public function getMargenInferior()
    {
        return $this->margenInferior;
    }

    /**
     * Set margenIzquierdo
     *
     * @param string $margenIzquierdo
     * @return CfgFormatoDocumento
     */
    public function setMargenIzquierdo($margenIzquierdo)
    {
        $this->margenIzquierdo = $margenIzquierdo;

        return $this;
    }

    /**
     * Get margenIzquierdo
     *
     * @return string 
     */
    public function getMargenIzquierdo()
    {
        return $this->margenIzquierdo;
    }

    /**
     * Set margenSuperior
     *
     * @param string $margenSuperior
     * @return CfgFormatoDocumento
     */
    public function setMargenSuperior($margenSuperior)
    {
        $this->margenSuperior = $margenSuperior;

        return $this;
    }

    /**
     * Get margenSuperior
     *
     * @return string 
     */
    public function getMargenSuperior()
    {
        return $this->margenSuperior;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     * @return CfgFormatoDocumento
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
     * Set papel
     *
     * @param string $papel
     * @return CfgFormatoDocumento
     */
    public function setPapel($papel)
    {
        $this->papel = $papel;

        return $this;
    }

    /**
     * Get papel
     *
     * @return string 
     */
    public function getPapel()
    {
        return $this->papel;
    }    
    
    
    
    
    /**
     * Set detalleXCol2
     *
     * @param string $detalleXCol2
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol2($detalleXCol2)
    {
        $this->detalleXCol2 = $detalleXCol2;

        return $this;
    }

    /**
     * Get detalleXCol2
     *
     * @return string 
     */
    public function getDetalleXCol2()
    {
        return $this->detalleXCol2;
    }

    /**
     * Set detalleXCol3
     *
     * @param string $detalleXCol3
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol3($detalleXCol3)
    {
        $this->detalleXCol3 = $detalleXCol3;

        return $this;
    }

    /**
     * Get detalleXCol3
     *
     * @return string 
     */
    public function getDetalleXCol3()
    {
        return $this->detalleXCol3;
    }

    /**
     * Set detalleXCol4
     *
     * @param string $detalleXCol4
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol4($detalleXCol4)
    {
        $this->detalleXCol4 = $detalleXCol4;

        return $this;
    }

    /**
     * Get detalleXCol4
     *
     * @return string 
     */
    public function getDetalleXCol4()
    {
        return $this->detalleXCol4;
    }

    /**
     * Set detalleXCol5
     *
     * @param string $detalleXCol5
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol5($detalleXCol5)
    {
        $this->detalleXCol5 = $detalleXCol5;

        return $this;
    }

    /**
     * Get detalleXCol5
     *
     * @return string 
     */
    public function getDetalleXCol5()
    {
        return $this->detalleXCol5;
    }

    /**
     * Set pieY
     *
     * @param string $pieY
     * @return CfgFormatoDocumento
     */
    public function setPieY($pieY)
    {
        $this->pieY = $pieY;

        return $this;
    }

    /**
     * Get pieY
     *
     * @return string 
     */
    public function getPieY()
    {
        return $this->pieY;
    }

    /**
     * Set pieXCol1
     *
     * @param string $pieXCol1
     * @return CfgFormatoDocumento
     */
    public function setPieXCol1($pieXCol1)
    {
        $this->pieXCol1 = $pieXCol1;

        return $this;
    }

    /**
     * Get pieXCol1
     *
     * @return string 
     */
    public function getPieXCol1()
    {
        return $this->pieXCol1;
    }

    /**
     * Set pieXCol2
     *
     * @param string $pieXCol2
     * @return CfgFormatoDocumento
     */
    public function setPieXCol2($pieXCol2)
    {
        $this->pieXCol2 = $pieXCol2;

        return $this;
    }

    /**
     * Get pieXCol2
     *
     * @return string 
     */
    public function getPieXCol2()
    {
        return $this->pieXCol2;
    }

    /**
     * Set detalleXCol6
     *
     * @param string $detalleXCol6
     * @return CfgFormatoDocumento
     */
    public function setDetalleXCol6($detalleXCol6)
    {
        $this->detalleXCol6 = $detalleXCol6;

        return $this;
    }

    /**
     * Get detalleXCol6
     *
     * @return string 
     */
    public function getDetalleXCol6()
    {
        return $this->detalleXCol6;
    }
    
    
     /**
     * Set idTipofactura
     *
     * @param \Bundles\CatalogosBundle\Entity\CtlTipofactura $idTipofactura
     * @return CfgFormatoDocumento
     */
    public function setIdTipofactura(\Bundles\CatalogosBundle\Entity\CtlTipofactura $idTipofactura = null)
    {
        $this->idTipofactura = $idTipofactura;

        return $this;
    }

    /**
     * Get idTipofactura
     *
     * @return \Bundles\CatalogosBundle\Entity\CtlTipofactura
     */
    public function getIdTipofactura()
    {
        return $this->idTipofactura;
    }
    
       
    
    
    
    public function __toString() {
        return $this->nombre;
    }
}
