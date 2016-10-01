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



BEGIN;

-- CREATE TABLE "ctl_motivo_notacredito" -----------------------
CREATE TABLE "public"."ctl_motivo_notacredito" ( 
	"id" Serial NOT NULL,
	"nombre" Character Varying( 100 ) NOT NULL,
	"activo" Boolean NOT NULL,
	PRIMARY KEY ( "id" ),
	CONSTRAINT "pk_motivo_notacredito_id" UNIQUE( "id" ) );
 COMMENT ON TABLE  "public"."ctl_motivo_notacredito" IS 'almacena los motivos por lo que se elabora una nota de credito.
1 Devolucion (producto dañado u otros arreglos) se devuelve producto
2 Descuento/Rebajas Pronto pago (se devuelve efectivo o un porcentaje de la venta)';
-- Set comments for fields
COMMENT ON COLUMN "public"."ctl_motivo_notacredito"."id" IS 'llave primaria';
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE TABLE "fac_notacredito" ------------------------------
CREATE TABLE "public"."fac_notacredito" ( 
	"id" Serial NOT NULL,
	"fecha" Date NOT NULL,
	"sumas" Numeric( 10, 2 ) NOT NULL,
	"iva" Numeric( 10, 2 ) NOT NULL,
	"subtotal" Numeric( 10, 2 ) NOT NULL,
	"iva_retenido" Numeric( 10, 2 ) NOT NULL,
	"ventas_exentas" Numeric( 10, 2 ) NOT NULL,
	"venta_total" Numeric( 10, 2 ) NOT NULL,
	"activo" Boolean NOT NULL,
	"id_user_add" Integer NOT NULL,
	"id_user_mod" Integer,
	"date_add" Date NOT NULL,
	"date_mod" Date,
	"id_factura" Integer NOT NULL,
	"id_motivo_notacredito" Serial NOT NULL,
	PRIMARY KEY ( "id" ),
	CONSTRAINT "pk_notacredito_id" UNIQUE( "id" ) );
 
CREATE INDEX "index_fac_factura_id" ON "public"."fac_notacredito" USING btree( "id_factura" );


CREATE INDEX "index_ctl_motivo_notacredito_id" ON "public"."fac_notacredito" USING btree( "id_motivo_notacredito" );

COMMENT ON TABLE  "public"."fac_notacredito" IS 'Nota de credito para devolución de producto, efectivo o descuento';
-- Set comments for fields
COMMENT ON COLUMN "public"."fac_notacredito"."id" IS 'primary key';COMMENT ON COLUMN "public"."fac_notacredito"."fecha" IS 'Fecha en que se elaboro la nota de credito';COMMENT ON COLUMN "public"."fac_notacredito"."sumas" IS 'la sumatora de todos los item en el caso de dovolución de producto se calcula automaticamente, en el caso de descuento o devolución de efectivo se edita';COMMENT ON COLUMN "public"."fac_notacredito"."iva" IS 'calculo del iva a la sumatoria 13% al momento de la creacion del sistema';COMMENT ON COLUMN "public"."fac_notacredito"."venta_total" IS 'valor total del documento, con todos los descuentos o adiciones aplicadas';
-- -------------------------------------------------------------

COMMIT;





BEGIN;

-- CREATE LINK "lnk_ctl_motivo_notacredito_fac_notacredito" ----
ALTER TABLE "public"."fac_notacredito"
	ADD CONSTRAINT "lnk_ctl_motivo_notacredito_fac_notacredito" FOREIGN KEY ( "id_motivo_notacredito" )
	REFERENCES "public"."ctl_motivo_notacredito" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;




BEGIN;

-- CREATE LINK "lnk_fac_factura_fac_notacredito" ---------------
ALTER TABLE "public"."fac_notacredito"
	ADD CONSTRAINT "lnk_fac_factura_fac_notacredito" FOREIGN KEY ( "id_factura" )
	REFERENCES "public"."fac_factura" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE TABLE "fac_notacreditodetalle" -----------------------
