BEGIN;

-- CREATE FIELD "autorizar_cobro" ------------------------------
ALTER TABLE "public"."ctl_empleado" ADD COLUMN "autorizar_cobro" Boolean;
-- -------------------------------------------------------------

-- CREATE FIELD "autorizar_venta" ------------------------------
ALTER TABLE "public"."ctl_empleado" ADD COLUMN "autorizar_venta" Boolean;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE FIELD "id_tipofactura" -------------------------------
ALTER TABLE "public"."cfg_formato_documento" ADD COLUMN "id_tipofactura" Integer;
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE LINK "lnk_ctl_tipofactura_cfg_formato_documento" -----
ALTER TABLE "cfg_formato_documento"
	ADD CONSTRAINT "lnk_ctl_tipofactura_cfg_formato_documento" FOREIGN KEY ( "id_tipofactura" )
	REFERENCES "ctl_tipofactura" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;



-- despues de rellenar el id del tipo de documento
  

BEGIN;

-- CREATE FIELD "codigo" ---------------------------------------
ALTER TABLE "public"."ctl_empleado" ADD COLUMN "codigo" Character Varying( 25 ) COLLATE "pg_catalog"."default";
-- -------------------------------------------------------------

-- CREATE INDEX "index_codigo" ---------------------------------
CREATE INDEX "index_codigo" ON "public"."ctl_empleado" USING btree( "codigo" );
-- -------------------------------------------------------------

-- CREATE UNIQUE "unique_codigo" -------------------------------
ALTER TABLE "public"."ctl_empleado" ADD CONSTRAINT "unique_codigo" UNIQUE( "codigo" );
-- -------------------------------------------------------------

COMMIT;
  

  
  
  
BEGIN;

-- CHANGE "INDEXED" OF "FIELD "nombres" ------------------------
-- Will be changed by indexes
-- -------------------------------------------------------------

-- CHANGE "INDEXED" OF "FIELD "apellidos" ----------------------
-- Will be changed by indexes
-- -------------------------------------------------------------

-- CREATE INDEX "index_nombres" --------------------------------
CREATE INDEX "index_nombres" ON "public"."ctl_empleado" USING btree( "nombres" );
-- -------------------------------------------------------------

-- CREATE INDEX "index_apellidos" ------------------------------
CREATE INDEX "index_apellidos" ON "public"."ctl_empleado" USING btree( "apellidos" );
-- -------------------------------------------------------------

COMMIT;