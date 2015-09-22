<?php

namespace Bundles\CatalogosBundle\Service\JasperReportService;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Bundles\CatalogosBundle\Service\JasperReportService\JasperClient as JasperClient;

class JasperReportService extends Controller {
  private $jasper_username;
  private $jasper_password;
  private $jasper_url;
  private $report_path;
  private $report_name;
  private $report_format;
  private $report_params;


  public function __construct($jasper_username, $jasper_password, $jasper_url) {
    $this->jasper_username = $jasper_username;
    $this->jasper_password = $jasper_password;
    $this->jasper_url = $jasper_url;
  }

  public function buildReport() {
        $report_unit = $this->report_path.$this->report_name;

        $client = new JasperClient($this->jasper_url, $this->jasper_username, $this->jasper_password);

        $contentType = (($this->report_format == 'HTML') ? 'text' : 'application') .
               '/' . strtolower($this->report_format);


        $result = $client->requestReport($report_unit, $this->report_format, $this->report_params);

        $response = new Response();
        $response->headers->set('Content-Type', $contentType);

        //para cuando sea una hoja de calculo, en este informe sÃ³lo  estÃ¡n las opciones PDF y hoja de cÃ¡lculo
        if (strtoupper($this->report_format) != 'PDF' && strtoupper($this->report_format) != 'HTML')
            $response->headers->set('Content-disposition', 'attachment; filename="' . $this->report_name . '.' . strtolower($this->report_format) . '"');

        $response->setContent($result);

        return $response;
    }

  public function setReportPath($report_path) {
    $this->report_path = $report_path;
  }

  public function setReportName($report_name) {
    $this->report_name = $report_name;
  }

  public function setReportFormat($report_format) {
    $this->report_format = $report_format;
  }

  public function setReportParams(array $report_params) {
    $this->report_params = $report_params;
  }
}
