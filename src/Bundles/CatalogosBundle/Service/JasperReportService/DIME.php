<?php
namespace Application\CoreBundle\Service\JasperReportService;

class DIME {

    const TYPE_BINARY = 1;
    const TYPE_XML = 2;

    public $records;
    public $files;

    function __construct($input) {
        $this->records = array();
        $pos = 0;
// Break out parts from the message string
        do {
            $r = new DIMERecord;
// Shift out bitfields for the first fields
            $b = ord($input[$pos++]);
            $r->version = ($b >> 3) & 31;
            $r->first = ($b >> 2) & 1;
            $r->last = ($b >> 1) & 1;
            $r->chunked = $b & 1;
            $r->type_format = (ord($input[$pos++]) >> 4) & 15;
// Fetch big-endian lengths
            $lengths = array();
            $lengths['options'] = ord($input[$pos++]) << 8;
            $lengths['options'] |= ord($input[$pos++]);
            $lengths['id'] = ord($input[$pos++]) << 8;
            $lengths['id'] |= ord($input[$pos++]);
            $lengths['type'] = ord($input[$pos++]) << 8;
            $lengths['type'] |= ord($input[$pos++]);
            $lengths['data'] = ord($input[$pos++]) << 24;
            $lengths['data'] |= (ord($input[$pos++]) << 16);
            $lengths['data'] |= (ord($input[$pos++]) << 8);
            $lengths['data'] |= ord($input[$pos++]);
// Read in padded data
            foreach ($lengths as $lk => $lv) {
                $r->$lk = substr($input, $pos, $lv);
                $pos += $lv;
                if ($lv & 3)
                    $pos += (4 - ($lv & 3));
            } $this->records[] = $r;
        } while ($pos < strlen($input));
// Unchunk records into files, as required
        $previous_chunk = 0;
        foreach ($this->records as $r) {
            if (!$r->chunked) {
                if (!$previous_chunk) {
// Normal part
                    $f = new DIMEFile;
                    $f->type_format = $r->type_format;
                    $f->type = $r->type;
                    $f->id = $r->id;
                    $f->data = $r->data;
                    $this->files[] = $f;
                } else {
// Final chunk
                    $f->data .= $r->data;
                    $this->files[] = $f;
                }
            } else {
                if (!$previous_chunk) {
// First chunk
                    $f = new DIMEFile;
                    $f->type_format = $r->type_format;
                    $f->type = $r->type;
                    $f->id = $r->id;
                    $f->data = $r->data;
                } else {
// Continuation
                    $f->data .= $r->data;
                }
            } $previous_chunk = $r->chunked;
        }
    }

}

?>