CREATE TABLE "public"."fac_notacreditodetalle" ( 
	"id" Serial NOT NULL,
	"cantidad" Numeric( 10, 2 ) NOT NULL,
	"precio_unitario" Numeric( 10, 2 ) NOT NULL,
	"ventas_exentas" Numeric( 10, 2 ) NOT NULL,
	"ventas_gravadas" Numeric( 10, 2 ) NOT NULL,
	"historial" Boolean NOT NULL,
	"id_facturadetalle" Integer NOT NULL,
	"id_notacredito" Integer NOT NULL,
	PRIMARY KEY ( "id" ) );
 
CREATE INDEX "index_fac_facturadetalle_id" ON "public"."fac_notacreditodetalle" USING btree( "id_facturadetalle" );


CREATE INDEX "index_fac_notacredito_id" ON "public"."fac_notacreditodetalle" USING btree( "id_notacredito" );


-- Set comments for fields
COMMENT ON COLUMN "public"."fac_notacreditodetalle"."cantidad" IS 'establece la cantidad de producto a ser devuelto al inventario';COMMENT ON COLUMN "public"."fac_notacreditodetalle"."precio_unitario" IS 'precio al que fue devuelto el producto';
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE LINK "lnk_fac_notacredito_fac_notacreditodetalle" ----
ALTER TABLE "public"."fac_notacreditodetalle"
	ADD CONSTRAINT "lnk_fac_notacredito_fac_notacreditodetalle" FOREIGN KEY ( "id_notacredito" )
	REFERENCES "public"."fac_notacredito" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE LINK "lnk_fac_facturadetalle_fac_notacreditodetalle" -
ALTER TABLE "public"."fac_notacreditodetalle"
	ADD CONSTRAINT "lnk_fac_facturadetalle_fac_notacreditodetalle" FOREIGN KEY ( "id_facturadetalle" )
	REFERENCES "public"."fac_facturadetalle" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;





BEGIN;

-- CREATE FIELD "id_inv_producto_mov" --------------------------
ALTER TABLE "public"."fac_notacreditodetalle" ADD COLUMN "id_inv_producto_mov" Integer NOT NULL;
-- -------------------------------------------------------------

-- CREATE INDEX "index_inv_producto_mov_id" --------------------
CREATE INDEX "index_inv_producto_mov_id" ON "public"."fac_notacreditodetalle" USING btree( "id_inv_producto_mov" );
-- -------------------------------------------------------------

COMMIT;




BEGIN;

-- CREATE LINK "lnk_inv_producto_mov_fac_notacreditodetalle" ---
ALTER TABLE "public"."fac_notacreditodetalle"
	ADD CONSTRAINT "lnk_inv_producto_mov_fac_notacreditodetalle" FOREIGN KEY ( "id_inv_producto_mov" )
	REFERENCES "public"."inv_producto_mov" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CREATE FIELD "numero" ---------------------------------------
ALTER TABLE "public"."fac_notacredito" ADD COLUMN "numero" Integer NOT NULL;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "ventas_exentas" ----------------
ALTER TABLE "public"."fac_notacreditodetalle" ALTER COLUMN "ventas_exentas" DROP NOT NULL;
-- -------------------------------------------------------------

-- CHANGE "NULLABLE" OF "FIELD "ventas_gravadas" ---------------
ALTER TABLE "public"."fac_notacreditodetalle" ALTER COLUMN "ventas_gravadas" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;


BEGIN;

-- CHANGE "NULLABLE" OF "FIELD "historial" ---------------------
ALTER TABLE "public"."fac_notacreditodetalle" ALTER COLUMN "historial" DROP NOT NULL;
-- -------------------------------------------------------------

COMMIT;



BEGIN;

-- CREATE LINK "lnk_fos_user_user_fac_notacredito_2" -----------
ALTER TABLE "public"."fac_notacredito"
	ADD CONSTRAINT "lnk_fos_user_user_fac_notacredito_2" FOREIGN KEY ( "id_user_mod" )
	REFERENCES "public"."fos_user_user" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;

BEGIN;

-- CREATE LINK "lnk_fos_user_user_fac_notacredito" -------------
ALTER TABLE "public"."fac_notacredito"
	ADD CONSTRAINT "lnk_fos_user_user_fac_notacredito" FOREIGN KEY ( "id_user_add" )
	REFERENCES "public"."fos_user_user" ( "id" ) MATCH FULL
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------

COMMIT;