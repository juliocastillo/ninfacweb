BEGIN;

-- CREATE FIELD "tipo_compra" ----------------------------------
ALTER TABLE "public"."inv_entrada" ADD COLUMN "tipo_compra" Integer;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE FIELD "costo_adicional" ------------------------------
ALTER TABLE "public"."inv_entradadetalle" ADD COLUMN "costo_adicional" Numeric( 10, 2 );
-- -------------------------------------------------------------

COMMIT;