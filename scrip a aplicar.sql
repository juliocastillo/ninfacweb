BEGIN;

-- CREATE TABLE "ctl_motivo_anulacion" -------------------------
CREATE TABLE "public"."ctl_motivo_anulacion" ( 
	"id" Serial NOT NULL,
	"nombre" Character Varying( 100 ) COLLATE "pg_catalog"."default" NOT NULL,
	"activo" Boolean NOT NULL,
	PRIMARY KEY ( "id" ) );
 
CREATE INDEX "index_id2" ON "public"."ctl_motivo_anulacion" USING btree( "id" );
-- -------------------------------------------------------------

COMMIT;





BEGIN;

BEGIN;

-- CREATE TABLE "fac_factura_anulada" --------------------------
CREATE TABLE "public"."fac_factura_anulada" ( 
	"id" Serial NOT NULL,
	"id_factura" Integer NOT NULL,
	"id_empleado" Integer NOT NULL,
	"id_motivo_anulacion" Serial NOT NULL,
	"fecha" Date,
	PRIMARY KEY ( "id" ) );
 
CREATE INDEX "index_id1" ON "public"."fac_factura_anulada" USING btree( "id" );
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE LINK "lnk_ctl_empleado_fac_factura_anulada" ----------
ALTER TABLE "fac_factura_anulada"
	ADD CONSTRAINT "lnk_ctl_empleado_fac_factura_anulada" FOREIGN KEY ( "id_empleado" )
	REFERENCES "ctl_empleado" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE LINK "lnk_fac_factura_fac_factura_anulada" -----------
ALTER TABLE "fac_factura_anulada"
	ADD CONSTRAINT "lnk_fac_factura_fac_factura_anulada" FOREIGN KEY ( "id_factura" )
	REFERENCES "fac_factura" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE LINK "lnk_ctl_motivo_anulacion_fac_factura_anulada" --
ALTER TABLE "fac_factura_anulada"
	ADD CONSTRAINT "lnk_ctl_motivo_anulacion_fac_factura_anulada" FOREIGN KEY ( "id_motivo_anulacion" )
	REFERENCES "ctl_motivo_anulacion" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;