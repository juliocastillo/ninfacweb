<?php
namespace Application\CoreBundle\Service;

use Doctrine\DBAL\Connection;
use FOS\UserBundle\Mailer\Mailer;
use Symfony\Component\DependencyInjection\Exception\ParameterNotFoundException;
use Symfony\Component\OptionsResolver\Exception\MissingOptionsException;

class MailService {

	private $container;
    private $mailSubject;
    private $mailFrom;
    private $mailTo;
    private $mailTemplate;

	public function __construct($container = null) {
        $this->container = $container;
    }

    public function sendMail($parameters = array()) {
        $em      = $this->container->get('doctrine')->getManager();
        $mailer  = $this->container->get('mailer');
        $body    = $this->container->get('templating');
        $baseUrl = $this->container->get('router')->getContext()->getHost();

        if($this->mailSubject === NULL || $this->mailSubject === '') {
            throw new MissingOptionsException('El parámetro mailSubject (asunto del correo) no ha sido definido. mailSubject: '.$this->mailSubject);
        }

        if($this->mailFrom === NULL || $this->mailFrom === '') {
			$this->mailFrom = $this->container->getParameter('mailer_email');

            if($this->mailFrom === NULL || $this->mailFrom === '') {
                throw new ParameterNotFoundException('mail.service','mailer_email');
            }
        }

        if($this->mailTo === NULL || $this->mailTo === '') {
            throw new MissingOptionsException('El parámetro mailTo (correo destinatario) no ha sido definido: '.$this->mailTo);
        }

		$parameters['baseurl'] = $baseUrl;

        $this->mailTemplate = $this->mailTemplate ? $this->mailTemplate : 'ApplicationCoreBundle:Mail:standardEmailLayout.html.twig';

        $message = \Swift_Message::newInstance()
            ->setSubject($this->mailSubject)
            ->setFrom($this->mailFrom)
            ->setTo($this->mailTo)
            ->setBody($body->render($this->mailTemplate,$parameters),'text/html');

        $result = $mailer->send($message);

        if($result == 0) {
            return false;
        } else {
            return true;
        }
    }

    public function setMailSubject($mailSubject) {
        $this->mailSubject = $mailSubject;

        return $this;
    }

    public function getMailSubject() {
        return $this->mailSubject;
    }

    public function setMailFrom($mailFrom) {
        $this->mailFrom = $mailFrom;

        return $this;
    }

    public function getMailFrom() {
        return $this->mailFrom;
    }

    public function setMailTo($mailTo) {
        $this->mailTo = $mailTo;

        return $this;
    }

    public function getMailTo() {
        return $this->mailTo;
    }

    public function setMailTemplate($mailTemplate) {
        $this->mailTemplate = $mailTemplate;

        return $this;
    }

    public function getMailTemplate() {
        return $this->mailTemplate;
    }
}
