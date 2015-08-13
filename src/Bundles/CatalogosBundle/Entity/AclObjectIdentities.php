<?php

namespace Bundles\CatalogosBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AclObjectIdentities
 *
 * @ORM\Table(name="acl_object_identities", uniqueConstraints={@ORM\UniqueConstraint(name="uniq_9407e5494b12ad6ea000b10", columns={"object_identifier", "class_id"})}, indexes={@ORM\Index(name="idx_9407e54977fa751a", columns={"parent_object_identity_id"})})
 * @ORM\Entity
 */
class AclObjectIdentities
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="acl_object_identities_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="class_id", type="integer", nullable=false)
     */
    private $classId;

    /**
     * @var string
     *
     * @ORM\Column(name="object_identifier", type="string", length=100, nullable=false)
     */
    private $objectIdentifier;

    /**
     * @var boolean
     *
     * @ORM\Column(name="entries_inheriting", type="boolean", nullable=false)
     */
    private $entriesInheriting;

    /**
     * @var \AclObjectIdentities
     *
     * @ORM\ManyToOne(targetEntity="AclObjectIdentities")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="parent_object_identity_id", referencedColumnName="id")
     * })
     */
    private $parentObjectentity;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AclObjectIdentities", inversedBy="objectentity")
     * @ORM\JoinTable(name="acl_object_identity_ancestors",
     *   joinColumns={
     *     @ORM\JoinColumn(name="object_identity_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ancestor_id", referencedColumnName="id")
     *   }
     * )
     */
    private $ancestor;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->ancestor = new \Doctrine\Common\Collections\ArrayCollection();
    }


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
     * Set classId
     *
     * @param integer $classId
     * @return AclObjectIdentities
     */
    public function setClassId($classId)
    {
        $this->classId = $classId;

        return $this;
    }

    /**
     * Get classId
     *
     * @return integer 
     */
    public function getClassId()
    {
        return $this->classId;
    }

    /**
     * Set objectIdentifier
     *
     * @param string $objectIdentifier
     * @return AclObjectIdentities
     */
    public function setObjectIdentifier($objectIdentifier)
    {
        $this->objectIdentifier = $objectIdentifier;

        return $this;
    }

    /**
     * Get objectIdentifier
     *
     * @return string 
     */
    public function getObjectIdentifier()
    {
        return $this->objectIdentifier;
    }

    /**
     * Set entriesInheriting
     *
     * @param boolean $entriesInheriting
     * @return AclObjectIdentities
     */
    public function setEntriesInheriting($entriesInheriting)
    {
        $this->entriesInheriting = $entriesInheriting;

        return $this;
    }

    /**
     * Get entriesInheriting
     *
     * @return boolean 
     */
    public function getEntriesInheriting()
    {
        return $this->entriesInheriting;
    }

    /**
     * Set parentObjectentity
     *
     * @param \Bundles\CatalogosBundle\Entity\AclObjectIdentities $parentObjectentity
     * @return AclObjectIdentities
     */
    public function setParentObjectentity(\Bundles\CatalogosBundle\Entity\AclObjectIdentities $parentObjectentity = null)
    {
        $this->parentObjectentity = $parentObjectentity;

        return $this;
    }

    /**
     * Get parentObjectentity
     *
     * @return \Bundles\CatalogosBundle\Entity\AclObjectIdentities 
     */
    public function getParentObjectentity()
    {
        return $this->parentObjectentity;
    }

    /**
     * Add ancestor
     *
     * @param \Bundles\CatalogosBundle\Entity\AclObjectIdentities $ancestor
     * @return AclObjectIdentities
     */
    public function addAncestor(\Bundles\CatalogosBundle\Entity\AclObjectIdentities $ancestor)
    {
        $this->ancestor[] = $ancestor;

        return $this;
    }

    /**
     * Remove ancestor
     *
     * @param \Bundles\CatalogosBundle\Entity\AclObjectIdentities $ancestor
     */
    public function removeAncestor(\Bundles\CatalogosBundle\Entity\AclObjectIdentities $ancestor)
    {
        $this->ancestor->removeElement($ancestor);
    }

    /**
     * Get ancestor
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getAncestor()
    {
        return $this->ancestor;
    }
}
