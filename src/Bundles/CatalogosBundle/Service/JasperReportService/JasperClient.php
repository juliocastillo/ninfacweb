<?php

namespace Bundles\CatalogosBundle\Service\JasperReportService;

class JasperClient {

    private $url;
    private $username;
    private $password;

    public function __construct($url, $username, $password) {
        $this->url = $url;
        $this->username = $username;
        $this->password = $password;
    }

    public function requestReport($report, $format, $params) {
        $params_xml = "";
        foreach ($params as $name => $value) {
            $params_xml .= "<parameter name=\"$name\"><![CDATA[$value]]></parameter>\n";
        }
        // This is a report parameter passed in.
        $request = '<?xml version="1.0" encoding="UTF-8"?>
                <request operationName="runReport" locale="en">
                    <argument name="RUN_OUTPUT_FORMAT">' . $format . '</argument>
                    <argument name="USE_DIME_ATTACHMENTS"><![CDATA[1]]></argument>
                    <resourceDescriptor name="" wsType="reportUnit" uriString="' . $report . '" isNew="false">
                        <label></label>'
                        . $params_xml .
                        '</resourceDescriptor>
                </request>
            ';
        $client = new \SoapClient(null, array(
                    'location' => $this->url,
                    'uri' => 'urn:',
                    'login' => $this->username,
                    'password' => $this->password,
                    'trace' => 1,
                    'exception' => 1,
                    'soap_version' => \SOAP_1_1,
                    'style' => \SOAP_RPC,
                    'use' => \SOAP_LITERAL
                ));

        $result = null;
        try {
            $client->__soapCall('runReport', array('request' => $request));
        } catch (\SoapFault $cf) {
            // A DIME-encoded message has no text, generating an exception
            // Parse out the traced response, and get the file from there
            // Response should be one XML file, and one binary
            $dp = new DIME($client->__getLastResponse());

            $images = array();
            foreach ($dp->files as $f) {
                $extension = explode('/', $f->type);
                if ($extension[0] == 'image') {
                    $ruta = dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'..'.
                                DIRECTORY_SEPARATOR. '..'.DIRECTORY_SEPARATOR.
                           '..'.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'web'.
                            DIRECTORY_SEPARATOR.'imagenes'.DIRECTORY_SEPARATOR;
                    //$ruta = dirname(__FILE__).'/../../../../../web/imagenes/';
                    $filename = $ruta . $f->id;
                    file_put_contents($filename, $f->data);
                    continue;
                }
                if ($f->type_format == DIME::TYPE_BINARY)
                    $result .= $f->data;
            }
        }
        $result = str_replace('images/', '/imagenes/', $result);
        return $result;
    }

}
?>
