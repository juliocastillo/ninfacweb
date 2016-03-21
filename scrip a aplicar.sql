

BEGIN;

-- CREATE TABLE "inv_inicial" ----------------------------------
CREATE TABLE "public"."inv_inicial" ( 
	"id" Integer NOT NULL,
	"id_producto" Integer NOT NULL,
	"fecha" Date NOT NULL,
	"lote" Character Varying( 25 ) COLLATE "pg_catalog"."default" NOT NULL,
	"modelo" Character Varying( 50 ) COLLATE "pg_catalog"."default" NOT NULL,
	"serie" Character Varying( 50 ) COLLATE "pg_catalog"."default" NOT NULL,
	"cantidad" Numeric( 10, 2 ) NOT NULL,
	"activo" Boolean NOT NULL,
	PRIMARY KEY ( "id" ) );
 
CREATE INDEX "index_id" ON "public"."inv_inicial" USING btree( "id" );
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE LINK "lnk_ctl_producto_inv_inicial" ------------------
ALTER TABLE "inv_inicial"
	ADD CONSTRAINT "lnk_ctl_producto_inv_inicial" FOREIGN KEY ( "id_producto" )
	REFERENCES "ctl_producto" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE UNIQUE "uk_inv_inicial" ------------------------------
ALTER TABLE "public"."inv_inicial" ADD CONSTRAINT "uk_inv_inicial" UNIQUE( "id_producto", "serie" );
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE FIELD "fecha_vencimiento" ----------------------------
ALTER TABLE "public"."inv_inicial" ADD COLUMN "fecha_vencimiento" Date NOT NULL;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "fecha_vencimiento" -------------
ALTER TABLE "public"."inv_inicial" ALTER COLUMN "fecha_vencimiento" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "serie" -------------------------
ALTER TABLE "public"."inv_inicial" ALTER COLUMN "serie" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "modelo" ------------------------
ALTER TABLE "public"."inv_inicial" ALTER COLUMN "modelo" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "lote" --------------------------
ALTER TABLE "public"."inv_inicial" ALTER COLUMN "lote" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;




