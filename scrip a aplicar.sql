

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