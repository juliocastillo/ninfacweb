BEGIN;

-- CREATE FIELD "date_add" -------------------------------------
ALTER TABLE "public"."inv_inicial" ADD COLUMN "date_add" Date;
-- -------------------------------------------------------------

-- CREATE FIELD "date_mod" -------------------------------------
ALTER TABLE "public"."inv_inicial" ADD COLUMN "date_mod" Date;
-- -------------------------------------------------------------

-- CREATE FIELD "id_user_add" ----------------------------------
ALTER TABLE "public"."inv_inicial" ADD COLUMN "id_user_add" Integer;
-- -------------------------------------------------------------

-- CREATE FIELD "id_user_mod" ----------------------------------
ALTER TABLE "public"."inv_inicial" ADD COLUMN "id_user_mod" Integer;
-- -------------------------------------------------------------

COMMIT;