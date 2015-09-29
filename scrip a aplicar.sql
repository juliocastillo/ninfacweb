BEGIN;


-- CREATE FIELD "estado" ---------------------------------------
ALTER TABLE "public"."cxc_cobro" ADD COLUMN "estado" Character Varying( 10 );
-- -------------------------------------------------------------;

COMMIT;


BEGIN;


-- CREATE TABLE "cxc_cobro_reporte" ----------------------------
CREATE TABLE "public"."cxc_cobro_reporte" ( 
	"abonos" Numeric( 10, 2 ) NOT NULL, 
	"estado" Character Varying( 2044 ) NOT NULL, 
	"fecha" Date NOT NULL, 
	"id" Serial NOT NULL, 
	"id_empleado" Integer NOT NULL, 
	"total_credito" Numeric( 10, 2 ) NOT NULL, 
	"ventas" Numeric( 10, 2 ) NOT NULL,
 PRIMARY KEY ( "id" )
 );
-- Set comments for fields
COMMENT ON COLUMN "public"."cxc_cobro_reporte"."abonos" IS 'cantidad recuperada por cobradores';COMMENT ON COLUMN "public"."cxc_cobro_reporte"."estado" IS 'almacena el estado PAGADO al finalizar el informe y procesarlo';COMMENT ON COLUMN "public"."cxc_cobro_reporte"."fecha" IS 'fecha de elaboracion del informe';COMMENT ON COLUMN "public"."cxc_cobro_reporte"."id_empleado" IS 'fk - ctl_empleado almacena el responsable de generar y validar el informe';COMMENT ON COLUMN "public"."cxc_cobro_reporte"."total_credito" IS 'almacena total de ingresos por cuentas por cobrar y ventas al contado';COMMENT ON COLUMN "public"."cxc_cobro_reporte"."ventas" IS 'suma total venta con facturas al contado';
-- -------------------------------------------------------------;

COMMIT;


BEGIN;


-- CREATE LINK "lnk_ctl_empleado_cxc_cobro_reporte" ------------
ALTER TABLE "public"."cxc_cobro_reporte"   ADD CONSTRAINT "lnk_ctl_empleado_cxc_cobro_reporte"   FOREIGN KEY ( "id_empleado"	) REFERENCES   "public"."ctl_empleado"  ( "id" ) MATCH FULL ON DELETE Cascade ON UPDATE Cascade;
-- -------------------------------------------------------------;

COMMIT;



BEGIN;


-- CHANGE "LENGTH" OF "FIELD "estado" --------------------------
ALTER TABLE "public"."cxc_cobro_reporte" ALTER COLUMN "estado" TYPE Character Varying( 10 ) COLLATE "pg_catalog"."default";
-- -------------------------------------------------------------;

COMMIT;


BEGIN;


-- CHANGE "UNIQUE" OF "FIELD "fecha" ---------------------------
-- Will be changed by uniques;
-- -------------------------------------------------------------

-- CREATE UNIQUE "unique_fecha" --------------------------------
ALTER TABLE "public"."cxc_cobro_reporte" ADD CONSTRAINT "unique_fecha" UNIQUE( "fecha" );
-- -------------------------------------------------------------;

COMMIT;