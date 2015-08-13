<?php
namespace Application\Sonata\UserBundle\Entity;
 
use Sonata\UserBundle\Entity\BaseGroup as BaseGroup;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user_group")
 */
class Group extends BaseGroup
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
 
    /**
     * @var string
     * @Assert\Regex(pattern="/^[a-zA-ZaÑñáéíóúÁÉÍÓÚ ]+$/",match=true)
     * @ORM\Column(name="name")
     */
 
    /**
     * Get id
     *
     * @return integer $id
     */
    public function getId()
    {
        return $this->id;
    }
}