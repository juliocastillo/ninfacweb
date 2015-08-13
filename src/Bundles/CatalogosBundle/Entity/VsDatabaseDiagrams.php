<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * VsDatabaseDiagrams
 *
 * @ORM\Table(name="vs_database_diagrams")
 * @ORM\Entity
 */
class VsDatabaseDiagrams
{
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=80, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="vs_database_diagrams_name_seq", allocationSize=1, initialValue=1)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="diadata", type="text", nullable=true)
     */
    private $diadata;

    /**
     * @var string
     *
     * @ORM\Column(name="comment", type="string", length=1022, nullable=true)
     */
    private $comment;

    /**
     * @var string
     *
     * @ORM\Column(name="preview", type="text", nullable=true)
     */
    private $preview;

    /**
     * @var string
     *
     * @ORM\Column(name="lockinfo", type="string", length=80, nullable=true)
     */
    private $lockinfo;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="locktime", type="datetimetz", nullable=true)
     */
    private $locktime;

    /**
     * @var string
     *
     * @ORM\Column(name="version", type="string", length=80, nullable=true)
     */
    private $version;



    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set diadata
     *
     * @param string $diadata
     * @return VsDatabaseDiagrams
     */
    public function setDiadata($diadata)
    {
        $this->diadata = $diadata;

        return $this;
    }

    /**
     * Get diadata
     *
     * @return string 
     */
    public function getDiadata()
    {
        return $this->diadata;
    }

    /**
     * Set comment
     *
     * @param string $comment
     * @return VsDatabaseDiagrams
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string 
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set preview
     *
     * @param string $preview
     * @return VsDatabaseDiagrams
     */
    public function setPreview($preview)
    {
        $this->preview = $preview;

        return $this;
    }

    /**
     * Get preview
     *
     * @return string 
     */
    public function getPreview()
    {
        return $this->preview;
    }

    /**
     * Set lockinfo
     *
     * @param string $lockinfo
     * @return VsDatabaseDiagrams
     */
    public function setLockinfo($lockinfo)
    {
        $this->lockinfo = $lockinfo;

        return $this;
    }

    /**
     * Get lockinfo
     *
     * @return string 
     */
    public function getLockinfo()
    {
        return $this->lockinfo;
    }

    /**
     * Set locktime
     *
     * @param \DateTime $locktime
     * @return VsDatabaseDiagrams
     */
    public function setLocktime($locktime)
    {
        $this->locktime = $locktime;

        return $this;
    }

    /**
     * Get locktime
     *
     * @return \DateTime 
     */
    public function getLocktime()
    {
        return $this->locktime;
    }

    /**
     * Set version
     *
     * @param string $version
     * @return VsDatabaseDiagrams
     */
    public function setVersion($version)
    {
        $this->version = $version;

        return $this;
    }

    /**
     * Get version
     *
     * @return string 
     */
    public function getVersion()
    {
        return $this->version;
    }
}
