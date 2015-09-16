toc.dat                                                                                             0000600 0004000 0002000 00000404016 12576130370 014450  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       3    ;                s            ninfac    9.4.4    9.4.4 �   
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         
           1262    16891    ninfac    DATABASE     x   CREATE DATABASE ninfac WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE ninfac;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5         
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5         �            3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    255         �            1259    16892    acl_classes    TABLE     f   CREATE TABLE acl_classes (
    id integer NOT NULL,
    class_type character varying(200) NOT NULL
);
    DROP TABLE public.acl_classes;
       public         postgres    false    5         �            1259    16895    acl_classes_id_seq    SEQUENCE     t   CREATE SEQUENCE acl_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.acl_classes_id_seq;
       public       postgres    false    172    5         
           0    0    acl_classes_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acl_classes_id_seq OWNED BY acl_classes.id;
            public       postgres    false    173         �            1259    16897    acl_entries    TABLE     �  CREATE TABLE acl_entries (
    id integer NOT NULL,
    class_id integer NOT NULL,
    object_identity_id integer,
    security_identity_id integer NOT NULL,
    field_name character varying(50) DEFAULT NULL::character varying,
    ace_order smallint NOT NULL,
    mask integer NOT NULL,
    granting boolean NOT NULL,
    granting_strategy character varying(30) NOT NULL,
    audit_success boolean NOT NULL,
    audit_failure boolean NOT NULL
);
    DROP TABLE public.acl_entries;
       public         postgres    false    5         �            1259    16901    acl_entries_id_seq    SEQUENCE     t   CREATE SEQUENCE acl_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.acl_entries_id_seq;
       public       postgres    false    174    5         
           0    0    acl_entries_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE acl_entries_id_seq OWNED BY acl_entries.id;
            public       postgres    false    175         �            1259    16903    acl_object_identities    TABLE     �   CREATE TABLE acl_object_identities (
    id integer NOT NULL,
    parent_object_identity_id integer,
    class_id integer NOT NULL,
    object_identifier character varying(100) NOT NULL,
    entries_inheriting boolean NOT NULL
);
 )   DROP TABLE public.acl_object_identities;
       public         postgres    false    5         �            1259    16906    acl_object_identities_id_seq    SEQUENCE     ~   CREATE SEQUENCE acl_object_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.acl_object_identities_id_seq;
       public       postgres    false    5    176         
           0    0    acl_object_identities_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE acl_object_identities_id_seq OWNED BY acl_object_identities.id;
            public       postgres    false    177         �            1259    16908    acl_object_identity_ancestors    TABLE     z   CREATE TABLE acl_object_identity_ancestors (
    object_identity_id integer NOT NULL,
    ancestor_id integer NOT NULL
);
 1   DROP TABLE public.acl_object_identity_ancestors;
       public         postgres    false    5         �            1259    16911    acl_security_identities    TABLE     �   CREATE TABLE acl_security_identities (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    username boolean NOT NULL
);
 +   DROP TABLE public.acl_security_identities;
       public         postgres    false    5         �            1259    16914    acl_security_identities_id_seq    SEQUENCE     �   CREATE SEQUENCE acl_security_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.acl_security_identities_id_seq;
       public       postgres    false    5    179         
           0    0    acl_security_identities_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE acl_security_identities_id_seq OWNED BY acl_security_identities.id;
            public       postgres    false    180         �            1259    16960    cfg_empresa    TABLE     �  CREATE TABLE cfg_empresa (
    activo boolean NOT NULL,
    direccion character varying(100) NOT NULL,
    giro character varying(100) NOT NULL,
    id integer NOT NULL,
    nit character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    nrc character varying(25) NOT NULL,
    telefono character varying(25) NOT NULL
);
    DROP TABLE public.cfg_empresa;
       public         postgres    false    5         
           0    0    TABLE cfg_empresa    COMMENT     b   COMMENT ON TABLE cfg_empresa IS 'Empresa propietaria de los datos, para encabezados de reportes';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.activo    COMMENT     [   COMMENT ON COLUMN cfg_empresa.activo IS 'estado del registro true=activo; false=inactivo';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.direccion    COMMENT     D   COMMENT ON COLUMN cfg_empresa.direccion IS 'Direccion del negocio';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.giro    COMMENT     [   COMMENT ON COLUMN cfg_empresa.giro IS 'Giro de la empresa, según naturaliza del negocio';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.nit    COMMENT     :   COMMENT ON COLUMN cfg_empresa.nit IS 'Nit de la empresa';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.nombre    COMMENT     @   COMMENT ON COLUMN cfg_empresa.nombre IS 'Nombre de la empresa';
            public       postgres    false    194         
           0    0 #   COLUMN cfg_empresa.nombre_comercial    COMMENT     T   COMMENT ON COLUMN cfg_empresa.nombre_comercial IS 'Nombre comercial de la empresa';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.nrc    COMMENT     L   COMMENT ON COLUMN cfg_empresa.nrc IS 'Numero de registro de contribuyente';
            public       postgres    false    194         
           0    0    COLUMN cfg_empresa.telefono    COMMENT     L   COMMENT ON COLUMN cfg_empresa.telefono IS 'Telefonos puede ser mas de uno';
            public       postgres    false    194         �            1259    26031    cfg_formato_documento    TABLE     ;  CREATE TABLE cfg_formato_documento (
    detalle_interlineado character varying(5) DEFAULT '1'::character varying NOT NULL,
    detalle_x_col1 character varying(5) NOT NULL,
    detalle_y character varying(5) NOT NULL,
    fila1_col1 character varying(5) NOT NULL,
    fila1_col2 character varying(5) NOT NULL,
    fila2_col1 character varying(5),
    fila2_col2 character varying(5),
    fila3_col1 character varying(5),
    fila3_col2 character varying(5),
    fila4_col1 character varying(5),
    fila4_col2 character varying(5),
    fila5_col1 character varying(5),
    fila5_col2 character varying(5),
    fila6_col1 character varying(5),
    fila6_col2 character varying(5),
    fila7_col1 character varying(5),
    fila7_col2 character varying(5),
    id integer NOT NULL,
    margen_derecho character varying(5) NOT NULL,
    margen_inferior character varying(5) NOT NULL,
    margen_izquierdo character varying(5) NOT NULL,
    margen_superior character varying(5) NOT NULL,
    nombre character varying(100) NOT NULL,
    detalle_x_col2 character varying(5),
    detalle_x_col3 character varying(5),
    detalle_x_col4 character varying(5),
    detalle_x_col5 character varying(5),
    pie_y character varying(5),
    pie_x_col1 character varying(5),
    pie_x_col2 character varying(5),
    detalle_x_col6 character varying(5),
    papel character varying(25) NOT NULL,
    detalle_numero_items integer NOT NULL,
    interlineado character varying(5) NOT NULL,
    pie_interlineado character varying(5),
    id_plantilla integer,
    id_font_name integer,
    id_font_size integer
);
 )   DROP TABLE public.cfg_formato_documento;
       public         postgres    false    5          
           0    0 #   COLUMN cfg_formato_documento.nombre    COMMENT     W   COMMENT ON COLUMN cfg_formato_documento.nombre IS 'Nombre del documento a configurar';
            public       postgres    false    248         �            1259    26029    cfg_formato_documento_id_seq    SEQUENCE     ~   CREATE SEQUENCE cfg_formato_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.cfg_formato_documento_id_seq;
       public       postgres    false    248    5         !
           0    0    cfg_formato_documento_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE cfg_formato_documento_id_seq OWNED BY cfg_formato_documento.id;
            public       postgres    false    247         �            1259    37179    cfg_plantilla    TABLE     d   CREATE TABLE cfg_plantilla (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
 !   DROP TABLE public.cfg_plantilla;
       public         postgres    false    5         �            1259    37177    cfg_plantilla_id_seq    SEQUENCE     v   CREATE SEQUENCE cfg_plantilla_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.cfg_plantilla_id_seq;
       public       postgres    false    250    5         "
           0    0    cfg_plantilla_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE cfg_plantilla_id_seq OWNED BY cfg_plantilla.id;
            public       postgres    false    249         �            1259    16916 	   ctl_banco    TABLE     t   CREATE TABLE ctl_banco (
    nombre character varying(100) NOT NULL,
    activo boolean,
    id integer NOT NULL
);
    DROP TABLE public.ctl_banco;
       public         postgres    false    5         �            1259    17643    ctl_banco_id_seq    SEQUENCE     r   CREATE SEQUENCE ctl_banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ctl_banco_id_seq;
       public       postgres    false    181    5         #
           0    0    ctl_banco_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE ctl_banco_id_seq OWNED BY ctl_banco.id;
            public       postgres    false    241         �            1259    16924    ctl_cargofuncional    TABLE     �   CREATE TABLE ctl_cargofuncional (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);
 &   DROP TABLE public.ctl_cargofuncional;
       public         postgres    false    5         �            1259    16927    ctl_cargofuncional_id_seq    SEQUENCE     {   CREATE SEQUENCE ctl_cargofuncional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ctl_cargofuncional_id_seq;
       public       postgres    false    5    182         $
           0    0    ctl_cargofuncional_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE ctl_cargofuncional_id_seq OWNED BY ctl_cargofuncional.id;
            public       postgres    false    183         �            1259    16929    ctl_categoria    TABLE     �   CREATE TABLE ctl_categoria (
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.ctl_categoria;
       public         postgres    false    5         �            1259    16932    ctl_categoria_id_seq    SEQUENCE     v   CREATE SEQUENCE ctl_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ctl_categoria_id_seq;
       public       postgres    false    184    5         %
           0    0    ctl_categoria_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ctl_categoria_id_seq OWNED BY ctl_categoria.id;
            public       postgres    false    185         �            1259    16934    ctl_cliente    TABLE     �  CREATE TABLE ctl_cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    giro character varying(100) NOT NULL,
    nit character varying(25) NOT NULL,
    nrc character varying(25) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(25) NOT NULL,
    activo boolean NOT NULL,
    id_departamento integer NOT NULL,
    id_municipio integer NOT NULL,
    date_add date NOT NULL,
    id_user_mod integer,
    id_user_add integer NOT NULL,
    date_mod date,
    email character varying(100),
    exento boolean,
    id_zona integer NOT NULL,
    codigo character varying(25)
);
    DROP TABLE public.ctl_cliente;
       public         postgres    false    5         &
           0    0    TABLE ctl_cliente    COMMENT     8   COMMENT ON TABLE ctl_cliente IS 'Catalogo de clientes';
            public       postgres    false    186         '
           0    0    COLUMN ctl_cliente.nombre    COMMENT     V   COMMENT ON COLUMN ctl_cliente.nombre IS 'Nombre de la empresa no puede ser repetido';
            public       postgres    false    186         (
           0    0 #   COLUMN ctl_cliente.nombre_comercial    COMMENT     T   COMMENT ON COLUMN ctl_cliente.nombre_comercial IS 'Nombre comercial de la empresa';
            public       postgres    false    186         )
           0    0    COLUMN ctl_cliente.giro    COMMENT     [   COMMENT ON COLUMN ctl_cliente.giro IS 'Giro de la empresa, según naturaliza del negocio';
            public       postgres    false    186         *
           0    0    COLUMN ctl_cliente.nit    COMMENT     :   COMMENT ON COLUMN ctl_cliente.nit IS 'Nit de la empresa';
            public       postgres    false    186         +
           0    0    COLUMN ctl_cliente.nrc    COMMENT     L   COMMENT ON COLUMN ctl_cliente.nrc IS 'Numero de registro de contribuyente';
            public       postgres    false    186         ,
           0    0    COLUMN ctl_cliente.direccion    COMMENT     D   COMMENT ON COLUMN ctl_cliente.direccion IS 'Direccion del negocio';
            public       postgres    false    186         -
           0    0    COLUMN ctl_cliente.telefono    COMMENT     L   COMMENT ON COLUMN ctl_cliente.telefono IS 'Telefonos puede ser mas de uno';
            public       postgres    false    186         .
           0    0    COLUMN ctl_cliente.activo    COMMENT     [   COMMENT ON COLUMN ctl_cliente.activo IS 'estado del registro true=activo; false=inactivo';
            public       postgres    false    186         /
           0    0 "   COLUMN ctl_cliente.id_departamento    COMMENT     k   COMMENT ON COLUMN ctl_cliente.id_departamento IS 'fk - id del departamento según dirección del negocio';
            public       postgres    false    186         0
           0    0    COLUMN ctl_cliente.id_municipio    COMMENT     `   COMMENT ON COLUMN ctl_cliente.id_municipio IS 'fk - id municipio segun dirección del negocio';
            public       postgres    false    186         1
           0    0    COLUMN ctl_cliente.date_add    COMMENT     L   COMMENT ON COLUMN ctl_cliente.date_add IS 'Fecha de creacion del registro';
            public       postgres    false    186         2
           0    0    COLUMN ctl_cliente.id_user_mod    COMMENT     Q   COMMENT ON COLUMN ctl_cliente.id_user_mod IS 'Usuario que modifica el registro';
            public       postgres    false    186         3
           0    0    COLUMN ctl_cliente.id_user_add    COMMENT     O   COMMENT ON COLUMN ctl_cliente.id_user_add IS 'Usuario que agrego el registro';
            public       postgres    false    186         4
           0    0    COLUMN ctl_cliente.date_mod    COMMENT     P   COMMENT ON COLUMN ctl_cliente.date_mod IS 'Fecha de modificacion del registro';
            public       postgres    false    186         �            1259    16940    ctl_cliente_id_seq    SEQUENCE     t   CREATE SEQUENCE ctl_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ctl_cliente_id_seq;
       public       postgres    false    5    186         5
           0    0    ctl_cliente_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE ctl_cliente_id_seq OWNED BY ctl_cliente.id;
            public       postgres    false    187         �            1259    16942    ctl_condicionpago    TABLE     �   CREATE TABLE ctl_condicionpago (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);
 %   DROP TABLE public.ctl_condicionpago;
       public         postgres    false    5         �            1259    16945    ctl_condicion_pago_id_seq    SEQUENCE     {   CREATE SEQUENCE ctl_condicion_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ctl_condicion_pago_id_seq;
       public       postgres    false    5    188         6
           0    0    ctl_condicion_pago_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE ctl_condicion_pago_id_seq OWNED BY ctl_condicionpago.id;
            public       postgres    false    189         �            1259    16947    ctl_departamento    TABLE     g   CREATE TABLE ctl_departamento (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
 $   DROP TABLE public.ctl_departamento;
       public         postgres    false    5         7
           0    0    TABLE ctl_departamento    COMMENT     I   COMMENT ON TABLE ctl_departamento IS 'Almacena departamentos de paises';
            public       postgres    false    190         �            1259    16950    ctl_departamento_id_seq    SEQUENCE     y   CREATE SEQUENCE ctl_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ctl_departamento_id_seq;
       public       postgres    false    190    5         8
           0    0    ctl_departamento_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE ctl_departamento_id_seq OWNED BY ctl_departamento.id;
            public       postgres    false    191         �            1259    16952    ctl_empleado    TABLE     W  CREATE TABLE ctl_empleado (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    activo boolean NOT NULL,
    apellidos character varying(2044) NOT NULL,
    dui character varying(25) NOT NULL,
    nit character varying(25) NOT NULL,
    id_cargofuncional integer NOT NULL,
    direccion character varying(100) NOT NULL
);
     DROP TABLE public.ctl_empleado;
       public         postgres    false    5         �            1259    16958    ctl_empleado_id_seq    SEQUENCE     u   CREATE SEQUENCE ctl_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ctl_empleado_id_seq;
       public       postgres    false    5    192         9
           0    0    ctl_empleado_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE ctl_empleado_id_seq OWNED BY ctl_empleado.id;
            public       postgres    false    193         �            1259    16963    ctl_empresa_id_seq    SEQUENCE     t   CREATE SEQUENCE ctl_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ctl_empresa_id_seq;
       public       postgres    false    194    5         :
           0    0    ctl_empresa_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE ctl_empresa_id_seq OWNED BY cfg_empresa.id;
            public       postgres    false    195         �            1259    17484 
   ctl_estado    TABLE     �   CREATE TABLE ctl_estado (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    abreviatura character varying(10) NOT NULL,
    descripcion character varying(100)
);
    DROP TABLE public.ctl_estado;
       public         postgres    false    5         �            1259    17482    ctl_estado_id_seq    SEQUENCE     s   CREATE SEQUENCE ctl_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ctl_estado_id_seq;
       public       postgres    false    236    5         ;
           0    0    ctl_estado_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE ctl_estado_id_seq OWNED BY ctl_estado.id;
            public       postgres    false    235         �            1259    37199    ctl_font_name    TABLE     c   CREATE TABLE ctl_font_name (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 !   DROP TABLE public.ctl_font_name;
       public         postgres    false    5         �            1259    37197    ctl_font_name_id_seq    SEQUENCE     v   CREATE SEQUENCE ctl_font_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ctl_font_name_id_seq;
       public       postgres    false    5    252         <
           0    0    ctl_font_name_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ctl_font_name_id_seq OWNED BY ctl_font_name.id;
            public       postgres    false    251         �            1259    37207    ctl_font_size    TABLE     `   CREATE TABLE ctl_font_size (
    size character varying(5) NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.ctl_font_size;
       public         postgres    false    5         �            1259    37225    ctl_font_size_id_seq    SEQUENCE     v   CREATE SEQUENCE ctl_font_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ctl_font_size_id_seq;
       public       postgres    false    253    5         =
           0    0    ctl_font_size_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ctl_font_size_id_seq OWNED BY ctl_font_size.id;
            public       postgres    false    254         �            1259    16965    ctl_formapago    TABLE     �   CREATE TABLE ctl_formapago (
    id integer NOT NULL,
    activo boolean NOT NULL,
    nombre character varying(25) NOT NULL
);
 !   DROP TABLE public.ctl_formapago;
       public         postgres    false    5         �            1259    16968    ctl_forma_pago_id_seq    SEQUENCE     w   CREATE SEQUENCE ctl_forma_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ctl_forma_pago_id_seq;
       public       postgres    false    196    5         >
           0    0    ctl_forma_pago_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE ctl_forma_pago_id_seq OWNED BY ctl_formapago.id;
            public       postgres    false    197         �            1259    25925 	   ctl_marca    TABLE     }   CREATE TABLE ctl_marca (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.ctl_marca;
       public         postgres    false    5         �            1259    25923    ctl_marca_id_seq    SEQUENCE     r   CREATE SEQUENCE ctl_marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ctl_marca_id_seq;
       public       postgres    false    246    5         ?
           0    0    ctl_marca_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE ctl_marca_id_seq OWNED BY ctl_marca.id;
            public       postgres    false    245         �            1259    16970    ctl_municipio    TABLE     �   CREATE TABLE ctl_municipio (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    id_departamento integer NOT NULL
);
 !   DROP TABLE public.ctl_municipio;
       public         postgres    false    5         @
           0    0    TABLE ctl_municipio    COMMENT     J   COMMENT ON TABLE ctl_municipio IS 'Almacena municipios por departamento';
            public       postgres    false    198         �            1259    16973    ctl_municipio_id_seq    SEQUENCE     v   CREATE SEQUENCE ctl_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ctl_municipio_id_seq;
       public       postgres    false    198    5         A
           0    0    ctl_municipio_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ctl_municipio_id_seq OWNED BY ctl_municipio.id;
            public       postgres    false    199         �            1259    16975    ctl_pais    TABLE     _   CREATE TABLE ctl_pais (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.ctl_pais;
       public         postgres    false    5         �            1259    16978    ctl_pais_id_seq    SEQUENCE     q   CREATE SEQUENCE ctl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ctl_pais_id_seq;
       public       postgres    false    200    5         B
           0    0    ctl_pais_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE ctl_pais_id_seq OWNED BY ctl_pais.id;
            public       postgres    false    201         �            1259    16980    ctl_producto    TABLE     �  CREATE TABLE ctl_producto (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    presentacion character varying(100) NOT NULL,
    id_categoria integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    id_unidad integer NOT NULL,
    existencia numeric(10,2) NOT NULL,
    existencia_maxima numeric(10,2) NOT NULL,
    existencia_minima numeric(10,2) NOT NULL,
    precio_costo numeric(10,2) NOT NULL,
    precio_venta numeric(10,2) NOT NULL,
    reservado numeric(10,2) NOT NULL,
    codigo character varying(25) NOT NULL,
    activo boolean NOT NULL,
    id_marca integer
);
     DROP TABLE public.ctl_producto;
       public         postgres    false    5         �            1259    16986    ctl_producto_id_seq    SEQUENCE     u   CREATE SEQUENCE ctl_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ctl_producto_id_seq;
       public       postgres    false    5    202         C
           0    0    ctl_producto_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE ctl_producto_id_seq OWNED BY ctl_producto.id;
            public       postgres    false    203         �            1259    16988    ctl_proveedor    TABLE       CREATE TABLE ctl_proveedor (
    activo boolean NOT NULL,
    direccion character varying(100) NOT NULL,
    email character varying(100),
    nit character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    nrc character varying(25) NOT NULL,
    telefono character varying(25) NOT NULL,
    id_pais integer NOT NULL,
    id integer NOT NULL,
    date_add date NOT NULL,
    date_mod date,
    id_user_add integer NOT NULL,
    id_user_mod integer
);
 !   DROP TABLE public.ctl_proveedor;
       public         postgres    false    5         D
           0    0    TABLE ctl_proveedor    COMMENT     =   COMMENT ON TABLE ctl_proveedor IS 'Catalogo de proveedores';
            public       postgres    false    204         E
           0    0    COLUMN ctl_proveedor.activo    COMMENT     ]   COMMENT ON COLUMN ctl_proveedor.activo IS 'estado del registro true=activo; false=inactivo';
            public       postgres    false    204         F
           0    0    COLUMN ctl_proveedor.direccion    COMMENT     F   COMMENT ON COLUMN ctl_proveedor.direccion IS 'Direccion del negocio';
            public       postgres    false    204         G
           0    0    COLUMN ctl_proveedor.nit    COMMENT     <   COMMENT ON COLUMN ctl_proveedor.nit IS 'Nit de la empresa';
            public       postgres    false    204         H
           0    0    COLUMN ctl_proveedor.nombre    COMMENT     B   COMMENT ON COLUMN ctl_proveedor.nombre IS 'Nombre de la empresa';
            public       postgres    false    204         I
           0    0 %   COLUMN ctl_proveedor.nombre_comercial    COMMENT     V   COMMENT ON COLUMN ctl_proveedor.nombre_comercial IS 'Nombre comercial de la empresa';
            public       postgres    false    204         J
           0    0    COLUMN ctl_proveedor.nrc    COMMENT     N   COMMENT ON COLUMN ctl_proveedor.nrc IS 'Numero de registro de contribuyente';
            public       postgres    false    204         K
           0    0    COLUMN ctl_proveedor.telefono    COMMENT     N   COMMENT ON COLUMN ctl_proveedor.telefono IS 'Telefonos puede ser mas de uno';
            public       postgres    false    204         L
           0    0    COLUMN ctl_proveedor.date_add    COMMENT     N   COMMENT ON COLUMN ctl_proveedor.date_add IS 'Fecha de creacion del registro';
            public       postgres    false    204         M
           0    0    COLUMN ctl_proveedor.date_mod    COMMENT     R   COMMENT ON COLUMN ctl_proveedor.date_mod IS 'Fecha de modificacion del registro';
            public       postgres    false    204         �            1259    16991    ctl_proveedor_id_seq    SEQUENCE     v   CREATE SEQUENCE ctl_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ctl_proveedor_id_seq;
       public       postgres    false    5    204         N
           0    0    ctl_proveedor_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ctl_proveedor_id_seq OWNED BY ctl_proveedor.id;
            public       postgres    false    205         �            1259    16993    ctl_tipoentrada    TABLE     �   CREATE TABLE ctl_tipoentrada (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);
 #   DROP TABLE public.ctl_tipoentrada;
       public         postgres    false    5         �            1259    16996    ctl_tipoentrada_id_seq    SEQUENCE     x   CREATE SEQUENCE ctl_tipoentrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ctl_tipoentrada_id_seq;
       public       postgres    false    5    206         O
           0    0    ctl_tipoentrada_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE ctl_tipoentrada_id_seq OWNED BY ctl_tipoentrada.id;
            public       postgres    false    207         �            1259    16998    ctl_tipofactura    TABLE     �   CREATE TABLE ctl_tipofactura (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);
 #   DROP TABLE public.ctl_tipofactura;
       public         postgres    false    5         �            1259    17001    ctl_tipofactura_id_seq    SEQUENCE     x   CREATE SEQUENCE ctl_tipofactura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ctl_tipofactura_id_seq;
       public       postgres    false    5    208         P
           0    0    ctl_tipofactura_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE ctl_tipofactura_id_seq OWNED BY ctl_tipofactura.id;
            public       postgres    false    209         �            1259    17003 
   ctl_unidad    TABLE     }   CREATE TABLE ctl_unidad (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.ctl_unidad;
       public         postgres    false    5         �            1259    17006    ctl_unidad_id_seq    SEQUENCE     s   CREATE SEQUENCE ctl_unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ctl_unidad_id_seq;
       public       postgres    false    5    210         Q
           0    0    ctl_unidad_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE ctl_unidad_id_seq OWNED BY ctl_unidad.id;
            public       postgres    false    211         �            1259    17577    ctl_zona    TABLE     |   CREATE TABLE ctl_zona (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.ctl_zona;
       public         postgres    false    5         �            1259    17575    ctl_zona_id_seq    SEQUENCE     q   CREATE SEQUENCE ctl_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ctl_zona_id_seq;
       public       postgres    false    240    5         R
           0    0    ctl_zona_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE ctl_zona_id_seq OWNED BY ctl_zona.id;
            public       postgres    false    239         �            1259    17008 	   cxc_cobro    TABLE     �  CREATE TABLE cxc_cobro (
    fecha date NOT NULL,
    numero_recibo integer NOT NULL,
    numero_cheque character varying(25),
    id_factura integer NOT NULL,
    id_forma_pago integer NOT NULL,
    id_banco integer,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    activo boolean NOT NULL,
    id_empleado integer NOT NULL,
    id integer NOT NULL,
    monto numeric(10,2) NOT NULL
);
    DROP TABLE public.cxc_cobro;
       public         postgres    false    5         �            1259    17014    cxc_cobro_id_seq    SEQUENCE     r   CREATE SEQUENCE cxc_cobro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cxc_cobro_id_seq;
       public       postgres    false    5    212         S
           0    0    cxc_cobro_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE cxc_cobro_id_seq OWNED BY cxc_cobro.id;
            public       postgres    false    213         �            1259    17016    fac_factura    TABLE     &  CREATE TABLE fac_factura (
    id integer NOT NULL,
    numero integer NOT NULL,
    id_tipofactura integer NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_condicionpago integer NOT NULL,
    activo boolean NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    iva numeric(10,2),
    iva_retenido numeric(10,2),
    subtotal numeric(10,2) NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    ventas_gravadas numeric(10,2),
    id_empleado integer NOT NULL,
    estado character varying(10),
    sumas numeric(10,2) NOT NULL,
    cobro_total numeric(10,2),
    fecha_pago date,
    id_notaremision integer,
    ventas_nosujetas numeric(10,2),
    ventas_exentas numeric(10,2),
    id_formato_documento integer
);
    DROP TABLE public.fac_factura;
       public         postgres    false    5         T
           0    0    COLUMN fac_factura.numero    COMMENT     Q   COMMENT ON COLUMN fac_factura.numero IS 'Campo para el numero de factura o CCF';
            public       postgres    false    214         U
           0    0 !   COLUMN fac_factura.id_tipofactura    COMMENT     i   COMMENT ON COLUMN fac_factura.id_tipofactura IS 'fk - para el tipo de factura (consumidor final o CCF)';
            public       postgres    false    214         V
           0    0    COLUMN fac_factura.fecha    COMMENT     S   COMMENT ON COLUMN fac_factura.fecha IS 'campo para almacenar fecha de la factura';
            public       postgres    false    214         W
           0    0    COLUMN fac_factura.id_cliente    COMMENT     ^   COMMENT ON COLUMN fac_factura.id_cliente IS 'fk - cliente a quien se le facturo el producto';
            public       postgres    false    214         X
           0    0 #   COLUMN fac_factura.id_condicionpago    COMMENT     n   COMMENT ON COLUMN fac_factura.id_condicionpago IS 'fk - para almacenar condicion de pago, credito o contado';
            public       postgres    false    214         Y
           0    0    COLUMN fac_factura.activo    COMMENT     \   COMMENT ON COLUMN fac_factura.activo IS 'campo para determinar si el registro esta activo';
            public       postgres    false    214         Z
           0    0    COLUMN fac_factura.id_user_add    COMMENT     `   COMMENT ON COLUMN fac_factura.id_user_add IS 'fk - para saber el usuario que creo el registro';
            public       postgres    false    214         [
           0    0    COLUMN fac_factura.id_user_mod    COMMENT     e   COMMENT ON COLUMN fac_factura.id_user_mod IS 'fk - para saber el usuario que modificó el registro';
            public       postgres    false    214         \
           0    0    COLUMN fac_factura.iva    COMMENT     �   COMMENT ON COLUMN fac_factura.iva IS 'almacena el calculo del IVA actual según configuarción (0.13) en base a la suma de las ventas gravadas';
            public       postgres    false    214         ]
           0    0    COLUMN fac_factura.sumas    COMMENT     �   COMMENT ON COLUMN fac_factura.sumas IS 'campo para almacenar la sumatoria de las ventas gravadas de todos los ITEMS de la factura';
            public       postgres    false    214         ^
           0    0    COLUMN fac_factura.cobro_total    COMMENT     �   COMMENT ON COLUMN fac_factura.cobro_total IS 'Almacena el cobro total para las facturas a credito y que son canceladas a traves cuentas por cobrar';
            public       postgres    false    214         _
           0    0    COLUMN fac_factura.fecha_pago    COMMENT     �   COMMENT ON COLUMN fac_factura.fecha_pago IS 'Fecha en que la factura es pagada en caso de contado es el mismo dia de la factura y de credito en base a lo acordado con cliente';
            public       postgres    false    214         �            1259    17027    fac_factura_id_seq    SEQUENCE     t   CREATE SEQUENCE fac_factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.fac_factura_id_seq;
       public       postgres    false    214    5         `
           0    0    fac_factura_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE fac_factura_id_seq OWNED BY fac_factura.id;
            public       postgres    false    216         �            1259    17019    fac_facturadetalle    TABLE     c  CREATE TABLE fac_facturadetalle (
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    descripcion character varying(2044),
    cantidad numeric(10,2) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    ventas_exentas numeric(10,2),
    ventas_gravadas numeric(10,2),
    ventas_nosujetas numeric(10,2),
    id integer NOT NULL
);
 &   DROP TABLE public.fac_facturadetalle;
       public         postgres    false    5         �            1259    25894    fac_facturadetalle_id_seq    SEQUENCE     {   CREATE SEQUENCE fac_facturadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.fac_facturadetalle_id_seq;
       public       postgres    false    5    215         a
           0    0    fac_facturadetalle_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE fac_facturadetalle_id_seq OWNED BY fac_facturadetalle.id;
            public       postgres    false    244         �            1259    17474    fac_notaremision    TABLE     �  CREATE TABLE fac_notaremision (
    activo boolean NOT NULL,
    date_add date NOT NULL,
    date_mod date,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_condicionpago integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    numero integer NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    id integer NOT NULL,
    estado character varying(10) NOT NULL
);
 $   DROP TABLE public.fac_notaremision;
       public         postgres    false    5         b
           0    0    COLUMN fac_notaremision.activo    COMMENT     U   COMMENT ON COLUMN fac_notaremision.activo IS 'determina si el registro esta activo';
            public       postgres    false    234         c
           0    0     COLUMN fac_notaremision.date_add    COMMENT     P   COMMENT ON COLUMN fac_notaremision.date_add IS 'fecha que se creo el registro';
            public       postgres    false    234         d
           0    0     COLUMN fac_notaremision.date_mod    COMMENT     [   COMMENT ON COLUMN fac_notaremision.date_mod IS 'ultima fecha que se modifico el registro';
            public       postgres    false    234         e
           0    0    COLUMN fac_notaremision.fecha    COMMENT     P   COMMENT ON COLUMN fac_notaremision.fecha IS 'fecha del documento de remisión';
            public       postgres    false    234         f
           0    0 "   COLUMN fac_notaremision.id_cliente    COMMENT     R   COMMENT ON COLUMN fac_notaremision.id_cliente IS 'fk - del catalogo ctl_cliente';
            public       postgres    false    234         g
           0    0 (   COLUMN fac_notaremision.id_condicionpago    COMMENT     `   COMMENT ON COLUMN fac_notaremision.id_condicionpago IS 'fk - del catalogo ctl_condiciondepago';
            public       postgres    false    234         h
           0    0 #   COLUMN fac_notaremision.id_user_add    COMMENT     U   COMMENT ON COLUMN fac_notaremision.id_user_add IS 'usuario que agregó el registro';
            public       postgres    false    234         i
           0    0 #   COLUMN fac_notaremision.id_user_mod    COMMENT     d   COMMENT ON COLUMN fac_notaremision.id_user_mod IS 'ultimo id de usuario que modificó el registro';
            public       postgres    false    234         j
           0    0    COLUMN fac_notaremision.numero    COMMENT     P   COMMENT ON COLUMN fac_notaremision.numero IS 'numero de documento de remision';
            public       postgres    false    234         k
           0    0 #   COLUMN fac_notaremision.venta_total    COMMENT     y   COMMENT ON COLUMN fac_notaremision.venta_total IS 'campo para almacenar la sumatoria del total de los item del detalle';
            public       postgres    false    234         l
           0    0    COLUMN fac_notaremision.id    COMMENT     ;   COMMENT ON COLUMN fac_notaremision.id IS 'Llave primaria';
            public       postgres    false    234         �            1259    17472    fac_notaremision_id_seq    SEQUENCE     y   CREATE SEQUENCE fac_notaremision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.fac_notaremision_id_seq;
       public       postgres    false    234    5         m
           0    0    fac_notaremision_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE fac_notaremision_id_seq OWNED BY fac_notaremision.id;
            public       postgres    false    233         �            1259    17494    fac_notaremisiondetalle    TABLE     �   CREATE TABLE fac_notaremisiondetalle (
    cantidad numeric(10,2) NOT NULL,
    id_producto integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    total numeric(10,2),
    id integer NOT NULL,
    id_notaremision integer NOT NULL
);
 +   DROP TABLE public.fac_notaremisiondetalle;
       public         postgres    false    5         �            1259    17492    fac_notaremisiondetalle_id_seq    SEQUENCE     �   CREATE SEQUENCE fac_notaremisiondetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.fac_notaremisiondetalle_id_seq;
       public       postgres    false    238    5         n
           0    0    fac_notaremisiondetalle_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE fac_notaremisiondetalle_id_seq OWNED BY fac_notaremisiondetalle.id;
            public       postgres    false    237         �            1259    17029    fos_user_group    TABLE     |   CREATE TABLE fos_user_group (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    roles text NOT NULL
);
 "   DROP TABLE public.fos_user_group;
       public         postgres    false    5         o
           0    0    COLUMN fos_user_group.roles    COMMENT     =   COMMENT ON COLUMN fos_user_group.roles IS '(DC2Type:array)';
            public       postgres    false    217         �            1259    17035    fos_user_group_id_seq    SEQUENCE     w   CREATE SEQUENCE fos_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.fos_user_group_id_seq;
       public       postgres    false    5         �            1259    17037    fos_user_user    TABLE     !	  CREATE TABLE fos_user_user (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    username_canonical character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_canonical character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    salt character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    locked boolean NOT NULL,
    expired boolean NOT NULL,
    expires_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    confirmation_token character varying(255) DEFAULT NULL::character varying,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    credentials_expired boolean NOT NULL,
    credentials_expire_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    date_of_birth timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    firstname character varying(64) DEFAULT NULL::character varying,
    lastname character varying(64) DEFAULT NULL::character varying,
    website character varying(64) DEFAULT NULL::character varying,
    biography character varying(255) DEFAULT NULL::character varying,
    gender character varying(1) DEFAULT NULL::character varying,
    locale character varying(8) DEFAULT NULL::character varying,
    timezone character varying(64) DEFAULT NULL::character varying,
    phone character varying(64) DEFAULT NULL::character varying,
    facebook_uid character varying(255) DEFAULT NULL::character varying,
    facebook_name character varying(255) DEFAULT NULL::character varying,
    facebook_data text,
    twitter_uid character varying(255) DEFAULT NULL::character varying,
    twitter_name character varying(255) DEFAULT NULL::character varying,
    twitter_data text,
    gplus_uid character varying(255) DEFAULT NULL::character varying,
    gplus_name character varying(255) DEFAULT NULL::character varying,
    gplus_data text,
    token character varying(255) DEFAULT NULL::character varying,
    two_step_code character varying(255) DEFAULT NULL::character varying
);
 !   DROP TABLE public.fos_user_user;
       public         postgres    false    5         p
           0    0    COLUMN fos_user_user.roles    COMMENT     <   COMMENT ON COLUMN fos_user_user.roles IS '(DC2Type:array)';
            public       postgres    false    219         q
           0    0 "   COLUMN fos_user_user.facebook_data    COMMENT     C   COMMENT ON COLUMN fos_user_user.facebook_data IS '(DC2Type:json)';
            public       postgres    false    219         r
           0    0 !   COLUMN fos_user_user.twitter_data    COMMENT     B   COMMENT ON COLUMN fos_user_user.twitter_data IS '(DC2Type:json)';
            public       postgres    false    219         s
           0    0    COLUMN fos_user_user.gplus_data    COMMENT     @   COMMENT ON COLUMN fos_user_user.gplus_data IS '(DC2Type:json)';
            public       postgres    false    219         �            1259    17065    fos_user_user_group    TABLE     b   CREATE TABLE fos_user_user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 '   DROP TABLE public.fos_user_user_group;
       public         postgres    false    5         �            1259    17068    fos_user_user_id_seq    SEQUENCE     v   CREATE SEQUENCE fos_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.fos_user_user_id_seq;
       public       postgres    false    5         �            1259    17070    inv_entrada    TABLE     R  CREATE TABLE inv_entrada (
    id integer NOT NULL,
    fecha date NOT NULL,
    id_tipoentrada integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    numero integer NOT NULL,
    activo boolean NOT NULL,
    id_proveedor integer NOT NULL,
    id_estado integer
);
    DROP TABLE public.inv_entrada;
       public         postgres    false    5         �            1259    17073    inv_entrada_id_seq    SEQUENCE     t   CREATE SEQUENCE inv_entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.inv_entrada_id_seq;
       public       postgres    false    5    222         t
           0    0    inv_entrada_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE inv_entrada_id_seq OWNED BY inv_entrada.id;
            public       postgres    false    223         �            1259    17075    inv_entradadetalle    TABLE     �  CREATE TABLE inv_entradadetalle (
    comentario character varying(100),
    lote character varying(25) NOT NULL,
    id_entrada integer NOT NULL,
    serie character varying(50),
    modelo character varying(50),
    id integer NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    fecha_vencimiento date,
    id_producto integer NOT NULL
);
 &   DROP TABLE public.inv_entradadetalle;
       public         postgres    false    5         �            1259    17081    inv_entradadetalle_id_seq    SEQUENCE     {   CREATE SEQUENCE inv_entradadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.inv_entradadetalle_id_seq;
       public       postgres    false    5    224         u
           0    0    inv_entradadetalle_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE inv_entradadetalle_id_seq OWNED BY inv_entradadetalle.id;
            public       postgres    false    225         �            1259    17413    inv_notaenvio    TABLE     �  CREATE TABLE inv_notaenvio (
    activo boolean NOT NULL,
    date_add date NOT NULL,
    date_mod date NOT NULL,
    estado character varying(2044) NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer NOT NULL,
    numero integer NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    observacion character varying(2044) NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.inv_notaenvio;
       public         postgres    false    5         �            1259    17411    inv_notaenvio_id_seq    SEQUENCE     v   CREATE SEQUENCE inv_notaenvio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.inv_notaenvio_id_seq;
       public       postgres    false    230    5         v
           0    0    inv_notaenvio_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE inv_notaenvio_id_seq OWNED BY inv_notaenvio.id;
            public       postgres    false    229         �            1259    17424    inv_notaenviodetalle    TABLE     �   CREATE TABLE inv_notaenviodetalle (
    cantidad numeric(10,2) NOT NULL,
    id_producto integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    id integer NOT NULL,
    id_notaenvio integer NOT NULL
);
 (   DROP TABLE public.inv_notaenviodetalle;
       public         postgres    false    5         �            1259    17422    inv_notaenviodetalle_id_seq    SEQUENCE     }   CREATE SEQUENCE inv_notaenviodetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.inv_notaenviodetalle_id_seq;
       public       postgres    false    5    232         w
           0    0    inv_notaenviodetalle_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE inv_notaenviodetalle_id_seq OWNED BY inv_notaenviodetalle.id;
            public       postgres    false    231         �            1259    17083    mnt_empleado_MM_cliente    TABLE     �   CREATE TABLE "mnt_empleado_MM_cliente" (
    id_empleado integer NOT NULL,
    id_cliente integer NOT NULL,
    id integer NOT NULL
);
 -   DROP TABLE public."mnt_empleado_MM_cliente";
       public         postgres    false    5         �            1259    17086    mnt_empleado_MM_cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE "mnt_empleado_MM_cliente_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."mnt_empleado_MM_cliente_id_seq";
       public       postgres    false    5    226         x
           0    0    mnt_empleado_MM_cliente_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "mnt_empleado_MM_cliente_id_seq" OWNED BY "mnt_empleado_MM_cliente".id;
            public       postgres    false    227         �            1259    25863    mnt_empleado_zona    TABLE     |   CREATE TABLE mnt_empleado_zona (
    id_zona integer NOT NULL,
    id_empleado integer NOT NULL,
    id integer NOT NULL
);
 %   DROP TABLE public.mnt_empleado_zona;
       public         postgres    false    5         �            1259    25861    mnt_empleado_zona_id_seq    SEQUENCE     z   CREATE SEQUENCE mnt_empleado_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.mnt_empleado_zona_id_seq;
       public       postgres    false    243    5         y
           0    0    mnt_empleado_zona_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE mnt_empleado_zona_id_seq OWNED BY mnt_empleado_zona.id;
            public       postgres    false    242         �            1259    17088    vs_database_diagrams    TABLE       CREATE TABLE vs_database_diagrams (
    name character varying(80) NOT NULL,
    diadata text,
    comment character varying(1022),
    preview text,
    lockinfo character varying(80),
    locktime timestamp with time zone,
    version character varying(80)
);
 (   DROP TABLE public.vs_database_diagrams;
       public         postgres    false    5         ]           2604    17094    id    DEFAULT     b   ALTER TABLE ONLY acl_classes ALTER COLUMN id SET DEFAULT nextval('acl_classes_id_seq'::regclass);
 =   ALTER TABLE public.acl_classes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172         _           2604    17095    id    DEFAULT     b   ALTER TABLE ONLY acl_entries ALTER COLUMN id SET DEFAULT nextval('acl_entries_id_seq'::regclass);
 =   ALTER TABLE public.acl_entries ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    174         `           2604    17096    id    DEFAULT     v   ALTER TABLE ONLY acl_object_identities ALTER COLUMN id SET DEFAULT nextval('acl_object_identities_id_seq'::regclass);
 G   ALTER TABLE public.acl_object_identities ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    177    176         a           2604    17097    id    DEFAULT     z   ALTER TABLE ONLY acl_security_identities ALTER COLUMN id SET DEFAULT nextval('acl_security_identities_id_seq'::regclass);
 I   ALTER TABLE public.acl_security_identities ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    180    179         i           2604    17105    id    DEFAULT     b   ALTER TABLE ONLY cfg_empresa ALTER COLUMN id SET DEFAULT nextval('ctl_empresa_id_seq'::regclass);
 =   ALTER TABLE public.cfg_empresa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194         �           2604    26036    id    DEFAULT     v   ALTER TABLE ONLY cfg_formato_documento ALTER COLUMN id SET DEFAULT nextval('cfg_formato_documento_id_seq'::regclass);
 G   ALTER TABLE public.cfg_formato_documento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    248    248         �           2604    37182    id    DEFAULT     f   ALTER TABLE ONLY cfg_plantilla ALTER COLUMN id SET DEFAULT nextval('cfg_plantilla_id_seq'::regclass);
 ?   ALTER TABLE public.cfg_plantilla ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    250    250         b           2604    17645    id    DEFAULT     ^   ALTER TABLE ONLY ctl_banco ALTER COLUMN id SET DEFAULT nextval('ctl_banco_id_seq'::regclass);
 ;   ALTER TABLE public.ctl_banco ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    241    181         c           2604    17099    id    DEFAULT     p   ALTER TABLE ONLY ctl_cargofuncional ALTER COLUMN id SET DEFAULT nextval('ctl_cargofuncional_id_seq'::regclass);
 D   ALTER TABLE public.ctl_cargofuncional ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    182         d           2604    17100    id    DEFAULT     f   ALTER TABLE ONLY ctl_categoria ALTER COLUMN id SET DEFAULT nextval('ctl_categoria_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_categoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184         e           2604    17101    id    DEFAULT     b   ALTER TABLE ONLY ctl_cliente ALTER COLUMN id SET DEFAULT nextval('ctl_cliente_id_seq'::regclass);
 =   ALTER TABLE public.ctl_cliente ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186         f           2604    17102    id    DEFAULT     o   ALTER TABLE ONLY ctl_condicionpago ALTER COLUMN id SET DEFAULT nextval('ctl_condicion_pago_id_seq'::regclass);
 C   ALTER TABLE public.ctl_condicionpago ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188         g           2604    17103    id    DEFAULT     l   ALTER TABLE ONLY ctl_departamento ALTER COLUMN id SET DEFAULT nextval('ctl_departamento_id_seq'::regclass);
 B   ALTER TABLE public.ctl_departamento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190         h           2604    17104    id    DEFAULT     d   ALTER TABLE ONLY ctl_empleado ALTER COLUMN id SET DEFAULT nextval('ctl_empleado_id_seq'::regclass);
 >   ALTER TABLE public.ctl_empleado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192         �           2604    17487    id    DEFAULT     `   ALTER TABLE ONLY ctl_estado ALTER COLUMN id SET DEFAULT nextval('ctl_estado_id_seq'::regclass);
 <   ALTER TABLE public.ctl_estado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    236    236         �           2604    37202    id    DEFAULT     f   ALTER TABLE ONLY ctl_font_name ALTER COLUMN id SET DEFAULT nextval('ctl_font_name_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_font_name ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    252    252         �           2604    37227    id    DEFAULT     f   ALTER TABLE ONLY ctl_font_size ALTER COLUMN id SET DEFAULT nextval('ctl_font_size_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_font_size ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    253         j           2604    17106    id    DEFAULT     g   ALTER TABLE ONLY ctl_formapago ALTER COLUMN id SET DEFAULT nextval('ctl_forma_pago_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_formapago ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196         �           2604    25928    id    DEFAULT     ^   ALTER TABLE ONLY ctl_marca ALTER COLUMN id SET DEFAULT nextval('ctl_marca_id_seq'::regclass);
 ;   ALTER TABLE public.ctl_marca ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    245    246         k           2604    17107    id    DEFAULT     f   ALTER TABLE ONLY ctl_municipio ALTER COLUMN id SET DEFAULT nextval('ctl_municipio_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_municipio ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198         l           2604    17108    id    DEFAULT     \   ALTER TABLE ONLY ctl_pais ALTER COLUMN id SET DEFAULT nextval('ctl_pais_id_seq'::regclass);
 :   ALTER TABLE public.ctl_pais ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200         m           2604    17109    id    DEFAULT     d   ALTER TABLE ONLY ctl_producto ALTER COLUMN id SET DEFAULT nextval('ctl_producto_id_seq'::regclass);
 >   ALTER TABLE public.ctl_producto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202         n           2604    17110    id    DEFAULT     f   ALTER TABLE ONLY ctl_proveedor ALTER COLUMN id SET DEFAULT nextval('ctl_proveedor_id_seq'::regclass);
 ?   ALTER TABLE public.ctl_proveedor ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204         o           2604    17111    id    DEFAULT     j   ALTER TABLE ONLY ctl_tipoentrada ALTER COLUMN id SET DEFAULT nextval('ctl_tipoentrada_id_seq'::regclass);
 A   ALTER TABLE public.ctl_tipoentrada ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206         p           2604    17112    id    DEFAULT     j   ALTER TABLE ONLY ctl_tipofactura ALTER COLUMN id SET DEFAULT nextval('ctl_tipofactura_id_seq'::regclass);
 A   ALTER TABLE public.ctl_tipofactura ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208         q           2604    17113    id    DEFAULT     `   ALTER TABLE ONLY ctl_unidad ALTER COLUMN id SET DEFAULT nextval('ctl_unidad_id_seq'::regclass);
 <   ALTER TABLE public.ctl_unidad ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210         �           2604    17580    id    DEFAULT     \   ALTER TABLE ONLY ctl_zona ALTER COLUMN id SET DEFAULT nextval('ctl_zona_id_seq'::regclass);
 :   ALTER TABLE public.ctl_zona ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    239    240         r           2604    17114    id    DEFAULT     ^   ALTER TABLE ONLY cxc_cobro ALTER COLUMN id SET DEFAULT nextval('cxc_cobro_id_seq'::regclass);
 ;   ALTER TABLE public.cxc_cobro ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212         s           2604    17115    id    DEFAULT     b   ALTER TABLE ONLY fac_factura ALTER COLUMN id SET DEFAULT nextval('fac_factura_id_seq'::regclass);
 =   ALTER TABLE public.fac_factura ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    214         t           2604    25896    id    DEFAULT     p   ALTER TABLE ONLY fac_facturadetalle ALTER COLUMN id SET DEFAULT nextval('fac_facturadetalle_id_seq'::regclass);
 D   ALTER TABLE public.fac_facturadetalle ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    215         �           2604    17477    id    DEFAULT     l   ALTER TABLE ONLY fac_notaremision ALTER COLUMN id SET DEFAULT nextval('fac_notaremision_id_seq'::regclass);
 B   ALTER TABLE public.fac_notaremision ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    234    234         �           2604    17497    id    DEFAULT     z   ALTER TABLE ONLY fac_notaremisiondetalle ALTER COLUMN id SET DEFAULT nextval('fac_notaremisiondetalle_id_seq'::regclass);
 I   ALTER TABLE public.fac_notaremisiondetalle ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    237    238         �           2604    17117    id    DEFAULT     b   ALTER TABLE ONLY inv_entrada ALTER COLUMN id SET DEFAULT nextval('inv_entrada_id_seq'::regclass);
 =   ALTER TABLE public.inv_entrada ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222         �           2604    17118    id    DEFAULT     p   ALTER TABLE ONLY inv_entradadetalle ALTER COLUMN id SET DEFAULT nextval('inv_entradadetalle_id_seq'::regclass);
 D   ALTER TABLE public.inv_entradadetalle ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224         �           2604    17416    id    DEFAULT     f   ALTER TABLE ONLY inv_notaenvio ALTER COLUMN id SET DEFAULT nextval('inv_notaenvio_id_seq'::regclass);
 ?   ALTER TABLE public.inv_notaenvio ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    230    229    230         �           2604    17427    id    DEFAULT     t   ALTER TABLE ONLY inv_notaenviodetalle ALTER COLUMN id SET DEFAULT nextval('inv_notaenviodetalle_id_seq'::regclass);
 F   ALTER TABLE public.inv_notaenviodetalle ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    232    232         �           2604    17119    id    DEFAULT     ~   ALTER TABLE ONLY "mnt_empleado_MM_cliente" ALTER COLUMN id SET DEFAULT nextval('"mnt_empleado_MM_cliente_id_seq"'::regclass);
 K   ALTER TABLE public."mnt_empleado_MM_cliente" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226         �           2604    25866    id    DEFAULT     n   ALTER TABLE ONLY mnt_empleado_zona ALTER COLUMN id SET DEFAULT nextval('mnt_empleado_zona_id_seq'::regclass);
 C   ALTER TABLE public.mnt_empleado_zona ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    243    242    243         �	          0    16892    acl_classes 
   TABLE DATA                     public       postgres    false    172       2488.dat z
           0    0    acl_classes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('acl_classes_id_seq', 1, false);
            public       postgres    false    173         �	          0    16897    acl_entries 
   TABLE DATA                     public       postgres    false    174       2490.dat {
           0    0    acl_entries_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('acl_entries_id_seq', 1, false);
            public       postgres    false    175         �	          0    16903    acl_object_identities 
   TABLE DATA                     public       postgres    false    176       2492.dat |
           0    0    acl_object_identities_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('acl_object_identities_id_seq', 1, false);
            public       postgres    false    177         �	          0    16908    acl_object_identity_ancestors 
   TABLE DATA                     public       postgres    false    178       2494.dat �	          0    16911    acl_security_identities 
   TABLE DATA                     public       postgres    false    179       2495.dat }
           0    0    acl_security_identities_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('acl_security_identities_id_seq', 1, false);
            public       postgres    false    180         �	          0    16960    cfg_empresa 
   TABLE DATA                     public       postgres    false    194       2510.dat 
          0    26031    cfg_formato_documento 
   TABLE DATA                     public       postgres    false    248       2564.dat ~
           0    0    cfg_formato_documento_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('cfg_formato_documento_id_seq', 4, true);
            public       postgres    false    247         
          0    37179    cfg_plantilla 
   TABLE DATA                     public       postgres    false    250       2566.dat 
           0    0    cfg_plantilla_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('cfg_plantilla_id_seq', 4, true);
            public       postgres    false    249         �	          0    16916 	   ctl_banco 
   TABLE DATA                     public       postgres    false    181       2497.dat �
           0    0    ctl_banco_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ctl_banco_id_seq', 1, true);
            public       postgres    false    241         �	          0    16924    ctl_cargofuncional 
   TABLE DATA                     public       postgres    false    182       2498.dat �
           0    0    ctl_cargofuncional_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('ctl_cargofuncional_id_seq', 1, false);
            public       postgres    false    183         �	          0    16929    ctl_categoria 
   TABLE DATA                     public       postgres    false    184       2500.dat �
           0    0    ctl_categoria_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ctl_categoria_id_seq', 2, true);
            public       postgres    false    185         �	          0    16934    ctl_cliente 
   TABLE DATA                     public       postgres    false    186       2502.dat �
           0    0    ctl_cliente_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('ctl_cliente_id_seq', 4, true);
            public       postgres    false    187         �
           0    0    ctl_condicion_pago_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('ctl_condicion_pago_id_seq', 3, true);
            public       postgres    false    189         �	          0    16942    ctl_condicionpago 
   TABLE DATA                     public       postgres    false    188       2504.dat �	          0    16947    ctl_departamento 
   TABLE DATA                     public       postgres    false    190       2506.dat �
           0    0    ctl_departamento_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('ctl_departamento_id_seq', 1, false);
            public       postgres    false    191         �	          0    16952    ctl_empleado 
   TABLE DATA                     public       postgres    false    192       2508.dat �
           0    0    ctl_empleado_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ctl_empleado_id_seq', 5, true);
            public       postgres    false    193         �
           0    0    ctl_empresa_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ctl_empresa_id_seq', 1, false);
            public       postgres    false    195         �	          0    17484 
   ctl_estado 
   TABLE DATA                     public       postgres    false    236       2552.dat �
           0    0    ctl_estado_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('ctl_estado_id_seq', 4, true);
            public       postgres    false    235         
          0    37199    ctl_font_name 
   TABLE DATA                     public       postgres    false    252       2568.dat �
           0    0    ctl_font_name_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ctl_font_name_id_seq', 1, true);
            public       postgres    false    251         	
          0    37207    ctl_font_size 
   TABLE DATA                     public       postgres    false    253       2569.dat �
           0    0    ctl_font_size_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ctl_font_size_id_seq', 1, true);
            public       postgres    false    254         �
           0    0    ctl_forma_pago_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('ctl_forma_pago_id_seq', 2, true);
            public       postgres    false    197         �	          0    16965    ctl_formapago 
   TABLE DATA                     public       postgres    false    196       2512.dat 
          0    25925 	   ctl_marca 
   TABLE DATA                     public       postgres    false    246       2562.dat �
           0    0    ctl_marca_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ctl_marca_id_seq', 2, true);
            public       postgres    false    245         �	          0    16970    ctl_municipio 
   TABLE DATA                     public       postgres    false    198       2514.dat �
           0    0    ctl_municipio_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ctl_municipio_id_seq', 1, true);
            public       postgres    false    199         �	          0    16975    ctl_pais 
   TABLE DATA                     public       postgres    false    200       2516.dat �
           0    0    ctl_pais_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ctl_pais_id_seq', 1, false);
            public       postgres    false    201         �	          0    16980    ctl_producto 
   TABLE DATA                     public       postgres    false    202       2518.dat �
           0    0    ctl_producto_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('ctl_producto_id_seq', 3, true);
            public       postgres    false    203         �	          0    16988    ctl_proveedor 
   TABLE DATA                     public       postgres    false    204       2520.dat �
           0    0    ctl_proveedor_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('ctl_proveedor_id_seq', 3, true);
            public       postgres    false    205         �	          0    16993    ctl_tipoentrada 
   TABLE DATA                     public       postgres    false    206       2522.dat �
           0    0    ctl_tipoentrada_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ctl_tipoentrada_id_seq', 1, true);
            public       postgres    false    207         �	          0    16998    ctl_tipofactura 
   TABLE DATA                     public       postgres    false    208       2524.dat �
           0    0    ctl_tipofactura_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ctl_tipofactura_id_seq', 2, true);
            public       postgres    false    209         �	          0    17003 
   ctl_unidad 
   TABLE DATA                     public       postgres    false    210       2526.dat �
           0    0    ctl_unidad_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('ctl_unidad_id_seq', 3, true);
            public       postgres    false    211         �	          0    17577    ctl_zona 
   TABLE DATA                     public       postgres    false    240       2556.dat �
           0    0    ctl_zona_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('ctl_zona_id_seq', 1, false);
            public       postgres    false    239         �	          0    17008 	   cxc_cobro 
   TABLE DATA                     public       postgres    false    212       2528.dat �
           0    0    cxc_cobro_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('cxc_cobro_id_seq', 8, true);
            public       postgres    false    213         �	          0    17016    fac_factura 
   TABLE DATA                     public       postgres    false    214       2530.dat �
           0    0    fac_factura_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('fac_factura_id_seq', 17, true);
            public       postgres    false    216         �	          0    17019    fac_facturadetalle 
   TABLE DATA                     public       postgres    false    215       2531.dat �
           0    0    fac_facturadetalle_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('fac_facturadetalle_id_seq', 14, true);
            public       postgres    false    244         �	          0    17474    fac_notaremision 
   TABLE DATA                     public       postgres    false    234       2550.dat �
           0    0    fac_notaremision_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('fac_notaremision_id_seq', 7, true);
            public       postgres    false    233         �	          0    17494    fac_notaremisiondetalle 
   TABLE DATA                     public       postgres    false    238       2554.dat �
           0    0    fac_notaremisiondetalle_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('fac_notaremisiondetalle_id_seq', 7, true);
            public       postgres    false    237         �	          0    17029    fos_user_group 
   TABLE DATA                     public       postgres    false    217       2533.dat �
           0    0    fos_user_group_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fos_user_group_id_seq', 1, false);
            public       postgres    false    218         �	          0    17037    fos_user_user 
   TABLE DATA                     public       postgres    false    219       2535.dat �	          0    17065    fos_user_user_group 
   TABLE DATA                     public       postgres    false    220       2536.dat �
           0    0    fos_user_user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('fos_user_user_id_seq', 2, true);
            public       postgres    false    221         �	          0    17070    inv_entrada 
   TABLE DATA                     public       postgres    false    222       2538.dat �
           0    0    inv_entrada_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('inv_entrada_id_seq', 6, true);
            public       postgres    false    223         �	          0    17075    inv_entradadetalle 
   TABLE DATA                     public       postgres    false    224       2540.dat �
           0    0    inv_entradadetalle_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('inv_entradadetalle_id_seq', 10, true);
            public       postgres    false    225         �	          0    17413    inv_notaenvio 
   TABLE DATA                     public       postgres    false    230       2546.dat �
           0    0    inv_notaenvio_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('inv_notaenvio_id_seq', 1, false);
            public       postgres    false    229         �	          0    17424    inv_notaenviodetalle 
   TABLE DATA                     public       postgres    false    232       2548.dat �
           0    0    inv_notaenviodetalle_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('inv_notaenviodetalle_id_seq', 1, false);
            public       postgres    false    231         �	          0    17083    mnt_empleado_MM_cliente 
   TABLE DATA                     public       postgres    false    226       2542.dat �
           0    0    mnt_empleado_MM_cliente_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"mnt_empleado_MM_cliente_id_seq"', 1, false);
            public       postgres    false    227         �	          0    25863    mnt_empleado_zona 
   TABLE DATA                     public       postgres    false    243       2559.dat �
           0    0    mnt_empleado_zona_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('mnt_empleado_zona_id_seq', 7, true);
            public       postgres    false    242         �	          0    17088    vs_database_diagrams 
   TABLE DATA                     public       postgres    false    228       2544.dat �           2606    17123    acl_classes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acl_classes
    ADD CONSTRAINT acl_classes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.acl_classes DROP CONSTRAINT acl_classes_pkey;
       public         postgres    false    172    172         �           2606    17125    acl_entries_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT acl_entries_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT acl_entries_pkey;
       public         postgres    false    174    174         �           2606    17127    acl_object_identities_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY acl_object_identities
    ADD CONSTRAINT acl_object_identities_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.acl_object_identities DROP CONSTRAINT acl_object_identities_pkey;
       public         postgres    false    176    176         �           2606    17129 "   acl_object_identity_ancestors_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT acl_object_identity_ancestors_pkey PRIMARY KEY (object_identity_id, ancestor_id);
 j   ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT acl_object_identity_ancestors_pkey;
       public         postgres    false    178    178    178         �           2606    17131    acl_security_identities_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY acl_security_identities
    ADD CONSTRAINT acl_security_identities_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.acl_security_identities DROP CONSTRAINT acl_security_identities_pkey;
       public         postgres    false    179    179         	           2606    26038    cfg_formato_documento_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT cfg_formato_documento_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT cfg_formato_documento_pkey;
       public         postgres    false    248    248         	           2606    37184    cfg_plantilla_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY cfg_plantilla
    ADD CONSTRAINT cfg_plantilla_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.cfg_plantilla DROP CONSTRAINT cfg_plantilla_pkey;
       public         postgres    false    250    250         �           2606    17650    ctl_banco_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ctl_banco
    ADD CONSTRAINT ctl_banco_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ctl_banco DROP CONSTRAINT ctl_banco_pkey;
       public         postgres    false    181    181         �           2606    17135    ctl_cargofuncional_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY ctl_cargofuncional
    ADD CONSTRAINT ctl_cargofuncional_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ctl_cargofuncional DROP CONSTRAINT ctl_cargofuncional_pkey;
       public         postgres    false    182    182         �           2606    17137    ctl_categoria_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ctl_categoria
    ADD CONSTRAINT ctl_categoria_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ctl_categoria DROP CONSTRAINT ctl_categoria_pkey;
       public         postgres    false    184    184         �           2606    17139    ctl_cliente_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT ctl_cliente_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT ctl_cliente_pkey;
       public         postgres    false    186    186         �           2606    17141    ctl_condicion_pago_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY ctl_condicionpago
    ADD CONSTRAINT ctl_condicion_pago_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.ctl_condicionpago DROP CONSTRAINT ctl_condicion_pago_pkey;
       public         postgres    false    188    188         �           2606    17143    ctl_departamento_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY ctl_departamento
    ADD CONSTRAINT ctl_departamento_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ctl_departamento DROP CONSTRAINT ctl_departamento_pkey;
       public         postgres    false    190    190         �           2606    17145    ctl_empleado_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY ctl_empleado
    ADD CONSTRAINT ctl_empleado_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ctl_empleado DROP CONSTRAINT ctl_empleado_pkey;
       public         postgres    false    192    192         �           2606    17147    ctl_empresa_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY cfg_empresa
    ADD CONSTRAINT ctl_empresa_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cfg_empresa DROP CONSTRAINT ctl_empresa_pkey;
       public         postgres    false    194    194         �           2606    17489    ctl_estado_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY ctl_estado
    ADD CONSTRAINT ctl_estado_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ctl_estado DROP CONSTRAINT ctl_estado_pkey;
       public         postgres    false    236    236         	           2606    37204    ctl_font_name_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ctl_font_name
    ADD CONSTRAINT ctl_font_name_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ctl_font_name DROP CONSTRAINT ctl_font_name_pkey;
       public         postgres    false    252    252         
	           2606    37232    ctl_font_size_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ctl_font_size
    ADD CONSTRAINT ctl_font_size_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ctl_font_size DROP CONSTRAINT ctl_font_size_pkey;
       public         postgres    false    253    253         �           2606    17149    ctl_forma_pago_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY ctl_formapago
    ADD CONSTRAINT ctl_forma_pago_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.ctl_formapago DROP CONSTRAINT ctl_forma_pago_pkey;
       public         postgres    false    196    196         	           2606    25930    ctl_marca_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY ctl_marca
    ADD CONSTRAINT ctl_marca_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ctl_marca DROP CONSTRAINT ctl_marca_pkey;
       public         postgres    false    246    246         �           2606    17151    ctl_municipio_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ctl_municipio
    ADD CONSTRAINT ctl_municipio_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ctl_municipio DROP CONSTRAINT ctl_municipio_pkey;
       public         postgres    false    198    198         �           2606    17153    ctl_pais_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ctl_pais
    ADD CONSTRAINT ctl_pais_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.ctl_pais DROP CONSTRAINT ctl_pais_pkey;
       public         postgres    false    200    200         �           2606    17155    ctl_producto_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT ctl_producto_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT ctl_producto_pkey;
       public         postgres    false    202    202         �           2606    17157    ctl_proveedor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT ctl_proveedor_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT ctl_proveedor_pkey;
       public         postgres    false    204    204         �           2606    17159    ctl_tipoentrada_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY ctl_tipoentrada
    ADD CONSTRAINT ctl_tipoentrada_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ctl_tipoentrada DROP CONSTRAINT ctl_tipoentrada_pkey;
       public         postgres    false    206    206         �           2606    17161    ctl_tipofactura_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY ctl_tipofactura
    ADD CONSTRAINT ctl_tipofactura_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ctl_tipofactura DROP CONSTRAINT ctl_tipofactura_pkey;
       public         postgres    false    208    208         �           2606    17163    ctl_unidad_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY ctl_unidad
    ADD CONSTRAINT ctl_unidad_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ctl_unidad DROP CONSTRAINT ctl_unidad_pkey;
       public         postgres    false    210    210         �           2606    17582    ctl_zona_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY ctl_zona
    ADD CONSTRAINT ctl_zona_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.ctl_zona DROP CONSTRAINT ctl_zona_pkey;
       public         postgres    false    240    240         �           2606    17165    cxc_cobro_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT cxc_cobro_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT cxc_cobro_pkey;
       public         postgres    false    212    212         �           2606    17169    fac_factura_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT fac_factura_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT fac_factura_pkey;
       public         postgres    false    214    214         �           2606    25904    fac_facturadetalle_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT fac_facturadetalle_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT fac_facturadetalle_pkey;
       public         postgres    false    215    215         �           2606    17479    fac_notaremision_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT fac_notaremision_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT fac_notaremision_pkey;
       public         postgres    false    234    234         �           2606    17502    fac_notaremisiondetalle_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT fac_notaremisiondetalle_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT fac_notaremisiondetalle_pkey;
       public         postgres    false    238    238         �           2606    17171    fos_user_group_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY fos_user_group
    ADD CONSTRAINT fos_user_group_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.fos_user_group DROP CONSTRAINT fos_user_group_pkey;
       public         postgres    false    217    217         �           2606    17173    fos_user_user_group_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fos_user_user_group_pkey PRIMARY KEY (user_id, group_id);
 V   ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fos_user_user_group_pkey;
       public         postgres    false    220    220    220         �           2606    17175    fos_user_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY fos_user_user
    ADD CONSTRAINT fos_user_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.fos_user_user DROP CONSTRAINT fos_user_user_pkey;
       public         postgres    false    219    219         �           2606    17177    inv_entrada_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT inv_entrada_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT inv_entrada_pkey;
       public         postgres    false    222    222         �           2606    17179    inv_entradadetalle_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT inv_entradadetalle_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT inv_entradadetalle_pkey;
       public         postgres    false    224    224         �           2606    17421    inv_notaenvio_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT inv_notaenvio_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT inv_notaenvio_pkey;
       public         postgres    false    230    230         �           2606    17429    inv_notaenviodetalle_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT inv_notaenviodetalle_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT inv_notaenviodetalle_pkey;
       public         postgres    false    232    232         �           2606    17181    mnt_empleado_MM_cliente_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "mnt_empleado_MM_cliente_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "mnt_empleado_MM_cliente_pkey";
       public         postgres    false    226    226         �           2606    25868    mnt_empleado_zona_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT mnt_empleado_zona_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT mnt_empleado_zona_pkey;
       public         postgres    false    243    243         �           2606    17183    pk_name 
   CONSTRAINT     U   ALTER TABLE ONLY vs_database_diagrams
    ADD CONSTRAINT pk_name PRIMARY KEY (name);
 F   ALTER TABLE ONLY public.vs_database_diagrams DROP CONSTRAINT pk_name;
       public         postgres    false    228    228          	           2606    25882    uk_empleado_zona 
   CONSTRAINT     f   ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT uk_empleado_zona UNIQUE (id_empleado, id_zona);
 L   ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT uk_empleado_zona;
       public         postgres    false    243    243    243         �           2606    26016 	   uk_nombre 
   CONSTRAINT     K   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT uk_nombre UNIQUE (nombre);
 ?   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT uk_nombre;
       public         postgres    false    186    186         �           2606    25986    uk_numero_fecha 
   CONSTRAINT     ]   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT uk_numero_fecha UNIQUE (numero_recibo, fecha);
 C   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT uk_numero_fecha;
       public         postgres    false    212    212    212         �           2606    26012    uk_tipofactura_numero 
   CONSTRAINT     o   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT uk_tipofactura_numero UNIQUE (numero, id_tipofactura, activo);
 K   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT uk_tipofactura_numero;
       public         postgres    false    214    214    214    214         �           2606    26014    unique_abreviatura 
   CONSTRAINT     X   ALTER TABLE ONLY ctl_estado
    ADD CONSTRAINT unique_abreviatura UNIQUE (abreviatura);
 G   ALTER TABLE ONLY public.ctl_estado DROP CONSTRAINT unique_abreviatura;
       public         postgres    false    236    236         �           1259    17184    idx_46c8b8063d9ab4a6    INDEX     S   CREATE INDEX idx_46c8b8063d9ab4a6 ON acl_entries USING btree (object_identity_id);
 (   DROP INDEX public.idx_46c8b8063d9ab4a6;
       public         postgres    false    174         �           1259    17185    idx_46c8b806df9183c9    INDEX     U   CREATE INDEX idx_46c8b806df9183c9 ON acl_entries USING btree (security_identity_id);
 (   DROP INDEX public.idx_46c8b806df9183c9;
       public         postgres    false    174         �           1259    17186    idx_46c8b806ea000b10    INDEX     I   CREATE INDEX idx_46c8b806ea000b10 ON acl_entries USING btree (class_id);
 (   DROP INDEX public.idx_46c8b806ea000b10;
       public         postgres    false    174         �           1259    17187 $   idx_46c8b806ea000b103d9ab4a6df9183c9    INDEX     �   CREATE INDEX idx_46c8b806ea000b103d9ab4a6df9183c9 ON acl_entries USING btree (class_id, object_identity_id, security_identity_id);
 8   DROP INDEX public.idx_46c8b806ea000b103d9ab4a6df9183c9;
       public         postgres    false    174    174    174         �           1259    17188    idx_825de2993d9ab4a6    INDEX     e   CREATE INDEX idx_825de2993d9ab4a6 ON acl_object_identity_ancestors USING btree (object_identity_id);
 (   DROP INDEX public.idx_825de2993d9ab4a6;
       public         postgres    false    178         �           1259    17189    idx_825de299c671cea1    INDEX     ^   CREATE INDEX idx_825de299c671cea1 ON acl_object_identity_ancestors USING btree (ancestor_id);
 (   DROP INDEX public.idx_825de299c671cea1;
       public         postgres    false    178         �           1259    17190    idx_9407e54977fa751a    INDEX     d   CREATE INDEX idx_9407e54977fa751a ON acl_object_identities USING btree (parent_object_identity_id);
 (   DROP INDEX public.idx_9407e54977fa751a;
       public         postgres    false    176         �           1259    17191    idx_b3c77447a76ed395    INDEX     P   CREATE INDEX idx_b3c77447a76ed395 ON fos_user_user_group USING btree (user_id);
 (   DROP INDEX public.idx_b3c77447a76ed395;
       public         postgres    false    220         �           1259    17192    idx_b3c77447fe54d947    INDEX     Q   CREATE INDEX idx_b3c77447fe54d947 ON fos_user_user_group USING btree (group_id);
 (   DROP INDEX public.idx_b3c77447fe54d947;
       public         postgres    false    220         �           1259    17193 -   uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4    INDEX     �   CREATE UNIQUE INDEX uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4 ON acl_entries USING btree (class_id, object_identity_id, field_name, ace_order);
 A   DROP INDEX public.uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4;
       public         postgres    false    174    174    174    174         �           1259    17194    uniq_583d1f3e5e237e06    INDEX     P   CREATE UNIQUE INDEX uniq_583d1f3e5e237e06 ON fos_user_group USING btree (name);
 )   DROP INDEX public.uniq_583d1f3e5e237e06;
       public         postgres    false    217         �           1259    17195    uniq_69dd750638a36066    INDEX     S   CREATE UNIQUE INDEX uniq_69dd750638a36066 ON acl_classes USING btree (class_type);
 )   DROP INDEX public.uniq_69dd750638a36066;
       public         postgres    false    172         �           1259    17196    uniq_8835ee78772e836af85e0677    INDEX     q   CREATE UNIQUE INDEX uniq_8835ee78772e836af85e0677 ON acl_security_identities USING btree (identifier, username);
 1   DROP INDEX public.uniq_8835ee78772e836af85e0677;
       public         postgres    false    179    179         �           1259    17197    uniq_9407e5494b12ad6ea000b10    INDEX     u   CREATE UNIQUE INDEX uniq_9407e5494b12ad6ea000b10 ON acl_object_identities USING btree (object_identifier, class_id);
 0   DROP INDEX public.uniq_9407e5494b12ad6ea000b10;
       public         postgres    false    176    176         �           1259    17198    uniq_c560d76192fc23a8    INDEX     ]   CREATE UNIQUE INDEX uniq_c560d76192fc23a8 ON fos_user_user USING btree (username_canonical);
 )   DROP INDEX public.uniq_c560d76192fc23a8;
       public         postgres    false    219         �           1259    17199    uniq_c560d761a0d96fbf    INDEX     Z   CREATE UNIQUE INDEX uniq_c560d761a0d96fbf ON fos_user_user USING btree (email_canonical);
 )   DROP INDEX public.uniq_c560d761a0d96fbf;
       public         postgres    false    219         	           2606    17200    fk_46c8b8063d9ab4a6    FK CONSTRAINT     �   ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b8063d9ab4a6 FOREIGN KEY (object_identity_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b8063d9ab4a6;
       public       postgres    false    2214    176    174         	           2606    17205    fk_46c8b806df9183c9    FK CONSTRAINT     �   ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b806df9183c9 FOREIGN KEY (security_identity_id) REFERENCES acl_security_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b806df9183c9;
       public       postgres    false    2222    174    179         	           2606    17210    fk_46c8b806ea000b10    FK CONSTRAINT     �   ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b806ea000b10 FOREIGN KEY (class_id) REFERENCES acl_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b806ea000b10;
       public       postgres    false    174    172    2204         	           2606    17215    fk_825de2993d9ab4a6    FK CONSTRAINT     �   ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT fk_825de2993d9ab4a6 FOREIGN KEY (object_identity_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT fk_825de2993d9ab4a6;
       public       postgres    false    178    2214    176         	           2606    17220    fk_825de299c671cea1    FK CONSTRAINT     �   ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT fk_825de299c671cea1 FOREIGN KEY (ancestor_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT fk_825de299c671cea1;
       public       postgres    false    2214    176    178         	           2606    17225    fk_9407e54977fa751a    FK CONSTRAINT     �   ALTER TABLE ONLY acl_object_identities
    ADD CONSTRAINT fk_9407e54977fa751a FOREIGN KEY (parent_object_identity_id) REFERENCES acl_object_identities(id);
 S   ALTER TABLE ONLY public.acl_object_identities DROP CONSTRAINT fk_9407e54977fa751a;
       public       postgres    false    176    176    2214         0	           2606    17230    fk_b3c77447a76ed395    FK CONSTRAINT     �   ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fk_b3c77447a76ed395 FOREIGN KEY (user_id) REFERENCES fos_user_user(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fk_b3c77447a76ed395;
       public       postgres    false    220    2272    219         1	           2606    17235    fk_b3c77447fe54d947    FK CONSTRAINT     �   ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fk_b3c77447fe54d947 FOREIGN KEY (group_id) REFERENCES fos_user_group(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fk_b3c77447fe54d947;
       public       postgres    false    2269    217    220         -	           2606    37141 %   lnk_cfg_formato_documento_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_cfg_formato_documento_fac_factura FOREIGN KEY (id_formato_documento) REFERENCES cfg_formato_documento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_cfg_formato_documento_fac_factura;
       public       postgres    false    214    248    2308         H	           2606    37188 '   lnk_cfg_plantilla_cfg_formato_documento    FK CONSTRAINT     �   ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_cfg_plantilla_cfg_formato_documento FOREIGN KEY (id_plantilla) REFERENCES cfg_plantilla(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_cfg_plantilla_cfg_formato_documento;
       public       postgres    false    250    248    2310         9	           2606    17240    lnk_cliente_MM_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "lnk_cliente_MM_empleado" FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "lnk_cliente_MM_empleado";
       public       postgres    false    2231    186    226         %	           2606    17655    lnk_ctl_banco_cxc_cobro    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_banco_cxc_cobro FOREIGN KEY (id_banco) REFERENCES ctl_banco(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_banco_cxc_cobro;
       public       postgres    false    212    181    2225         	           2606    17250 #   lnk_ctl_cargofuncional_ctl_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_empleado
    ADD CONSTRAINT lnk_ctl_cargofuncional_ctl_empleado FOREIGN KEY (id_cargofuncional) REFERENCES ctl_cargofuncional(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.ctl_empleado DROP CONSTRAINT lnk_ctl_cargofuncional_ctl_empleado;
       public       postgres    false    182    2227    192         	           2606    17255    lnk_ctl_categoria_ctl_producto    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_categoria_ctl_producto FOREIGN KEY (id_categoria) REFERENCES ctl_categoria(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_categoria_ctl_producto;
       public       postgres    false    184    202    2229         &	           2606    17260    lnk_ctl_cliente_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_cliente_fac_factura FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_cliente_fac_factura;
       public       postgres    false    2231    186    214         @	           2606    17508     lnk_ctl_cliente_fac_notaremision    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_ctl_cliente_fac_notaremision FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_ctl_cliente_fac_notaremision;
       public       postgres    false    2231    186    234         ;	           2606    17443    lnk_ctl_cliente_inv_notaenvio    FK CONSTRAINT     �   ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_ctl_cliente_inv_notaenvio FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_ctl_cliente_inv_notaenvio;
       public       postgres    false    2231    230    186         '	           2606    17265 !   lnk_ctl_condicionpago_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_condicionpago_fac_factura FOREIGN KEY (id_condicionpago) REFERENCES ctl_condicionpago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_condicionpago_fac_factura;
       public       postgres    false    214    188    2235         C	           2606    17523 &   lnk_ctl_condicionpago_fac_notaremision    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_ctl_condicionpago_fac_notaremision FOREIGN KEY (id_condicionpago) REFERENCES ctl_condicionpago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_ctl_condicionpago_fac_notaremision;
       public       postgres    false    234    2235    188         	           2606    17270     lnk_ctl_departamento_ctl_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_departamento_ctl_cliente FOREIGN KEY (id_departamento) REFERENCES ctl_departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_departamento_ctl_cliente;
       public       postgres    false    186    190    2237         	           2606    17275 "   lnk_ctl_departamento_ctl_municipio    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_municipio
    ADD CONSTRAINT lnk_ctl_departamento_ctl_municipio FOREIGN KEY (id_departamento) REFERENCES ctl_departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.ctl_municipio DROP CONSTRAINT lnk_ctl_departamento_ctl_municipio;
       public       postgres    false    198    190    2237         F	           2606    25869    lnk_ctl_empleado_MM_ctl_zona    FK CONSTRAINT     �   ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT "lnk_ctl_empleado_MM_ctl_zona" FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT "lnk_ctl_empleado_MM_ctl_zona";
       public       postgres    false    192    2239    243          	           2606    17280    lnk_ctl_empleado_cxc_cobro    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_empleado_cxc_cobro FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_empleado_cxc_cobro;
       public       postgres    false    2239    212    192         +	           2606    17398    lnk_ctl_empleado_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_empleado_fac_factura FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_empleado_fac_factura;
       public       postgres    false    2239    214    192         6	           2606    17546    lnk_ctl_estado_inv_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_estado_inv_entrada FOREIGN KEY (id_estado) REFERENCES ctl_estado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_estado_inv_entrada;
       public       postgres    false    236    222    2294         J	           2606    37238 '   lnk_ctl_font_name_cfg_formato_documento    FK CONSTRAINT     �   ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_ctl_font_name_cfg_formato_documento FOREIGN KEY (id_font_name) REFERENCES ctl_font_name(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_ctl_font_name_cfg_formato_documento;
       public       postgres    false    2312    248    252         I	           2606    37233 '   lnk_ctl_font_size_cfg_formato_documento    FK CONSTRAINT     �   ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_ctl_font_size_cfg_formato_documento FOREIGN KEY (id_font_size) REFERENCES ctl_font_size(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_ctl_font_size_cfg_formato_documento;
       public       postgres    false    253    2314    248         !	           2606    17285    lnk_ctl_forma_pago_cxc_cobro    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_forma_pago_cxc_cobro FOREIGN KEY (id_forma_pago) REFERENCES ctl_formapago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_forma_pago_cxc_cobro;
       public       postgres    false    212    196    2243         	           2606    25936    lnk_ctl_marca_ctl_producto    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_marca_ctl_producto FOREIGN KEY (id_marca) REFERENCES ctl_marca(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_marca_ctl_producto;
       public       postgres    false    202    2306    246         	           2606    17290    lnk_ctl_municipio_ctl_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_municipio_ctl_cliente FOREIGN KEY (id_municipio) REFERENCES ctl_municipio(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_municipio_ctl_cliente;
       public       postgres    false    2245    198    186         	           2606    17295    lnk_ctl_pais_ctl_proveedor    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_ctl_pais_ctl_proveedor FOREIGN KEY (id_pais) REFERENCES ctl_pais(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_ctl_pais_ctl_proveedor;
       public       postgres    false    204    200    2247         .	           2606    17300 #   lnk_ctl_producto_fac_facturadetalle    FK CONSTRAINT     �   ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT lnk_ctl_producto_fac_facturadetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT lnk_ctl_producto_fac_facturadetalle;
       public       postgres    false    215    202    2249         E	           2606    17528 (   lnk_ctl_producto_fac_notaremisiondetalle    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT lnk_ctl_producto_fac_notaremisiondetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT lnk_ctl_producto_fac_notaremisiondetalle;
       public       postgres    false    2249    238    202         8	           2606    25958 #   lnk_ctl_producto_inv_entradadetalle    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT lnk_ctl_producto_inv_entradadetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT lnk_ctl_producto_inv_entradadetalle;
       public       postgres    false    202    224    2249         ?	           2606    17438 %   lnk_ctl_producto_inv_notaenviodetalle    FK CONSTRAINT     �   ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT lnk_ctl_producto_inv_notaenviodetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT lnk_ctl_producto_inv_notaenviodetalle;
       public       postgres    false    202    2249    232         2	           2606    17305    lnk_ctl_proveedor_inv_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_proveedor_inv_entrada FOREIGN KEY (id_proveedor) REFERENCES ctl_proveedor(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_proveedor_inv_entrada;
       public       postgres    false    2251    222    204         3	           2606    17310    lnk_ctl_tipoentrada_inv_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_tipoentrada_inv_entrada FOREIGN KEY (id_tipoentrada) REFERENCES ctl_tipoentrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_tipoentrada_inv_entrada;
       public       postgres    false    206    222    2253         (	           2606    17315    lnk_ctl_tipofactura_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_tipofactura_fac_factura FOREIGN KEY (id_tipofactura) REFERENCES ctl_tipofactura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_tipofactura_fac_factura;
       public       postgres    false    208    214    2255         	           2606    17320    lnk_ctl_unidad_ctl_producto    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_unidad_ctl_producto FOREIGN KEY (id_unidad) REFERENCES ctl_unidad(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_unidad_ctl_producto;
       public       postgres    false    210    202    2257         G	           2606    25874    lnk_ctl_zona_MM_ctl_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT "lnk_ctl_zona_MM_ctl_empleado" FOREIGN KEY (id_zona) REFERENCES ctl_zona(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT "lnk_ctl_zona_MM_ctl_empleado";
       public       postgres    false    240    243    2300         	           2606    17600    lnk_ctl_zona_ctl_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_zona_ctl_cliente FOREIGN KEY (id_zona) REFERENCES ctl_zona(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_zona_ctl_cliente;
       public       postgres    false    240    2300    186         :	           2606    17325    lnk_empleado_MM_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "lnk_empleado_MM_cliente" FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "lnk_empleado_MM_cliente";
       public       postgres    false    192    226    2239         "	           2606    17330    lnk_fac_factura_cxc_cobro    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fac_factura_cxc_cobro FOREIGN KEY (id_factura) REFERENCES fac_factura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fac_factura_cxc_cobro;
       public       postgres    false    2263    212    214         /	           2606    17335 "   lnk_fac_factura_fac_facturadetalle    FK CONSTRAINT     �   ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT lnk_fac_factura_fac_facturadetalle FOREIGN KEY (id_factura) REFERENCES fac_factura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT lnk_fac_factura_fac_facturadetalle;
       public       postgres    false    215    214    2263         ,	           2606    34214     lnk_fac_notaremision_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fac_notaremision_fac_factura FOREIGN KEY (id_notaremision) REFERENCES fac_notaremision(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fac_notaremision_fac_factura;
       public       postgres    false    2292    234    214         D	           2606    17503 ,   lnk_fac_notaremision_fac_notaremisiondetalle    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT lnk_fac_notaremision_fac_notaremisiondetalle FOREIGN KEY (id_notaremision) REFERENCES fac_notaremision(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT lnk_fac_notaremision_fac_notaremisiondetalle;
       public       postgres    false    234    2292    238         	           2606    17340    lnk_fos_user_user_ctl_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_fos_user_user_ctl_cliente;
       public       postgres    false    2272    186    219         	           2606    17345    lnk_fos_user_user_ctl_cliente_1    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_fos_user_user_ctl_cliente_1;
       public       postgres    false    219    186    2272         	           2606    17350    lnk_fos_user_user_ctl_producto    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_fos_user_user_ctl_producto FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_fos_user_user_ctl_producto;
       public       postgres    false    219    202    2272         	           2606    17355     lnk_fos_user_user_ctl_producto_1    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_fos_user_user_ctl_producto_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_fos_user_user_ctl_producto_1;
       public       postgres    false    219    202    2272         	           2606    17560    lnk_fos_user_user_ctl_proveedor    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_fos_user_user_ctl_proveedor FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_fos_user_user_ctl_proveedor;
       public       postgres    false    219    2272    204         	           2606    17565 !   lnk_fos_user_user_ctl_proveedor_1    FK CONSTRAINT     �   ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_fos_user_user_ctl_proveedor_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_fos_user_user_ctl_proveedor_1;
       public       postgres    false    204    2272    219         #	           2606    17360    lnk_fos_user_user_cxc_cobro    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fos_user_user_cxc_cobro FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fos_user_user_cxc_cobro;
       public       postgres    false    219    212    2272         $	           2606    17365    lnk_fos_user_user_cxc_cobro_1    FK CONSTRAINT     �   ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fos_user_user_cxc_cobro_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fos_user_user_cxc_cobro_1;
       public       postgres    false    219    212    2272         )	           2606    17370    lnk_fos_user_user_fac_factura    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fos_user_user_fac_factura FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fos_user_user_fac_factura;
       public       postgres    false    2272    219    214         *	           2606    17375    lnk_fos_user_user_fac_factura_1    FK CONSTRAINT     �   ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fos_user_user_fac_factura_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fos_user_user_fac_factura_1;
       public       postgres    false    214    219    2272         A	           2606    17513 "   lnk_fos_user_user_fac_notaremision    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_fos_user_user_fac_notaremision FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_fos_user_user_fac_notaremision;
       public       postgres    false    219    234    2272         B	           2606    17518 $   lnk_fos_user_user_fac_notaremision_1    FK CONSTRAINT     �   ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_fos_user_user_fac_notaremision_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_fos_user_user_fac_notaremision_1;
       public       postgres    false    234    219    2272         4	           2606    17380    lnk_fos_user_user_inv_entrada    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_fos_user_user_inv_entrada FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_fos_user_user_inv_entrada;
       public       postgres    false    2272    222    219         5	           2606    17385    lnk_fos_user_user_inv_entrada_1    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_fos_user_user_inv_entrada_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_fos_user_user_inv_entrada_1;
       public       postgres    false    219    222    2272         <	           2606    17452    lnk_fos_user_user_inv_notaenvio    FK CONSTRAINT     �   ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_fos_user_user_inv_notaenvio FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_fos_user_user_inv_notaenvio;
       public       postgres    false    230    219    2272         =	           2606    17457 !   lnk_fos_user_user_inv_notaenvio_1    FK CONSTRAINT     �   ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_fos_user_user_inv_notaenvio_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_fos_user_user_inv_notaenvio_1;
       public       postgres    false    230    2272    219         7	           2606    17390 "   lnk_inv_entrada_inv_entradadetalle    FK CONSTRAINT     �   ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT lnk_inv_entrada_inv_entradadetalle FOREIGN KEY (id_entrada) REFERENCES inv_entrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT lnk_inv_entrada_inv_entradadetalle;
       public       postgres    false    222    224    2280         >	           2606    17430 &   lnk_inv_notaenvio_inv_notaenviodetalle    FK CONSTRAINT     �   ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT lnk_inv_notaenvio_inv_notaenviodetalle FOREIGN KEY (id_notaenvio) REFERENCES inv_notaenvio(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT lnk_inv_notaenvio_inv_notaenviodetalle;
       public       postgres    false    232    2288    230                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          2488.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014253  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2490.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014244  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2492.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014246  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2494.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014250  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2495.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014251  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2510.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014235  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2564.dat                                                                                            0000600 0004000 0002000 00000006362 12576130370 014265  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO cfg_formato_documento (detalle_interlineado, detalle_x_col1, detalle_y, fila1_col1, fila1_col2, fila2_col1, fila2_col2, fila3_col1, fila3_col2, fila4_col1, fila4_col2, fila5_col1, fila5_col2, fila6_col1, fila6_col2, fila7_col1, fila7_col2, id, margen_derecho, margen_inferior, margen_izquierdo, margen_superior, nombre, detalle_x_col2, detalle_x_col3, detalle_x_col4, detalle_x_col5, pie_y, pie_x_col1, pie_x_col2, detalle_x_col6, papel, detalle_numero_items, interlineado, pie_interlineado, id_plantilla, id_font_name, id_font_size) VALUES ('10px', '10%', '0', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', 2, '10', '10', '10', '30', 'Consumidor Final', '40%', '10%', '10%', '10%', '50%', '90%', '10%', '10%', 'Letter', 12, '10px', NULL, 3, 1, 1);
INSERT INTO cfg_formato_documento (detalle_interlineado, detalle_x_col1, detalle_y, fila1_col1, fila1_col2, fila2_col1, fila2_col2, fila3_col1, fila3_col2, fila4_col1, fila4_col2, fila5_col1, fila5_col2, fila6_col1, fila6_col2, fila7_col1, fila7_col2, id, margen_derecho, margen_inferior, margen_izquierdo, margen_superior, nombre, detalle_x_col2, detalle_x_col3, detalle_x_col4, detalle_x_col5, pie_y, pie_x_col1, pie_x_col2, detalle_x_col6, papel, detalle_numero_items, interlineado, pie_interlineado, id_plantilla, id_font_name, id_font_size) VALUES ('10px', '10%', '0', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', 4, '10', '10', '10', '30', 'Consumidor Final (Detalle manual)', '40%', '10%', '10%', '10%', '50%', '90%', '10%', '10%', 'Letter', 1, '10px', NULL, 4, 1, 1);
INSERT INTO cfg_formato_documento (detalle_interlineado, detalle_x_col1, detalle_y, fila1_col1, fila1_col2, fila2_col1, fila2_col2, fila3_col1, fila3_col2, fila4_col1, fila4_col2, fila5_col1, fila5_col2, fila6_col1, fila6_col2, fila7_col1, fila7_col2, id, margen_derecho, margen_inferior, margen_izquierdo, margen_superior, nombre, detalle_x_col2, detalle_x_col3, detalle_x_col4, detalle_x_col5, pie_y, pie_x_col1, pie_x_col2, detalle_x_col6, papel, detalle_numero_items, interlineado, pie_interlineado, id_plantilla, id_font_name, id_font_size) VALUES ('10px', '10%', '0', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', 1, '10', '10', '10', '30', 'Comprobante de Crédito Fiscal', '50%', '10%', '10%', '10%', '50%', '90%', '10%', '10%', 'Letter', 10, '10px', NULL, 1, 1, 1);
INSERT INTO cfg_formato_documento (detalle_interlineado, detalle_x_col1, detalle_y, fila1_col1, fila1_col2, fila2_col1, fila2_col2, fila3_col1, fila3_col2, fila4_col1, fila4_col2, fila5_col1, fila5_col2, fila6_col1, fila6_col2, fila7_col1, fila7_col2, id, margen_derecho, margen_inferior, margen_izquierdo, margen_superior, nombre, detalle_x_col2, detalle_x_col3, detalle_x_col4, detalle_x_col5, pie_y, pie_x_col1, pie_x_col2, detalle_x_col6, papel, detalle_numero_items, interlineado, pie_interlineado, id_plantilla, id_font_name, id_font_size) VALUES ('10px', '10%', '0', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', '70%', '30%', 3, '10', '10', '10', '30', 'Comprobante de Crédito Fiscal (Detalle manual)', '50%', '10%', '10%', '10%', '50%', '90%', '10%', '10%', 'Letter', 1, '10px', NULL, 2, 1, 1);


                                                                                                                                                                                                                                                                              2566.dat                                                                                            0000600 0004000 0002000 00000000506 12576130370 014261  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO cfg_plantilla (id, nombre) VALUES (1, 'factura_ccf.html.twig');
INSERT INTO cfg_plantilla (id, nombre) VALUES (2, 'factura_ccf_manual.html.twig');
INSERT INTO cfg_plantilla (id, nombre) VALUES (3, 'factura_cfinal.html.twig');
INSERT INTO cfg_plantilla (id, nombre) VALUES (4, 'factura_cfinal_manual.html.twig');


                                                                                                                                                                                          2497.dat                                                                                            0000600 0004000 0002000 00000000122 12576130370 014256  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_banco (nombre, activo, id) VALUES ('Banco Agrícola', true, 1);


                                                                                                                                                                                                                                                                                                                                                                                                                                              2498.dat                                                                                            0000600 0004000 0002000 00000000254 12576130370 014265  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_cargofuncional (id, nombre, activo) VALUES (1, 'Vendedor', true);
INSERT INTO ctl_cargofuncional (id, nombre, activo) VALUES (2, 'Administrativo', true);


                                                                                                                                                                                                                                                                                                                                                    2500.dat                                                                                            0000600 0004000 0002000 00000000234 12576130370 014243  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_categoria (nombre, activo, id) VALUES ('Insumos', true, 1);
INSERT INTO ctl_categoria (nombre, activo, id) VALUES ('Reactivos', true, 2);


                                                                                                                                                                                                                                                                                                                                                                    2502.dat                                                                                            0000600 0004000 0002000 00000000672 12576130370 014253  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_cliente (id, nombre, nombre_comercial, giro, nit, nrc, direccion, telefono, activo, id_departamento, id_municipio, date_add, id_user_mod, id_user_add, date_mod, email, exento, id_zona, codigo) VALUES (4, 'Ministerio de Salud', 'Ministerio de salud Publica y Asistencia Social', 'Salud', '112121', '223123', 'Calle Arce', '2221-0401', true, 6, 97, '2015-07-24', 1, 1, '2015-08-04', 'jcastillore@yahoo.es', true, 1, '13432');


                                                                      2504.dat                                                                                            0000600 0004000 0002000 00000000400 12576130370 014242  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_condicionpago (id, nombre, activo) VALUES (3, 'Crédito', true);
INSERT INTO ctl_condicionpago (id, nombre, activo) VALUES (2, 'Crédito a 30 días', true);
INSERT INTO ctl_condicionpago (id, nombre, activo) VALUES (1, 'Efectivo', true);


                                                                                                                                                                                                                                                                2506.dat                                                                                            0000600 0004000 0002000 00000002540 12576130370 014253  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_departamento (id, nombre) VALUES (1, 'Ahuachapan ');
INSERT INTO ctl_departamento (id, nombre) VALUES (2, 'Santa Ana ');
INSERT INTO ctl_departamento (id, nombre) VALUES (3, 'Sonsonate ');
INSERT INTO ctl_departamento (id, nombre) VALUES (4, 'Chalatenango ');
INSERT INTO ctl_departamento (id, nombre) VALUES (5, 'La Libertad ');
INSERT INTO ctl_departamento (id, nombre) VALUES (6, 'San Salvador ');
INSERT INTO ctl_departamento (id, nombre) VALUES (7, 'Cuscatlan ');
INSERT INTO ctl_departamento (id, nombre) VALUES (8, 'La Paz ');
INSERT INTO ctl_departamento (id, nombre) VALUES (10, 'San Vicente ');
INSERT INTO ctl_departamento (id, nombre) VALUES (11, 'Usulutan ');
INSERT INTO ctl_departamento (id, nombre) VALUES (12, 'San Miguel ');
INSERT INTO ctl_departamento (id, nombre) VALUES (13, 'Morazan ');
INSERT INTO ctl_departamento (id, nombre) VALUES (14, 'La Union ');
INSERT INTO ctl_departamento (id, nombre) VALUES (15, 'Guatemala ');
INSERT INTO ctl_departamento (id, nombre) VALUES (16, 'Honduras ');
INSERT INTO ctl_departamento (id, nombre) VALUES (17, 'Nicaragua ');
INSERT INTO ctl_departamento (id, nombre) VALUES (18, 'Costa Rica ');
INSERT INTO ctl_departamento (id, nombre) VALUES (20, 'Otros Paises ');
INSERT INTO ctl_departamento (id, nombre) VALUES (9, 'Cabañas');
INSERT INTO ctl_departamento (id, nombre) VALUES (19, 'Panamá');


                                                                                                                                                                2508.dat                                                                                            0000600 0004000 0002000 00000000303 12576130370 014250  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_empleado (id, nombres, activo, apellidos, dui, nit, id_cargofuncional, direccion) VALUES (1, 'Julio', true, 'Castillo', '01298502-0', '06091506711018', 1, '18 calle poniente');


                                                                                                                                                                                                                                                                                                                             2552.dat                                                                                            0000600 0004000 0002000 00000001335 12576130370 014255  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_estado (id, nombre, abreviatura, descripcion) VALUES (1, 'Iniciado', 'INIC', 'Estado utilizado al iniciar un registro de un procedimiento');
INSERT INTO ctl_estado (id, nombre, abreviatura, descripcion) VALUES (2, 'En proceso', 'PROC', 'Estado utilizado siempre que el proceso caiga en estado recursivo o en pausa temporal');
INSERT INTO ctl_estado (id, nombre, abreviatura, descripcion) VALUES (4, 'Pagado', 'PAGADO', 'Estado para identificar procesos finalizados y liquidados, edición no permitida');
INSERT INTO ctl_estado (id, nombre, abreviatura, descripcion) VALUES (3, 'Pendiente de pago', 'PENDIENTE', 'Estado para identificar procesos ya concluidos en su construcción, pero pendientes de liquidación');


                                                                                                                                                                                                                                                                                                   2568.dat                                                                                            0000600 0004000 0002000 00000000076 12576130370 014265  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_font_name (id, nombre) VALUES (1, 'arial');


                                                                                                                                                                                                                                                                                                                                                                                                                                                                  2569.dat                                                                                            0000600 0004000 0002000 00000000072 12576130370 014262  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_font_size (size, id) VALUES ('8px', 1);


                                                                                                                                                                                                                                                                                                                                                                                                                                                                      2512.dat                                                                                            0000600 0004000 0002000 00000000232 12576130370 014244  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_formapago (id, activo, nombre) VALUES (1, true, 'Efectivo');
INSERT INTO ctl_formapago (id, activo, nombre) VALUES (2, true, 'Cheque');


                                                                                                                                                                                                                                                                                                                                                                      2562.dat                                                                                            0000600 0004000 0002000 00000000110 12576130370 014244  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_marca (id, nombre, activo) VALUES (1, 'NIPRO', true);


                                                                                                                                                                                                                                                                                                                                                                                                                                                        2514.dat                                                                                            0000600 0004000 0002000 00000057063 12576130370 014264  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (1, 'AHUACHAPAN', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (2, 'APANECA', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (3, 'ATIQUIZAYA', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (4, 'CONCEPCION DE ATACO', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (5, 'EL REFUGIO', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (6, 'GUAYMANGO ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (7, 'JUJUTLA ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (8, 'SAN FRANCISCO MENENDEZ ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (9, 'SAN LORENZO ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (10, 'SAN PEDRO PUXTLA ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (11, 'TACUBA ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (12, 'TURIN ', 1);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (13, 'CANDELARIA DE LA FRONTERA ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (14, 'COATEPEQUE ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (15, 'CHALCHUAPA ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (16, 'EL CONGO ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (17, 'EL PORVENIR ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (18, 'MASAHUAT ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (19, 'METAPAN ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (20, 'SAN ANTONIO PAJONAL ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (21, 'SAN SEBASTIAN SALITRILLO ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (22, 'SANTA ANA ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (23, 'SANTA ROSA GUACHIPILIN ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (24, 'SANTIAGO DE LA FRONTERA ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (25, 'TEXISTEPEQUE ', 2);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (26, 'ACAJUTLA ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (27, 'ARMENIA ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (28, 'CALUCO ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (29, 'CUISNAHUAT ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (30, 'SANTA ISABEL ISHUATAN ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (31, 'IZALCO ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (32, 'JUAYUA ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (33, 'NAHUIZALCO ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (34, 'NAHUILINGO ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (35, 'SALCOATITAN ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (36, 'SAN ANTONIO DEL MONTE ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (37, 'SAN JULIAN ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (38, 'SANTA CATARINA MASAHUAT ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (39, 'SANTO DOMINGO DE GUZMAN ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (40, 'SONSONATE ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (41, 'SONZACATE ', 3);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (42, 'AGUA CALIENTE ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (43, 'ARCATAO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (44, 'AZACUALPA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (45, 'CITALA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (46, 'COMALAPA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (47, 'CONCEPCION QUEZALTEPEQUE ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (48, 'CHALATENANGO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (49, 'DULCE NOMBRE DE MARIA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (50, 'EL CARRIZAL ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (51, 'EL PARAISO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (52, 'LA LAGUNA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (53, 'LA PALMA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (54, 'LA REINA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (55, 'LAS VUELTAS ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (56, 'NOMBRE DE JESUS ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (57, 'NUEVA CONCEPCION ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (58, 'NUEVA TRINIDAD ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (59, 'OJOS DE AGUA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (60, 'POTONICO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (61, 'SAN ANTONIO DE LA CRUZ ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (62, 'SAN ANTONIO LOS RANCHOS ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (63, 'SAN FERNANDO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (64, 'SAN FRANCISCO LEMPA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (65, 'SAN FRANCISCO MORAZAN ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (66, 'SAN IGNACIO ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (67, 'SAN ISIDRO LABRADOR ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (68, 'SAN JOSE CANCASQUE ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (69, 'LAS FLORES ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (70, 'SAN LUIS DEL CARMEN ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (71, 'SAN MIGUEL DE MERCEDES ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (72, 'SAN RAFAEL ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (73, 'SANTA RITA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (74, 'TEJUTLA ', 4);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (75, 'ANTIGUO CUSCATLAN ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (76, 'CIUDAD ARCE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (77, 'COLON ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (78, 'COMASAGUA ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (79, 'CHILTIUPAN ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (80, 'HUIZUCAR ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (81, 'JAYAQUE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (82, 'JICALAPA ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (83, 'PUERTO DE LA LIBERTAD ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (84, 'NUEVO CUSCATLAN ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (85, 'NUEVA SAN SALVADOR ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (86, 'QUEZALTEPEQUE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (87, 'SACACOYO ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (88, 'SAN JOSE VILLANUEVA ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (89, 'SAN JUAN OPICO ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (90, 'SAN MATIAS ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (91, 'SAN PABLO TACACHICO ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (92, 'TAMANIQUE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (93, 'TALNIQUE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (94, 'TEOTEPEQUE ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (95, 'TEPECOYO ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (96, 'ZARAGOZA ', 5);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (97, 'AGUILARES ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (98, 'APOPA ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (99, 'AYUTUXTEPEQUE ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (100, 'CUSCATANCINGO ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (101, 'desconocido ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (102, 'GUAZAPA ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (103, 'ILOPANGO ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (104, 'MEJICANOS ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (105, 'NEJAPA ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (106, 'PANCHIMALCO ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (107, 'ROSARIO DE MORA ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (108, 'SAN MARCOS ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (109, 'SAN MARTIN ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (110, 'SAN SALVADOR ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (111, 'SANTIAGO TEXACUANGOS ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (112, 'SANTO TOMAS ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (113, 'SOYAPANGO ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (114, 'TONACATEPEQUE ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (115, 'DELGADO ', 6);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (116, 'CANDELARIA ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (117, 'COJUTEPEQUE ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (118, 'EL CARMEN ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (119, 'EL ROSARIO ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (120, 'MONTE SAN JUAN ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (121, 'ORATORIO DE CONCEPCION ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (122, 'SAN BARTOLOME PERULAPIA ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (123, 'SAN CRISTOBAL ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (124, 'SAN JOSE GUAYABAL ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (125, 'SAN PEDRO PERULAPAN ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (126, 'SAN RAFAEL CEDROS ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (127, 'SAN RAMON ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (128, 'SANTA CRUZ ANALQUITO ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (129, 'SANTA CRUZ MICHAPA ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (130, 'SUCHITOTO ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (131, 'TENANCINGO ', 7);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (132, 'CUYULTITAN ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (133, 'EL ROSARIO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (134, 'JERUSALEN ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (135, 'MERCEDES DE LA CEIBA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (136, 'OLOCUILTA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (137, 'PARAISO DE OSORIO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (138, 'SAN ANTONIO MASAHUAT ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (139, 'SAN EMIGDIO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (140, 'SAN FRANCISCO CHINAMECA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (141, 'SAN JUAN NONUALCO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (142, 'SAN JUAN TALPA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (143, 'SAN JUAN TEPEZONTES ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (144, 'SAN LUIS TALPA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (145, 'SAN MIGUEL TEPEZONTES ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (146, 'SAN PEDRO MASAHUAT ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (147, 'SAN PEDRO NONUALCO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (148, 'SAN RAFAEL OBRAJUELO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (149, 'SANTA MARIA OSTUMA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (150, 'SANTIAGO NONUALCO ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (151, 'TAPALHUACA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (152, 'ZACATECOLUCA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (153, 'SAN LUIS DE LA HERRADURA ', 8);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (154, 'CINQUERA ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (155, 'GUACOTECTI ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (156, 'ILOBASCO ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (157, 'JUTIAPA ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (158, 'SAN ISIDRO ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (159, 'SENSUNTEPEQUE ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (160, 'TEJUTEPEQUE ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (161, 'VICTORIA ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (162, 'DOLORES ', 9);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (163, 'APASTEPEQUE ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (164, 'GUADALUPE ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (165, 'SAN CAYETANO ISTEPEQUE ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (166, 'SANTA CLARA ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (167, 'SANTO DOMINGO ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (168, 'SAN ESTEBAN CATARINA ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (169, 'SAN ILDEFONSO ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (170, 'SAN LORENZO ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (171, 'SAN SEBASTIAN ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (172, 'SAN VICENTE ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (173, 'TECOLUCA ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (174, 'TEPETITAN ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (175, 'VERAPAZ ', 10);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (176, 'ALEGRIA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (177, 'BERLIN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (178, 'CALIFORNIA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (179, 'CONCEPCION BATRES ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (180, 'EL TRIUNFO ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (181, 'EREGUAYQUIN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (182, 'ESTANZUELAS ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (183, 'JIQUILISCO ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (184, 'JUCUAPA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (185, 'JUCUARAN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (186, 'MERCEDES UMANA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (187, 'NUEVA GRANADA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (188, 'OZATLAN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (189, 'PUERTO EL TRIUNFO ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (190, 'SAN AGUSTIN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (191, 'SAN BUENAVENTURA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (192, 'SAN DIONISIO ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (193, 'SANTA ELENA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (194, 'SAN FRANCISCO JAVIER ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (195, 'SANTA MARIA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (196, 'SANTIAGO DE MARIA ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (197, 'TECAPAN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (198, 'USULUTAN ', 11);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (199, 'CAROLINA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (200, 'CIUDAD BARRIOS ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (201, 'desconocido ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (202, 'CHAPELTIQUE ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (203, 'CHINAMECA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (204, 'CHIRILAGUA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (205, 'EL TRANSITO ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (206, 'LOLOTIQUE ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (207, 'MONCAGUA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (208, 'NUEVA GUADALUPE ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (209, 'NUEVO EDEN DE SAN JUAN ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (210, 'QUELEPA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (211, 'SAN ANTONIO ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (212, 'SAN GERARDO ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (213, 'SAN JORGE ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (214, 'SAN LUIS DE LA REINA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (215, 'SAN MIGUEL ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (216, 'SAN RAFAEL ORIENTE ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (217, 'SESORI ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (218, 'ULUAZAPA ', 12);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (219, 'ARAMBALA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (220, 'CACAOPERA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (221, 'CORINTO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (222, 'CHILANGA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (223, 'DELICIAS DE CONCEPCION ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (224, 'EL DIVISADERO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (225, 'EL ROSARIO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (226, 'GUALOCOCTI ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (227, 'GUATAJIAGUA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (228, 'JOATECA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (229, 'JOCOAITIQUE ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (230, 'JOCORO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (231, 'LOLOTIQUILLO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (232, 'MEANGUERA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (233, 'OSICALA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (234, 'PERQUIN ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (235, 'SAN CARLOS ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (236, 'SAN FERNANDO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (237, 'SAN FRANCISCO GOTERA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (238, 'SAN ISIDRO ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (239, 'SAN SIMON ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (240, 'SENSEMBRA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (241, 'SOCIEDAD ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (242, 'TOROLA ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (243, 'YAMABAL ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (244, 'YOLOAIQUIN ', 13);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (245, 'ANAMOROS ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (246, 'BOLIVAR ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (247, 'CONCEPCION ORIENTE ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (248, 'CONCHAGUA ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (249, 'EL CARMEN ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (250, 'EL SAUCE ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (251, 'INTIPUCA ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (252, 'LA UNION ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (253, 'LISLIQUE ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (254, 'NUEVA ESPARTA ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (255, 'PASAQUINA ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (256, 'POLOROS ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (257, 'SAN ALEJO ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (258, 'SAN JOSE ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (259, 'SANTA ROSA DE LIMA ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (260, 'YAYANTIQUE ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (261, 'YUCUAIQUIN ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (262, 'MEANGUERA DEL GOLFO ', 14);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (263, 'Guatemala ', 15);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (264, 'Honduras ', 16);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (265, 'Nicaragua ', 17);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (266, 'Costa Rica ', 18);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (267, 'Panam', 19);
INSERT INTO ctl_municipio (id, nombre, id_departamento) VALUES (268, 'Otros Paises ', 20);


                                                                                                                                                                                                                                                                                                                                                                                                                                                                             2516.dat                                                                                            0000600 0004000 0002000 00000000077 12576130370 014257  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_pais (id, nombre) VALUES (1, 'El Salvador');


                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2518.dat                                                                                            0000600 0004000 0002000 00000000610 12576130370 014252  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_producto (id, nombre, presentacion, id_categoria, id_user_add, id_user_mod, date_add, date_mod, id_unidad, existencia, existencia_maxima, existencia_minima, precio_costo, precio_venta, reservado, codigo, activo, id_marca) VALUES (3, 'AGUJAS HIPODERMICAS 21X1', 'caja x 100', 2, 1, 1, '2015-08-04', '2015-08-10', 3, 10.00, 30.00, 3.00, 45.00, 67.00, 0.00, '33434', true, 1);


                                                                                                                        2520.dat                                                                                            0000600 0004000 0002000 00000000511 12576130370 014243  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_proveedor (activo, direccion, email, nit, nombre, nombre_comercial, nrc, telefono, id_pais, id, date_add, date_mod, id_user_add, id_user_mod) VALUES (true, 'Col. Jerusalem', 'fisher@elsalvador.com', '9388493849384', 'Fisher', 'Fisher de El Salvador', '8437438', '783837388', 1, 3, '2015-08-15', NULL, 1, NULL);


                                                                                                                                                                                       2522.dat                                                                                            0000600 0004000 0002000 00000000117 12576130370 014247  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_tipoentrada (id, nombre, activo) VALUES (1, 'Compra', true);


                                                                                                                                                                                                                                                                                                                                                                                                                                                 2524.dat                                                                                            0000600 0004000 0002000 00000000257 12576130370 014256  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_tipofactura (id, nombre, activo) VALUES (1, 'Consumidor final', true);
INSERT INTO ctl_tipofactura (id, nombre, activo) VALUES (2, 'Crédito Fiscal', true);


                                                                                                                                                                                                                                                                                                                                                 2526.dat                                                                                            0000600 0004000 0002000 00000000325 12576130370 014254  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_unidad (id, nombre, activo) VALUES (1, 'C/U', true);
INSERT INTO ctl_unidad (id, nombre, activo) VALUES (2, 'Caja', true);
INSERT INTO ctl_unidad (id, nombre, activo) VALUES (3, 'Frasco', true);


                                                                                                                                                                                                                                                                                                           2556.dat                                                                                            0000600 0004000 0002000 00000000116 12576130370 014255  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO ctl_zona (id, nombre, activo) VALUES (1, 'San Salvador', true);


                                                                                                                                                                                                                                                                                                                                                                                                                                                  2528.dat                                                                                            0000600 0004000 0002000 00000002102 12576130370 014251  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO cxc_cobro (fecha, numero_recibo, numero_cheque, id_factura, id_forma_pago, id_banco, id_user_add, id_user_mod, date_add, date_mod, activo, id_empleado, id, monto) VALUES ('2015-08-22', 3, NULL, 16, 1, NULL, 1, NULL, '2015-08-22', NULL, true, 1, 7, 234.00);
INSERT INTO cxc_cobro (fecha, numero_recibo, numero_cheque, id_factura, id_forma_pago, id_banco, id_user_add, id_user_mod, date_add, date_mod, activo, id_empleado, id, monto) VALUES ('2015-08-22', 7, NULL, 17, 1, NULL, 1, 1, '2015-08-22', '2015-09-05', true, 1, 1, 8.00);
INSERT INTO cxc_cobro (fecha, numero_recibo, numero_cheque, id_factura, id_forma_pago, id_banco, id_user_add, id_user_mod, date_add, date_mod, activo, id_empleado, id, monto) VALUES ('2015-08-22', 2, NULL, 17, 1, NULL, 1, 1, '2015-08-22', '2015-09-05', true, 1, 6, 20.00);
INSERT INTO cxc_cobro (fecha, numero_recibo, numero_cheque, id_factura, id_forma_pago, id_banco, id_user_add, id_user_mod, date_add, date_mod, activo, id_empleado, id, monto) VALUES ('2015-09-05', 101, NULL, 17, 1, NULL, 1, 1, '2015-09-05', '2015-09-05', true, 1, 8, 0.25);


                                                                                                                                                                                                                                                                                                                                                                                                                                                              2530.dat                                                                                            0000600 0004000 0002000 00000002743 12576130370 014255  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO fac_factura (id, numero, id_tipofactura, fecha, id_cliente, id_condicionpago, activo, id_user_add, id_user_mod, date_add, date_mod, iva, iva_retenido, subtotal, venta_total, ventas_gravadas, id_empleado, estado, sumas, cobro_total, fecha_pago, id_notaremision, ventas_nosujetas, ventas_exentas, id_formato_documento) VALUES (16, 12, 2, '2015-08-16', 4, 1, true, 1, 1, '2015-08-15', '2015-09-15', 39.26, 0.00, 341.26, 341.26, 0.00, 1, 'PAGADO', 302.00, 1.00, '2015-08-16', 7, NULL, NULL, 1);
INSERT INTO fac_factura (id, numero, id_tipofactura, fecha, id_cliente, id_condicionpago, activo, id_user_add, id_user_mod, date_add, date_mod, iva, iva_retenido, subtotal, venta_total, ventas_gravadas, id_empleado, estado, sumas, cobro_total, fecha_pago, id_notaremision, ventas_nosujetas, ventas_exentas, id_formato_documento) VALUES (14, 1, 1, '2015-08-31', 4, 1, true, 1, 1, '2015-08-09', '2015-09-15', 0.00, 0.00, 0.00, 80.00, 0.00, 1, 'PAGADO', 80.00, 1.00, '2015-08-31', NULL, NULL, NULL, 4);
INSERT INTO fac_factura (id, numero, id_tipofactura, fecha, id_cliente, id_condicionpago, activo, id_user_add, id_user_mod, date_add, date_mod, iva, iva_retenido, subtotal, venta_total, ventas_gravadas, id_empleado, estado, sumas, cobro_total, fecha_pago, id_notaremision, ventas_nosujetas, ventas_exentas, id_formato_documento) VALUES (17, 1, 2, '2015-08-25', 4, 1, true, 1, 1, '2015-08-25', '2015-09-15', 3.25, 0.00, 28.25, 28.25, 0.00, 1, 'PAGADO', 25.00, 28.25, '2015-08-25', NULL, NULL, NULL, 3);


                             2531.dat                                                                                            0000600 0004000 0002000 00000002440 12576130370 014250  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO fac_facturadetalle (id_factura, id_producto, descripcion, cantidad, precio_unitario, ventas_exentas, ventas_gravadas, ventas_nosujetas, id) VALUES (16, 3, NULL, 10.00, 23.00, NULL, 230.00, NULL, 8);
INSERT INTO fac_facturadetalle (id_factura, id_producto, descripcion, cantidad, precio_unitario, ventas_exentas, ventas_gravadas, ventas_nosujetas, id) VALUES (16, 3, NULL, 8.00, 9.00, NULL, 72.00, NULL, 9);
INSERT INTO fac_facturadetalle (id_factura, id_producto, descripcion, cantidad, precio_unitario, ventas_exentas, ventas_gravadas, ventas_nosujetas, id) VALUES (14, 3, 'añldsjfasdf
jjj
lajsdfjañsdjf
asdf
asdfasd
asdfllñajsldfñas', 6.00, 5.00, NULL, 30.00, NULL, 14);
INSERT INTO fac_facturadetalle (id_factura, id_producto, descripcion, cantidad, precio_unitario, ventas_exentas, ventas_gravadas, ventas_nosujetas, id) VALUES (14, 3, 'qwe
asdfajdsñfajsdf
jlajdlfj', 2.00, 25.00, NULL, 50.00, NULL, 10);
INSERT INTO fac_facturadetalle (id_factura, id_producto, descripcion, cantidad, precio_unitario, ventas_exentas, ventas_gravadas, ventas_nosujetas, id) VALUES (17, 3, 'ñasdfjadsjfñasjdfñajsdfñajsdlfjañjdflajsdlfjañljsdfljas ldjfalsjd lfjalsdjflasdf 
añsdjfañjdsfñajsdfñlja a sfasdkjfajdflkajslñdfjasjfñlasdjlfñjasdljfñlasjd', 5.00, 5.00, NULL, 25.00, NULL, 11);


                                                                                                                                                                                                                                2550.dat                                                                                            0000600 0004000 0002000 00000000365 12576130370 014255  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO fac_notaremision (activo, date_add, date_mod, fecha, id_cliente, id_condicionpago, id_user_add, id_user_mod, numero, venta_total, id, estado) VALUES (true, '2015-09-05', NULL, '2015-09-05', 4, 1, 1, NULL, 1, 2.00, 7, 'PENDIENTE');


                                                                                                                                                                                                                                                                           2554.dat                                                                                            0000600 0004000 0002000 00000000217 12576130370 014255  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO fac_notaremisiondetalle (cantidad, id_producto, precio_unitario, total, id, id_notaremision) VALUES (1.00, 3, 2.00, 2.00, 7, 7);


                                                                                                                                                                                                                                                                                                                                                                                 2533.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014242  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2535.dat                                                                                            0000600 0004000 0002000 00000001736 12576130370 014263  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO fos_user_user (id, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, locked, expired, expires_at, confirmation_token, password_requested_at, roles, credentials_expired, credentials_expire_at, created_at, updated_at, date_of_birth, firstname, lastname, website, biography, gender, locale, timezone, phone, facebook_uid, facebook_name, facebook_data, twitter_uid, twitter_name, twitter_data, gplus_uid, gplus_name, gplus_data, token, two_step_code) VALUES (1, 'admin', 'admin', 'jcastillore@yahoo.es', 'jcastillore@yahoo.es', true, 'dtinyfta2y8s0okco0s8o0scskk8wgs', 'gYQy7+BrlCfI1jLLVS7/O83MLU3ytRPKF6nEQplx5DNAEQ11yDLZ/c/GVRhMw4Qd8zHpMeRWa9LEqcUXl69q1Q==', '2015-09-15 17:56:19', false, false, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', false, NULL, '2015-07-28 10:21:20', '2015-09-15 17:56:19', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);


                                  2536.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014245  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2538.dat                                                                                            0000600 0004000 0002000 00000000337 12576130370 014262  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO inv_entrada (id, fecha, id_tipoentrada, id_user_add, id_user_mod, date_add, date_mod, numero, activo, id_proveedor, id_estado) VALUES (6, '2015-08-10', 1, 1, 1, '2015-08-15', '2015-08-19', 23, true, 3, NULL);


                                                                                                                                                                                                                                                                                                 2540.dat                                                                                            0000600 0004000 0002000 00000000323 12576130370 014246  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO inv_entradadetalle (comentario, lote, id_entrada, serie, modelo, id, cantidad, precio_unitario, fecha_vencimiento, id_producto) VALUES (NULL, '89', 6, NULL, NULL, 7, 54.00, 6.00, '2015-08-17', 3);


                                                                                                                                                                                                                                                                                                             2546.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014246  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2548.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014250  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2542.dat                                                                                            0000600 0004000 0002000 00000000002 12576130370 014242  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2559.dat                                                                                            0000600 0004000 0002000 00000000115 12576130370 014257  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO mnt_empleado_zona (id_zona, id_empleado, id) VALUES (1, 1, 1);


                                                                                                                                                                                                                                                                                                                                                                                                                                                   2544.dat                                                                                            0000600 0004000 0002000 00001247512 12576130370 014270  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO vs_database_diagrams (name, diadata, comment, preview, lockinfo, locktime, version) VALUES ('Ninfac', 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPHByb3BlcnRpZXM+Cgk8Q29udHJvbHM+CgkJPE5pbmZhYz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJGRkZGRkYiLz4KCQkJCTxnYW1tYSB2YWx1ZT0iMCIvPgoJCQkJPG5hbWUgdmFsdWU9Ik5pbmZhYyIvPgoJCQkJPHNpemUgdmFsdWU9IjIwNDg7MjA0OCIvPgoJCQkJPHN0eWxlIHZhbHVlPSI0Ii8+CgkJCQk8c3R5bGVfbGlua3MgdmFsdWU9IjAiLz4KCQkJCTx1bml0cyB2YWx1ZT0iNSIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJEaWFncmFtIi8+CgkJPC9OaW5mYWM+CgkJPFRhYmxlPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMTEiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjE0NTsxODMiLz4KCQkJCTxzaXplIHZhbHVlPSIyMTk7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlPgoJCTxUYWJsZTE+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIzNSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjE0NTszMDciLz4KCQkJCTxzaXplIHZhbHVlPSIyMTk7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMT4KCQk8VGFibGUxMD4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjI5Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTEwIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjQ3NTs4MjkiLz4KCQkJCTxzaXplIHZhbHVlPSIyMTk7NjgiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTA+CgkJPFRhYmxlMTE+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSI2Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTExIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjQ3Mzs5NDIiLz4KCQkJCTxzaXplIHZhbHVlPSIyNDk7MzU2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTExPgoJCTxUYWJsZTEyPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMjgiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMTIiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iODE5OzE2OSIvPgoJCQkJPHNpemUgdmFsdWU9IjI4MDsyODQiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTI+CgkJPFRhYmxlMTM+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyNyIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxMyIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSI4NzQ7NDMxIi8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjAwOzQ0OSIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUxMz4KCQk8VGFibGUxND4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjI2Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTE0Ii8+CgkJCQk8cG9zaXRpb24gdmFsdWU9Ijc3OTs4ODUiLz4KCQkJCTxzaXplIHZhbHVlPSIyMzM7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTQ+CgkJPFRhYmxlMTU+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyNSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxNSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSI3Nzk7OTgzIi8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjI0Ozg2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTE1PgoJCTxUYWJsZTE2PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMjQiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMTYiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iODEyOzEwNzQiLz4KCQkJCTxzaXplIHZhbHVlPSIyMTI7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTY+CgkJPFRhYmxlMTc+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyMyIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxNyIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSI4MTc7MTE4NyIvPgoJCQkJPHNpemUgdmFsdWU9IjI3MzszMDIiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTc+CgkJPFRhYmxlMTg+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyMiIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxOCIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMzIwOzEyOSIvPgoJCQkJPHNpemUgdmFsdWU9IjIwMDsyMzAiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTg+CgkJPFRhYmxlMTk+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyMSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUxOSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMjAyOzQxMSIvPgoJCQkJPHNpemUgdmFsdWU9IjI1ODsyMTIiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMTk+CgkJPFRhYmxlMj4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjM0Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTIiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTQ0OzQxMSIvPgoJCQkJPHNpemUgdmFsdWU9IjIxOTs4NiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUyPgoJCTxUYWJsZTIwPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMjAiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjAiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTE0Mzs3NDkiLz4KCQkJCTxzaXplIHZhbHVlPSIxNTc7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMjA+CgkJPFRhYmxlMjE+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxOSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUyMSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMDI0Ozg4NSIvPgoJCQkJPHNpemUgdmFsdWU9IjI0NzsxOTQiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMjE+CgkJPFRhYmxlMjI+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxNyIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUyMiIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMTQzOzExMDAiLz4KCQkJCTxzaXplIHZhbHVlPSIyMDA7MjQ4Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTIyPgoJCTxUYWJsZTIzPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMTgiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjMiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTE0MzsxMzc0Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjQ3OzE0MCIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUyMz4KCQk8VGFibGUyND4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9IjQ4MCIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxMiIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIxIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUyNCIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxNDg5OzQ3OSIvPgoJCQkJPHNpemUgdmFsdWU9IjM2OTsyNiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUyND4KCQk8VGFibGUyNT4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjUiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjUiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTQ5NTs1NDgiLz4KCQkJCTxzaXplIHZhbHVlPSIyMDA7MjQ4Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTI1PgoJCTxUYWJsZTI2PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMTMiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjYiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTE0OzExMDAiLz4KCQkJCTxzaXplIHZhbHVlPSIxNjY7MTIyIi8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTI2PgoJCTxUYWJsZTI3PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMTYiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjciLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTQ5NTs4NDEiLz4KCQkJCTxzaXplIHZhbHVlPSIyNDc7MTQwIi8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTI3PgoJCTxUYWJsZTI4PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iODYiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iOSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUyOCIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMTQ7MTIzNiIvPgoJCQkJPHNpemUgdmFsdWU9IjE2Njs4NiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUyOD4KCQk8VGFibGUyOT4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjgiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMjkiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMjY3OzEzNDAiLz4KCQkJCTxzaXplIHZhbHVlPSIxNjY7MTA0Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTI5PgoJCTxUYWJsZTM+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxNSIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUzIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjExNDs1MTciLz4KCQkJCTxzaXplIHZhbHVlPSIyODA7MzkyIi8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTM+CgkJPFRhYmxlMzA+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSI3Ii8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTMwIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjQ3NTsxMzc0Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMTY2Ozg2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTMwPgoJCTxUYWJsZTMxPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iNCIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUzMSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxNDk1OzEwMTEiLz4KCQkJCTxzaXplIHZhbHVlPSIxNjY7NzE2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTMxPgoJCTxUYWJsZTMyPgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMyIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGUzMiIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxNzAzOzEwMTEiLz4KCQkJCTxzaXplIHZhbHVlPSIxNjY7NjgiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlMzI+CgkJPFRhYmxlMzM+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIyIi8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTMzIi8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjE3Mzk7MTExNyIvPgoJCQkJPHNpemUgdmFsdWU9IjE2Njs2OCIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGUzMz4KCQk8VGFibGUzND4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjEiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlMzQiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iMTc4NjsxMjE0Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMTY2OzY4Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTM0PgoJCTxUYWJsZTQ+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxNCIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGU0Ii8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjExNDs5MTYiLz4KCQkJCTxzaXplIHZhbHVlPSIyMjE7ODYiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlND4KCQk8VGFibGU1PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMzMiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlNSIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSIxMTQ7MTAxMSIvPgoJCQkJPHNpemUgdmFsdWU9IjIxOTs2OCIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGU1PgoJCTxUYWJsZTY+CgkJCTxQYXJlbnQgdmFsdWU9IiNUT1AiLz4KCQkJPFByb3BlcnRpZXM+CgkJCQk8XmNoZWNrcyB2YWx1ZT0iMCIvPgoJCQkJPF5ncm91cCB2YWx1ZT0iLTEiLz4KCQkJCTxeaGVpZ2h0IHZhbHVlPSItMSIvPgoJCQkJPF5pbmRleGVzIHZhbHVlPSIwIi8+CgkJCQk8XmxldmVsIHZhbHVlPSIxMCIvPgoJCQkJPF5saW5rcyB2YWx1ZT0iMCIvPgoJCQkJPF5sb2NrIHZhbHVlPSIwIi8+CgkJCQk8Xm1ldGhvZHMgdmFsdWU9IjAiLz4KCQkJCTxebWluaW1pemVkIHZhbHVlPSIwIi8+CgkJCQk8XnByb3BlcnRpZXMgdmFsdWU9IjAiLz4KCQkJCTxedHJpZ2dlcnMgdmFsdWU9IjAiLz4KCQkJCTxedW5pcXVlcyB2YWx1ZT0iMCIvPgoJCQkJPGJhY2tfY29sb3IgdmFsdWU9IkI0RDY0NzAwIi8+CgkJCQk8bmFtZSB2YWx1ZT0iVGFibGU2Ii8+CgkJCQk8cG9zaXRpb24gdmFsdWU9IjQ3NTsxODMiLz4KCQkJCTxzaXplIHZhbHVlPSIyMzM7MTc2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTY+CgkJPFRhYmxlNz4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjMyIi8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTciLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iNDc1OzM5OSIvPgoJCQkJPHNpemUgdmFsdWU9IjI4MDsxOTQiLz4KCQkJPC9Qcm9wZXJ0aWVzPgoJCQk8VHlwZSB2YWx1ZT0iVGFibGUiLz4KCQk8L1RhYmxlNz4KCQk8VGFibGU4PgoJCQk8UGFyZW50IHZhbHVlPSIjVE9QIi8+CgkJCTxQcm9wZXJ0aWVzPgoJCQkJPF5jaGVja3MgdmFsdWU9IjAiLz4KCQkJCTxeZ3JvdXAgdmFsdWU9Ii0xIi8+CgkJCQk8XmhlaWdodCB2YWx1ZT0iLTEiLz4KCQkJCTxeaW5kZXhlcyB2YWx1ZT0iMCIvPgoJCQkJPF5sZXZlbCB2YWx1ZT0iMzEiLz4KCQkJCTxebGlua3MgdmFsdWU9IjAiLz4KCQkJCTxebG9jayB2YWx1ZT0iMCIvPgoJCQkJPF5tZXRob2RzIHZhbHVlPSIwIi8+CgkJCQk8Xm1pbmltaXplZCB2YWx1ZT0iMCIvPgoJCQkJPF5wcm9wZXJ0aWVzIHZhbHVlPSIwIi8+CgkJCQk8XnRyaWdnZXJzIHZhbHVlPSIwIi8+CgkJCQk8XnVuaXF1ZXMgdmFsdWU9IjAiLz4KCQkJCTxiYWNrX2NvbG9yIHZhbHVlPSJCNEQ2NDcwMCIvPgoJCQkJPG5hbWUgdmFsdWU9IlRhYmxlOCIvPgoJCQkJPHBvc2l0aW9uIHZhbHVlPSI0NzI7NjE4Ii8+CgkJCQk8c2l6ZSB2YWx1ZT0iMjEyOzg2Ii8+CgkJCTwvUHJvcGVydGllcz4KCQkJPFR5cGUgdmFsdWU9IlRhYmxlIi8+CgkJPC9UYWJsZTg+CgkJPFRhYmxlOT4KCQkJPFBhcmVudCB2YWx1ZT0iI1RPUCIvPgoJCQk8UHJvcGVydGllcz4KCQkJCTxeY2hlY2tzIHZhbHVlPSIwIi8+CgkJCQk8Xmdyb3VwIHZhbHVlPSItMSIvPgoJCQkJPF5oZWlnaHQgdmFsdWU9Ii0xIi8+CgkJCQk8XmluZGV4ZXMgdmFsdWU9IjAiLz4KCQkJCTxebGV2ZWwgdmFsdWU9IjMwIi8+CgkJCQk8XmxpbmtzIHZhbHVlPSIwIi8+CgkJCQk8XmxvY2sgdmFsdWU9IjAiLz4KCQkJCTxebWV0aG9kcyB2YWx1ZT0iMCIvPgoJCQkJPF5taW5pbWl6ZWQgdmFsdWU9IjAiLz4KCQkJCTxecHJvcGVydGllcyB2YWx1ZT0iMCIvPgoJCQkJPF50cmlnZ2VycyB2YWx1ZT0iMCIvPgoJCQkJPF51bmlxdWVzIHZhbHVlPSIwIi8+CgkJCQk8YmFja19jb2xvciB2YWx1ZT0iQjRENjQ3MDAiLz4KCQkJCTxuYW1lIHZhbHVlPSJUYWJsZTkiLz4KCQkJCTxwb3NpdGlvbiB2YWx1ZT0iNDcwOzcyMyIvPgoJCQkJPHNpemUgdmFsdWU9IjIxOTs4NiIvPgoJCQk8L1Byb3BlcnRpZXM+CgkJCTxUeXBlIHZhbHVlPSJUYWJsZSIvPgoJCTwvVGFibGU5PgoJPC9Db250cm9scz4KCTxFZGl0b3JzPgoJCTxwdWJsaWM+CgkJCTxlMD4KCQkJCTxkYXRhIHZhbHVlPScmbHQ7P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5nPSJ1dGYtOCI/Jmd0OwombHQ7cHJvcGVydGllcyZndDsKCSZsdDtQYWdlIHZhbHVlPSIxIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uRmllbGQgdmFsdWU9IjI1Ii8mZ3Q7CgkmbHQ7U2VsZWN0aW9uSW5kZXggdmFsdWU9Ii0xIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uVHJpZ2dlciB2YWx1ZT0iLTEiLyZndDsKCSZsdDtTZWxlY3Rpb25UcmlnZ2VyVGFiIHZhbHVlPSIwIi8mZ3Q7CiZsdDsvcHJvcGVydGllcyZndDsKCicvPgoJCQkJPG5hbWUgdmFsdWU9ImNmZ19mb3JtYXRvX2RvY3VtZW50byIvPgoJCQkJPHR5cGUgdmFsdWU9IjI3Ii8+CgkJCTwvZTA+CgkJCTxlMT4KCQkJCTxkYXRhIHZhbHVlPSIiLz4KCQkJCTxuYW1lIHZhbHVlPSJsbmtfY2ZnX3BsYW50aWxsYV9jZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCTx0eXBlIHZhbHVlPSIxNyIvPgoJCQk8L2UxPgoJCQk8ZTI+CgkJCQk8ZGF0YSB2YWx1ZT0nJmx0Oz94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPyZndDsKJmx0O3Byb3BlcnRpZXMmZ3Q7CgkmbHQ7UGFnZSB2YWx1ZT0iNCIvJmd0OwoJJmx0O1NlbGVjdGlvbkZpZWxkIHZhbHVlPSIxIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uSW5kZXggdmFsdWU9Ii0xIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uVHJpZ2dlciB2YWx1ZT0iLTEiLyZndDsKCSZsdDtTZWxlY3Rpb25UcmlnZ2VyVGFiIHZhbHVlPSIwIi8mZ3Q7CiZsdDsvcHJvcGVydGllcyZndDsKCicvPgoJCQkJPG5hbWUgdmFsdWU9ImN0bF9mb250X25hbWUiLz4KCQkJCTx0eXBlIHZhbHVlPSIyNyIvPgoJCQk8L2UyPgoJCQk8ZTM+CgkJCQk8ZGF0YSB2YWx1ZT0nJmx0Oz94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPyZndDsKJmx0O3Byb3BlcnRpZXMmZ3Q7CgkmbHQ7UGFnZSB2YWx1ZT0iNCIvJmd0OwoJJmx0O1NlbGVjdGlvbkZpZWxkIHZhbHVlPSIxIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uSW5kZXggdmFsdWU9Ii0xIi8mZ3Q7CgkmbHQ7U2VsZWN0aW9uVHJpZ2dlciB2YWx1ZT0iLTEiLyZndDsKCSZsdDtTZWxlY3Rpb25UcmlnZ2VyVGFiIHZhbHVlPSIwIi8mZ3Q7CiZsdDsvcHJvcGVydGllcyZndDsKCicvPgoJCQkJPG5hbWUgdmFsdWU9ImN0bF9mb250X3NpemUiLz4KCQkJCTx0eXBlIHZhbHVlPSIyNyIvPgoJCQk8L2UzPgoJCQk8ZTQ+CgkJCQk8ZGF0YSB2YWx1ZT0iIi8+CgkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9mb250X25hbWVfY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQk8dHlwZSB2YWx1ZT0iMTciLz4KCQkJPC9lND4KCQkJPGU1PgoJCQkJPGRhdGEgdmFsdWU9IiIvPgoJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfZm9udF9zaXplX2NmZ19mb3JtYXRvX2RvY3VtZW50byIvPgoJCQkJPHR5cGUgdmFsdWU9IjE3Ii8+CgkJCTwvZTU+CgkJPC9wdWJsaWM+Cgk8L0VkaXRvcnM+Cgk8R1VJPgoJCTxGdWxsVG9vbGJhckxlZnQgdmFsdWU9IjEiLz4KCQk8RnVsbFRvb2xiYXJSaWdodCB2YWx1ZT0iMCIvPgoJCTxQYWdlRWRpdG9yIHZhbHVlPSI1Ii8+CgkJPFBhZ2VFZGl0b3JIIHZhbHVlPSIyODAiLz4KCQk8UGFnZVRvb2xiYXJMZWZ0IHZhbHVlPSIwIi8+CgkJPFBhZ2VUb29sYmFyUkIgdmFsdWU9IjAiLz4KCQk8UGFnZVRvb2xiYXJSaWdodCB2YWx1ZT0iMCIvPgoJCTxQYW5lQ2xpcGJvYXJkIHZhbHVlPSIwIi8+CgkJPFBhbmVMYXlvdXQgdmFsdWU9IjAiLz4KCQk8UGFuZVZpZXcgdmFsdWU9IjAiLz4KCQk8U2Nyb2xsWCB2YWx1ZT0iOTUwIi8+CgkJPFNjcm9sbFkgdmFsdWU9IjEwMjAiLz4KCQk8U2VsZWN0aW9uIHZhbHVlPSJUbWx1Wm1GaiIvPgoJCTxTaG93QWxsIHZhbHVlPSIxIi8+CgkJPFNob3dDaGFuZ2VzIHZhbHVlPSIxIi8+CgkJPFNob3dHTCB2YWx1ZT0iMSIvPgoJCTxTaG93R3JpZCB2YWx1ZT0iMSIvPgoJCTxVc2VHcmlkIHZhbHVlPSIwIi8+Cgk8L0dVST4KCTxNb2RlbD4KCQk8cHVibGljPgoJCQk8bGluaz4KCQkJCTxvMD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZlptOXliV0YwYjE5a2IyTjFiV1Z1ZEc4PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjM3MTQxIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2NmZ19mb3JtYXRvX2RvY3VtZW50b19mYWNfZmFjdHVyYSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjM3MTQxIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jZmdfZm9ybWF0b19kb2N1bWVudG9fZmFjX2ZhY3R1cmEiLz4KCQkJCTwvbzA+CgkJCQk8bzE+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmY0d4aGJuUnBiR3hoIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMzcxODgiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY2ZnX3BsYW50aWxsYV9jZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImNmZ19wbGFudGlsbGEiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMzcxODgiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2NmZ19wbGFudGlsbGFfY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQk8L28xPgoJCQkJPG8xMD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWTI5dVpHbGphVzl1Y0dGbmJ3PT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzUyMyIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfY29uZGljaW9ucGFnb19mYWNfbm90YXJlbWlzaW9uIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfY29uZGljaW9ucGFnbyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzUyMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2NvbmRpY2lvbnBhZ29fZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJPC9vMTA+CgkJCQk8bzExPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9jbGllbnRlIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWkdWd1lYSjBZVzFsYm5SdiIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MjcwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9kZXBhcnRhbWVudG9fY3RsX2NsaWVudGUiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9kZXBhcnRhbWVudG8iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTcyNzAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9kZXBhcnRhbWVudG9fY3RsX2NsaWVudGUiLz4KCQkJCTwvbzExPgoJCQkJPG8xMj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjdGxfbXVuaWNpcGlvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWkdWd1lYSjBZVzFsYm5SdiIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3Mjc1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9kZXBhcnRhbWVudG9fY3RsX211bmljaXBpbyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2RlcGFydGFtZW50byIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzI3NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2RlcGFydGFtZW50b19jdGxfbXVuaWNpcGlvIi8+CgkJCQk8L28xMj4KCQkJCTxvMTM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3hjX2NvYnJvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWlcxd2JHVmhaRzg9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyODAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX2VtcGxlYWRvX2N4Y19jb2JybyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2VtcGxlYWRvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MjgwIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfZW1wbGVhZG9fY3hjX2NvYnJvIi8+CgkJCQk8L28xMz4KCQkJCTxvMTQ+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZaVzF3YkdWaFpHOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzM5OCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfZW1wbGVhZG9fZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9lbXBsZWFkbyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzM5OCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2VtcGxlYWRvX2ZhY19mYWN0dXJhIi8+CgkJCQk8L28xND4KCQkJCTxvMTU+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0ibW50X2VtcGxlYWRvX3pvbmEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZaVzF3YkdWaFpHOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIyNTg2OSIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfZW1wbGVhZG9fTU1fY3RsX3pvbmEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9lbXBsZWFkbyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIyNTg2OSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2VtcGxlYWRvX01NX2N0bF96b25hIi8+CgkJCQk8L28xNT4KCQkJCTxvMTY+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iaW52X2VudHJhZGEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZaWE4wWVdSdiIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTQ2Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9lc3RhZG9faW52X2VudHJhZGEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9lc3RhZG8iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTc1NDYiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9lc3RhZG9faW52X2VudHJhZGEiLz4KCQkJCTwvbzE2PgoJCQkJPG8xNz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZabTl1ZEY5dVlXMWwiLz4KCQkJCQkJPElEIHZhbHVlPSIzNzIzOCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfZm9udF9uYW1lX2NmZ19mb3JtYXRvX2RvY3VtZW50byIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2ZvbnRfbmFtZSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIzNzIzOCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2ZvbnRfbmFtZV9jZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCTwvbzE3PgoJCQkJPG8xOD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZabTl1ZEY5emFYcGwiLz4KCQkJCQkJPElEIHZhbHVlPSIzNzIzMyIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfZm9udF9zaXplX2NmZ19mb3JtYXRvX2RvY3VtZW50byIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2ZvbnRfc2l6ZSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIzNzIzMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2ZvbnRfc2l6ZV9jZmdfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCTwvbzE4PgoJCQkJPG8xOT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjeGNfY29icm8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZabTl5YldGZmNHRm5idz09Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyODUiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX2Zvcm1hX3BhZ29fY3hjX2NvYnJvIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfZm9ybWFwYWdvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3Mjg1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfZm9ybWFfcGFnb19jeGNfY29icm8iLz4KCQkJCTwvbzE5PgoJCQkJPG8yPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9Im1udF9lbXBsZWFkb19NTV9jbGllbnRlIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWTJ4cFpXNTBaUT09Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyNDAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY2xpZW50ZV9NTV9lbXBsZWFkbyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2NsaWVudGUiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTcyNDAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2NsaWVudGVfTU1fZW1wbGVhZG8iLz4KCQkJCTwvbzI+CgkJCQk8bzIwPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9wcm9kdWN0byIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmJXRnlZMkU9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMjU5MzYiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX21hcmNhX2N0bF9wcm9kdWN0byIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX21hcmNhIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjI1OTM2Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfbWFyY2FfY3RsX3Byb2R1Y3RvIi8+CgkJCQk8L28yMD4KCQkJCTxvMjE+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX2NsaWVudGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZiWFZ1YVdOcGNHbHYiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzI5MCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfbXVuaWNpcGlvX2N0bF9jbGllbnRlIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfbXVuaWNpcGlvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MjkwIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfbXVuaWNpcGlvX2N0bF9jbGllbnRlIi8+CgkJCQk8L28yMT4KCQkJCTxvMjI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX3Byb3ZlZWRvciIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmNHRnBjdz09Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyOTUiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX3BhaXNfY3RsX3Byb3ZlZWRvciIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX3BhaXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTcyOTUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9wYWlzX2N0bF9wcm92ZWVkb3IiLz4KCQkJCTwvbzIyPgoJCQkJPG8yMz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZjSEp2WkhWamRHOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzMwMCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfcHJvZHVjdG9fZmFjX2ZhY3R1cmFkZXRhbGxlIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfcHJvZHVjdG8iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczMDAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm9kdWN0b19mYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCTwvbzIzPgoJCQkJPG8yND4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uZGV0YWxsZSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmNISnZaSFZqZEc4PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTI4Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm9kdWN0b19mYWNfbm90YXJlbWlzaW9uZGV0YWxsZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX3Byb2R1Y3RvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3NTI4Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfcHJvZHVjdG9fZmFjX25vdGFyZW1pc2lvbmRldGFsbGUiLz4KCQkJCTwvbzI0PgoJCQkJPG8yNT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfZW50cmFkYWRldGFsbGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZjSEp2WkhWamRHOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIyNTk1OCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfcHJvZHVjdG9faW52X2VudHJhZGFkZXRhbGxlIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfcHJvZHVjdG8iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMjU5NTgiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm9kdWN0b19pbnZfZW50cmFkYWRldGFsbGUiLz4KCQkJCTwvbzI1PgoJCQkJPG8yNj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfbm90YWVudmlvZGV0YWxsZSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmNISnZaSFZqZEc4PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NDM4Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm9kdWN0b19pbnZfbm90YWVudmlvZGV0YWxsZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX3Byb2R1Y3RvIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3NDM4Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfcHJvZHVjdG9faW52X25vdGFlbnZpb2RldGFsbGUiLz4KCQkJCTwvbzI2PgoJCQkJPG8yNz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfZW50cmFkYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmNISnZkbVZsWkc5eSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzA1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm92ZWVkb3JfaW52X2VudHJhZGEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9wcm92ZWVkb3IiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczMDUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9wcm92ZWVkb3JfaW52X2VudHJhZGEiLz4KCQkJCTwvbzI3PgoJCQkJPG8yOD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfZW50cmFkYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRHbHdiMlZ1ZEhKaFpHRT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzMxMCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfdGlwb2VudHJhZGFfaW52X2VudHJhZGEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF90aXBvZW50cmFkYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzMxMCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX3RpcG9lbnRyYWRhX2ludl9lbnRyYWRhIi8+CgkJCQk8L28yOD4KCQkJCTxvMjk+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZkR2x3YjJaaFkzUjFjbUU9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTczMTUiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX3RpcG9mYWN0dXJhX2ZhY19mYWN0dXJhIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfdGlwb2ZhY3R1cmEiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczMTUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF90aXBvZmFjdHVyYV9mYWNfZmFjdHVyYSIvPgoJCQkJPC9vMjk+CgkJCQk8bzM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3hjX2NvYnJvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWW1GdVkyOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzY1NSIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfYmFuY29fY3hjX2NvYnJvIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfYmFuY28iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTc2NTUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9iYW5jb19jeGNfY29icm8iLz4KCQkJCTwvbzM+CgkJCQk8bzMwPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9wcm9kdWN0byIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRXNXBaR0ZrIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTczMjAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX3VuaWRhZF9jdGxfcHJvZHVjdG8iLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF91bmlkYWQiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczMjAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF91bmlkYWRfY3RsX3Byb2R1Y3RvIi8+CgkJCQk8L28zMD4KCQkJCTxvMzE+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX2NsaWVudGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZlbTl1WVE9PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NjAwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF96b25hX2N0bF9jbGllbnRlIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfem9uYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzYwMCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX3pvbmFfY3RsX2NsaWVudGUiLz4KCQkJCTwvbzMxPgoJCQkJPG8zMj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJtbnRfZW1wbGVhZG9fem9uYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmVtOXVZUT09Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMjU4NzQiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX3pvbmFfTU1fY3RsX2VtcGxlYWRvIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfem9uYSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIyNTg3NCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX3pvbmFfTU1fY3RsX2VtcGxlYWRvIi8+CgkJCQk8L28zMj4KCQkJCTxvMzM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0ibW50X2VtcGxlYWRvX01NX2NsaWVudGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZaVzF3YkdWaFpHOD0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzMyNSIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19lbXBsZWFkb19NTV9jbGllbnRlIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfZW1wbGVhZG8iLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczMjUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2VtcGxlYWRvX01NX2NsaWVudGUiLz4KCQkJCTwvbzMzPgoJCQkJPG8zND4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjeGNfY29icm8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZabUZqZEhWeVlRPT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzMzMCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19mYWNfZmFjdHVyYV9jeGNfY29icm8iLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImZhY19mYWN0dXJhIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MzMwIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mYWNfZmFjdHVyYV9jeGNfY29icm8iLz4KCQkJCTwvbzM0PgoJCQkJPG8zNT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZabUZqZEhWeVlRPT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzMzNSIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19mYWNfZmFjdHVyYV9mYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImZhY19mYWN0dXJhIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MzM1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mYWNfZmFjdHVyYV9mYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCTwvbzM1PgoJCQkJPG8zNj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmJtOTBZWEpsYldsemFXOXUiLz4KCQkJCQkJPElEIHZhbHVlPSIzNDIxNCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19mYWNfbm90YXJlbWlzaW9uX2ZhY19mYWN0dXJhIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjM0MjE0Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mYWNfbm90YXJlbWlzaW9uX2ZhY19mYWN0dXJhIi8+CgkJCQk8L28zNj4KCQkJCTxvMzc+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbmRldGFsbGUiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZibTkwWVhKbGJXbHphVzl1Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc1MDMiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfZmFjX25vdGFyZW1pc2lvbl9mYWNfbm90YXJlbWlzaW9uZGV0YWxsZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzUwMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZmFjX25vdGFyZW1pc2lvbl9mYWNfbm90YXJlbWlzaW9uZGV0YWxsZSIvPgoJCQkJPC9vMzc+CgkJCQk8bzM4PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9jbGllbnRlIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmZFhObGNsOWhaR1E9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTczNDAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9jdGxfY2xpZW50ZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzM0MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9jdGxfY2xpZW50ZSIvPgoJCQkJPC9vMzg+CgkJCQk8bzM5PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9jbGllbnRlIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmZFhObGNsOXRiMlE9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTczNDUiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9jdGxfY2xpZW50ZV8xIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MzQ1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N0bF9jbGllbnRlXzEiLz4KCQkJCTwvbzM5PgoJCQkJPG80PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN0bF9lbXBsZWFkbyIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZlkyRnlaMjltZFc1amFXOXVZV3c9Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyNTAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX2NhcmdvZnVuY2lvbmFsX2N0bF9lbXBsZWFkbyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2NhcmdvZnVuY2lvbmFsIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MjUwIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19jdGxfY2FyZ29mdW5jaW9uYWxfY3RsX2VtcGxlYWRvIi8+CgkJCQk8L280PgoJCQkJPG80MD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjdGxfcHJvZHVjdG8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZkWE5sY2w5aFpHUT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzM1MCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N0bF9wcm9kdWN0byIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzM1MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9jdGxfcHJvZHVjdG8iLz4KCQkJCTwvbzQwPgoJCQkJPG80MT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJjdGxfcHJvZHVjdG8iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZkWE5sY2w5dGIyUT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzM1NSIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N0bF9wcm9kdWN0b18xIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MzU1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N0bF9wcm9kdWN0b18xIi8+CgkJCQk8L280MT4KCQkJCTxvNDI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX3Byb3ZlZWRvciIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTYwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfY3RsX3Byb3ZlZWRvciIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzU2MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9jdGxfcHJvdmVlZG9yIi8+CgkJCQk8L280Mj4KCQkJCTxvNDM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX3Byb3ZlZWRvciIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTY1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfY3RsX3Byb3ZlZWRvcl8xIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3NTY1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N0bF9wcm92ZWVkb3JfMSIvPgoJCQkJPC9vNDM+CgkJCQk8bzQ0PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN4Y19jb2JybyIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzYwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfY3hjX2NvYnJvIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3MzYwIi8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2N4Y19jb2JybyIvPgoJCQkJPC9vNDQ+CgkJCQk8bzQ1PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImN4Y19jb2JybyIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzY1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfY3hjX2NvYnJvXzEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImZvc191c2VyX3VzZXIiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczNjUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfY3hjX2NvYnJvXzEiLz4KCQkJCTwvbzQ1PgoJCQkJPG80Nj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzcwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImZvc191c2VyX3VzZXIiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczNzAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfZmFjX2ZhY3R1cmEiLz4KCQkJCTwvbzQ2PgoJCQkJPG80Nz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJmYWNfZmFjdHVyYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3Mzc1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfZmFjX2ZhY3R1cmFfMSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzM3NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9mYWNfZmFjdHVyYV8xIi8+CgkJCQk8L280Nz4KCQkJCTxvNDg+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTEzIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzUxMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9mYWNfbm90YXJlbWlzaW9uIi8+CgkJCQk8L280OD4KCQkJCTxvNDk+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NTE4Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfZmFjX25vdGFyZW1pc2lvbl8xIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3NTE4Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2ZhY19ub3RhcmVtaXNpb25fMSIvPgoJCQkJPC9vNDk+CgkJCQk8bzU+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iY3RsX3Byb2R1Y3RvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWTJGMFpXZHZjbWxoIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcyNTUiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX2NhdGVnb3JpYV9jdGxfcHJvZHVjdG8iLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImN0bF9jYXRlZ29yaWEiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTcyNTUiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9jYXRlZ29yaWFfY3RsX3Byb2R1Y3RvIi8+CgkJCQk8L281PgoJCQkJPG81MD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfZW50cmFkYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzgwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfaW52X2VudHJhZGEiLz4KCQkJCQkJPE9uX0RlbGV0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8T25fVXBkYXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxQYXJlbnRfVGFibGUgdmFsdWU9ImZvc191c2VyX3VzZXIiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczODAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfaW52X2VudHJhZGEiLz4KCQkJCTwvbzUwPgoJCQkJPG81MT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfZW50cmFkYSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3Mzg1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfaW52X2VudHJhZGFfMSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzM4NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9pbnZfZW50cmFkYV8xIi8+CgkJCQk8L281MT4KCQkJCTxvNTI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iaW52X25vdGFlbnZpbyIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDloWkdRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NDUyIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfaW52X25vdGFlbnZpbyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzQ1MiIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfZm9zX3VzZXJfdXNlcl9pbnZfbm90YWVudmlvIi8+CgkJCQk8L281Mj4KCQkJCTxvNTM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iaW52X25vdGFlbnZpbyIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZmRYTmxjbDl0YjJRPSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NDU3Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2Zvc191c2VyX3VzZXJfaW52X25vdGFlbnZpb18xIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJmb3NfdXNlcl91c2VyIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8aWQgdmFsdWU9IjE3NDU3Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imxua19mb3NfdXNlcl91c2VyX2ludl9ub3RhZW52aW9fMSIvPgoJCQkJPC9vNTM+CgkJCQk8bzU0PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9Imludl9lbnRyYWRhZGV0YWxsZSIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGb3JlaWduX0tleSB2YWx1ZT0iYVdSZlpXNTBjbUZrWVE9PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MzkwIi8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2ludl9lbnRyYWRhX2ludl9lbnRyYWRhZGV0YWxsZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iaW52X2VudHJhZGEiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTczOTAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2ludl9lbnRyYWRhX2ludl9lbnRyYWRhZGV0YWxsZSIvPgoJCQkJPC9vNTQ+CgkJCQk8bzU1PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9Imludl9ub3RhZW52aW9kZXRhbGxlIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmYm05MFlXVnVkbWx2Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc0MzAiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfaW52X25vdGFlbnZpb19pbnZfbm90YWVudmlvZGV0YWxsZSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iaW52X25vdGFlbnZpbyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzQzMCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfaW52X25vdGFlbnZpb19pbnZfbm90YWVudmlvZGV0YWxsZSIvPgoJCQkJPC9vNTU+CgkJCQk8bzY+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZZMnhwWlc1MFpRPT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzI2MCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfY2xpZW50ZV9mYWNfZmFjdHVyYSIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2NsaWVudGUiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTcyNjAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9jbGllbnRlX2ZhY19mYWN0dXJhIi8+CgkJCQk8L282PgoJCQkJPG83PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENhcmRpbmFsaXR5IHZhbHVlPSJPTkUgdG8gTUFOWSIvPgoJCQkJCQk8Q2hpbGRfVGFibGUgdmFsdWU9ImZhY19ub3RhcmVtaXNpb24iLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZZMnhwWlc1MFpRPT0iLz4KCQkJCQkJPElEIHZhbHVlPSIxNzUwOCIvPgoJCQkJCQk8TWF0Y2hfVHlwZXMgdmFsdWU9IkZVTEwiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imxua19jdGxfY2xpZW50ZV9mYWNfbm90YXJlbWlzaW9uIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfY2xpZW50ZSIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzUwOCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2NsaWVudGVfZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJPC9vNz4KCQkJCTxvOD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDYXJkaW5hbGl0eSB2YWx1ZT0iT05FIHRvIE1BTlkiLz4KCQkJCQkJPENoaWxkX1RhYmxlIHZhbHVlPSJpbnZfbm90YWVudmlvIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZvcmVpZ25fS2V5IHZhbHVlPSJhV1JmWTJ4cFpXNTBaUT09Ii8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc0NDMiLz4KCQkJCQkJPE1hdGNoX1R5cGVzIHZhbHVlPSJGVUxMIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJsbmtfY3RsX2NsaWVudGVfaW52X25vdGFlbnZpbyIvPgoJCQkJCQk8T25fRGVsZXRlIHZhbHVlPSJDYXNjYWRlIi8+CgkJCQkJCTxPbl9VcGRhdGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPFBhcmVudF9UYWJsZSB2YWx1ZT0iY3RsX2NsaWVudGUiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxpZCB2YWx1ZT0iMTc0NDMiLz4KCQkJCQk8bmFtZSB2YWx1ZT0ibG5rX2N0bF9jbGllbnRlX2ludl9ub3RhZW52aW8iLz4KCQkJCTwvbzg+CgkJCQk8bzk+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2FyZGluYWxpdHkgdmFsdWU9Ik9ORSB0byBNQU5ZIi8+CgkJCQkJCTxDaGlsZF9UYWJsZSB2YWx1ZT0iZmFjX2ZhY3R1cmEiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8Rm9yZWlnbl9LZXkgdmFsdWU9ImFXUmZZMjl1WkdsamFXOXVjR0ZuYnc9PSIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MjY1Ii8+CgkJCQkJCTxNYXRjaF9UeXBlcyB2YWx1ZT0iRlVMTCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibG5rX2N0bF9jb25kaWNpb25wYWdvX2ZhY19mYWN0dXJhIi8+CgkJCQkJCTxPbl9EZWxldGUgdmFsdWU9IkNhc2NhZGUiLz4KCQkJCQkJPE9uX1VwZGF0ZSB2YWx1ZT0iQ2FzY2FkZSIvPgoJCQkJCQk8UGFyZW50X1RhYmxlIHZhbHVlPSJjdGxfY29uZGljaW9ucGFnbyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGlkIHZhbHVlPSIxNzI2NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJsbmtfY3RsX2NvbmRpY2lvbnBhZ29fZmFjX2ZhY3R1cmEiLz4KCQkJCTwvbzk+CgkJCTwvbGluaz4KCQkJPHRhYmxlPgoJCQkJPG8wPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSJFbXByZXNhIHByb3BpZXRhcmlhIGRlIGxvcyBkYXRvcywgcGFyYSBlbmNhYmV6YWRvcyBkZSByZXBvcnRlcyIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjkiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5NjAiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjZmdfZW1wcmVzYSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImN0bF9lbXByZXNhX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlNyIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJlc3RhZG8gZGVsIHJlZ2lzdHJvIHRydWU9YWN0aXZvOyBmYWxzZT1pbmFjdGl2byIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkRpcmVjY2lvbiBkZWwgbmVnb2NpbyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRpcmVjY2lvbiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJkaXJlY2Npb24iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJHaXJvIGRlIGxhIGVtcHJlc2EsIHNlZ8O6biBuYXR1cmFsaXphIGRlbCBuZWdvY2lvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZ2lybyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJnaXJvIi8+CgkJCQkJCTwvbzI+CgkJCQkJCTxvMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX2VtcHJlc2FfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTml0IGRlIGxhIGVtcHJlc2EiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5pdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJuaXQiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOb21icmUgZGUgbGEgZW1wcmVzYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOb21icmUgY29tZXJjaWFsIGRlIGxhIGVtcHJlc2EiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJub21icmVfY29tZXJjaWFsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZV9jb21lcmNpYWwiLz4KCQkJCQkJPC9vNj4KCQkJCQkJPG83PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOdW1lcm8gZGUgcmVnaXN0cm8gZGUgY29udHJpYnV5ZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnJjIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5yYyIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IlRlbGVmb25vcyBwdWVkZSBzZXIgbWFzIGRlIHVubyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idGVsZWZvbm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idGVsZWZvbm8iLz4KCQkJCQkJPC9vOD4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5NjAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY2ZnX2VtcHJlc2EiLz4KCQkJCTwvbzA+CgkJCQk8bzE+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjM4Ii8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjI2MDMxIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TGlua19Db3VudCB2YWx1ZT0iNCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvX3BrZXkiLz4KCQkJCQkJPFJlY29yZF9Db3VudCB2YWx1ZT0iNCIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUzMSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IicxJzo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkZXRhbGxlX2ludGVybGluZWFkbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJkZXRhbGxlX2ludGVybGluZWFkbyIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRldGFsbGVfbnVtZXJvX2l0ZW1zIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGV0YWxsZV9udW1lcm9faXRlbXMiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8xMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGExX2NvbDIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTFfY29sMiIvPgoJCQkJCQk8L28xMD4KCQkJCQkJPG8xMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGEyX2NvbDEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTJfY29sMSIvPgoJCQkJCQk8L28xMT4KCQkJCQkJPG8xMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGEyX2NvbDIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTJfY29sMiIvPgoJCQkJCQk8L28xMj4KCQkJCQkJPG8xMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGEzX2NvbDEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTNfY29sMSIvPgoJCQkJCQk8L28xMz4KCQkJCQkJPG8xND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmaWxhM19jb2wyIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZpbGEzX2NvbDIiLz4KCQkJCQkJPC9vMTQ+CgkJCQkJCTxvMTU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmlsYTRfY29sMSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmaWxhNF9jb2wxIi8+CgkJCQkJCTwvbzE1PgoJCQkJCQk8bzE2PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGE0X2NvbDIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTRfY29sMiIvPgoJCQkJCQk8L28xNj4KCQkJCQkJPG8xNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmaWxhNV9jb2wxIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZpbGE1X2NvbDEiLz4KCQkJCQkJPC9vMTc+CgkJCQkJCTxvMTg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmlsYTVfY29sMiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmaWxhNV9jb2wyIi8+CgkJCQkJCTwvbzE4PgoJCQkJCQk8bzE5PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGE2X2NvbDEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTZfY29sMSIvPgoJCQkJCQk8L28xOT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDEiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8yMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmaWxhNl9jb2wyIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZpbGE2X2NvbDIiLz4KCQkJCQkJPC9vMjA+CgkJCQkJCTxvMjE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmlsYTdfY29sMSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmaWxhN19jb2wxIi8+CgkJCQkJCTwvbzIxPgoJCQkJCQk8bzIyPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpbGE3X2NvbDIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmlsYTdfY29sMiIvPgoJCQkJCQk8L28yMj4KCQkJCQkJPG8yMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMjM+CgkJCQkJCTxvMjQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2ZvbnRfbmFtZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2ZvbnRfbmFtZSIvPgoJCQkJCQk8L28yND4KCQkJCQkJPG8yNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjM5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfZm9udF9zaXplIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZm9udF9zaXplIi8+CgkJCQkJCTwvbzI1PgoJCQkJCQk8bzI2PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9wbGFudGlsbGEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9wbGFudGlsbGEiLz4KCQkJCQkJPC9vMjY+CgkJCQkJCTxvMjc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaW50ZXJsaW5lYWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImludGVybGluZWFkbyIvPgoJCQkJCQk8L28yNz4KCQkJCQkJPG8yOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJtYXJnZW5fZGVyZWNobyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJtYXJnZW5fZGVyZWNobyIvPgoJCQkJCQk8L28yOD4KCQkJCQkJPG8yOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJtYXJnZW5faW5mZXJpb3IiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibWFyZ2VuX2luZmVyaW9yIi8+CgkJCQkJCTwvbzI5PgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDIiLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG8zMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJtYXJnZW5faXpxdWllcmRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im1hcmdlbl9penF1aWVyZG8iLz4KCQkJCQkJPC9vMzA+CgkJCQkJCTxvMzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibWFyZ2VuX3N1cGVyaW9yIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im1hcmdlbl9zdXBlcmlvciIvPgoJCQkJCQk8L28zMT4KCQkJCQkJPG8zMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTm9tYnJlIGRlbCBkb2N1bWVudG8gYSBjb25maWd1cmFyIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMzI+CgkJCQkJCTxvMzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBhcGVsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBhcGVsIi8+CgkJCQkJCTwvbzMzPgoJCQkJCQk8bzM0PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjM2Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBpZV9pbnRlcmxpbmVhZG8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icGllX2ludGVybGluZWFkbyIvPgoJCQkJCQk8L28zND4KCQkJCQkJPG8zNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJwaWVfeF9jb2wxIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBpZV94X2NvbDEiLz4KCQkJCQkJPC9vMzU+CgkJCQkJCTxvMzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icGllX3hfY29sMiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJwaWVfeF9jb2wyIi8+CgkJCQkJCTwvbzM2PgoJCQkJCQk8bzM3PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBpZV95Ii8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBpZV95Ii8+CgkJCQkJCTwvbzM3PgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDMiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRldGFsbGVfeF9jb2w0Ii8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRldGFsbGVfeF9jb2w0Ii8+CgkJCQkJCTwvbzU+CgkJCQkJCTxvNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkZXRhbGxlX3hfY29sNSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJkZXRhbGxlX3hfY29sNSIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDYiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGV0YWxsZV94X2NvbDYiLz4KCQkJCQkJPC9vNz4KCQkJCQkJPG84PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGV0YWxsZV95Ii8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRldGFsbGVfeSIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmaWxhMV9jb2wxIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZpbGExX2NvbDEiLz4KCQkJCQkJPC9vOT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMjYwMzEiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY2ZnX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQk8L28xPgoJCQkJPG8xMD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iNCIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzQ4NCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9lc3RhZG8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfZXN0YWRvX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjEiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMjYiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iUTI5dGJXVnVkQT09Ii8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkFicmV2aWF0dXJhIG8gbm9tYnJlIGRlbCBlc3RhZG8gZGVsIHByb2Nlc28iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFicmV2aWF0dXJhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFicmV2aWF0dXJhIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGVzY3JpcGNpb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGVzY3JpcGNpb24iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfZXN0YWRvX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28zPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzQ4NCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfZXN0YWRvIi8+CgkJCQkJPHVuaXF1ZT4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxGaWVsZHMgdmFsdWU9IllXSnlaWFpwWVhSMWNtRT0iLz4KCQkJCQkJCQk8SUQgdmFsdWU9IjI2MDE0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InVuaXF1ZV9hYnJldmlhdHVyYSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPGlkIHZhbHVlPSIyNjAxNCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InVuaXF1ZV9hYnJldmlhdHVyYSIvPgoJCQkJCQk8L28wPgoJCQkJCTwvdW5pcXVlPgoJCQkJPC9vMTA+CgkJCQk8bzExPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIyIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjM3MTk5Ii8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TGlua19Db3VudCB2YWx1ZT0iMSIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX2ZvbnRfbmFtZSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImN0bF9mb250X25hbWVfcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTMzIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfZm9udF9uYW1lX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNTAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28xPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIzNzE5OSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfZm9udF9uYW1lIi8+CgkJCQk8L28xMT4KCQkJCTxvMTI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjIiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMzcyMDciLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxMaW5rX0NvdW50IHZhbHVlPSIxIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfZm9udF9zaXplIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3RsX2ZvbnRfc2l6ZV9wa2V5Ii8+CgkJCQkJCTxSZWNvcmRfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMzQiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9mb250X3NpemVfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InNpemUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ic2l6ZSIvPgoJCQkJCQk8L28xPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIzNzIwNyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfZm9udF9zaXplIi8+CgkJCQk8L28xMj4KCQkJCTxvMTM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5NjUiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfZm9ybWFwYWdvIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3RsX2Zvcm1hX3BhZ29fcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGU4Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9mb3JtYV9wYWdvX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNjk2NSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfZm9ybWFwYWdvIi8+CgkJCQk8L28xMz4KCQkJCTxvMTQ+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMjU5MjUiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfbWFyY2EiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfbWFyY2FfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUzMCIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfbWFyY2FfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIyNTkyNSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfbWFyY2EiLz4KCQkJCTwvbzE0PgoJCQkJPG8xNT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQWxtYWNlbmEgbXVuaWNpcGlvcyBwb3IgZGVwYXJ0YW1lbnRvIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMyIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNjk3MCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9tdW5pY2lwaW8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfbXVuaWNpcGlvX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlOSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX211bmljaXBpb19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2RlcGFydGFtZW50byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2RlcGFydGFtZW50byIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMj4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5NzAiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY3RsX211bmljaXBpbyIvPgoJCQkJPC9vMTU+CgkJCQk8bzE2PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIyIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE2OTc1Ii8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX3BhaXMiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfcGFpc19wa2V5Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTEwIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfcGFpc19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCTwvbzE+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE2OTc1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImN0bF9wYWlzIi8+CgkJCQk8L28xNj4KCQkJCTxvMTc+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjE4Ii8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE2OTgwIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX3Byb2R1Y3RvIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3RsX3Byb2R1Y3RvX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMTEiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNvZGlnbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjb2RpZ28iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8xMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdW5pZGFkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdW5pZGFkIi8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzExPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9hZGQiLz4KCQkJCQkJPC9vMTE+CgkJCQkJCTxvMTI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF91c2VyX21vZCIvPgoJCQkJCQk8L28xMj4KCQkJCQkJPG8xMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28xMz4KCQkJCQkJPG8xND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icHJlY2lvX2Nvc3RvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJwcmVjaW9fY29zdG8iLz4KCQkJCQkJPC9vMTQ+CgkJCQkJCTxvMTU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InByZWNpb192ZW50YSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icHJlY2lvX3ZlbnRhIi8+CgkJCQkJCTwvbzE1PgoJCQkJCQk8bzE2PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJwcmVzZW50YWNpb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icHJlc2VudGFjaW9uIi8+CgkJCQkJCTwvbzE2PgoJCQkJCQk8bzE3PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJyZXNlcnZhZG8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InJlc2VydmFkbyIvPgoJCQkJCQk8L28xNz4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9hZGQiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJleGlzdGVuY2lhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJleGlzdGVuY2lhIi8+CgkJCQkJCTwvbzQ+CgkJCQkJCTxvNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZXhpc3RlbmNpYV9tYXhpbWEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImV4aXN0ZW5jaWFfbWF4aW1hIi8+CgkJCQkJCTwvbzU+CgkJCQkJCTxvNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZXhpc3RlbmNpYV9taW5pbWEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImV4aXN0ZW5jaWFfbWluaW1hIi8+CgkJCQkJCTwvbzY+CgkJCQkJCTxvNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX3Byb2R1Y3RvX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfY2F0ZWdvcmlhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfY2F0ZWdvcmlhIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfbWFyY2EiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9tYXJjYSIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNjk4MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfcHJvZHVjdG8iLz4KCQkJCTwvbzE3PgoJCQkJPG8xOD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2F0YWxvZ28gZGUgcHJvdmVlZG9yZXMiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxNCIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNjk4OCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9wcm92ZWVkb3IiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfcHJvdmVlZG9yX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMTIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iZXN0YWRvIGRlbCByZWdpc3RybyB0cnVlPWFjdGl2bzsgZmFsc2U9aW5hY3Rpdm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkZlY2hhIGRlIGNyZWFjaW9uIGRlbCByZWdpc3RybyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMTA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9Ik5vbWJyZSBkZSBsYSBlbXByZXNhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28xMD4KCQkJCQkJPG8xMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTm9tYnJlIGNvbWVyY2lhbCBkZSBsYSBlbXByZXNhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlX2NvbWVyY2lhbCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmVfY29tZXJjaWFsIi8+CgkJCQkJCTwvbzExPgoJCQkJCQk8bzEyPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOdW1lcm8gZGUgcmVnaXN0cm8gZGUgY29udHJpYnV5ZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnJjIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5yYyIvPgoJCQkJCQk8L28xMj4KCQkJCQkJPG8xMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iVGVsZWZvbm9zIHB1ZWRlIHNlciBtYXMgZGUgdW5vIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idGVsZWZvbm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idGVsZWZvbm8iLz4KCQkJCQkJPC9vMTM+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJGZWNoYSBkZSBtb2RpZmljYWNpb24gZGVsIHJlZ2lzdHJvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJEaXJlY2Npb24gZGVsIG5lZ29jaW8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkaXJlY2Npb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGlyZWNjaW9uIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZW1haWwiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZW1haWwiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfcHJvdmVlZG9yX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9wYWlzIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfcGFpcyIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9hZGQiLz4KCQkJCQkJPC9vNz4KCQkJCQkJPG84PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF91c2VyX21vZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3VzZXJfbW9kIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTml0IGRlIGxhIGVtcHJlc2EiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5pdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJuaXQiLz4KCQkJCQkJPC9vOT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5ODgiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY3RsX3Byb3ZlZWRvciIvPgoJCQkJPC9vMTg+CgkJCQk8bzE5PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIzIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE2OTkzIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX3RpcG9lbnRyYWRhIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3RsX3RpcG9lbnRyYWRhX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMTQiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX3RpcG9lbnRyYWRhX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNjk5MyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfdGlwb2VudHJhZGEiLz4KCQkJCTwvbzE5PgoJCQkJPG8yPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIyIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjM3MTc5Ii8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TGlua19Db3VudCB2YWx1ZT0iMSIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY2ZnX3BsYW50aWxsYSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImNmZ19wbGFudGlsbGFfcGtleSIvPgoJCQkJCQk8UmVjb3JkX0NvdW50IHZhbHVlPSI0Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTMyIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjZmdfcGxhbnRpbGxhX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMzcxNzkiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY2ZnX3BsYW50aWxsYSIvPgoJCQkJPC9vMj4KCQkJCTxvMjA+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5OTgiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfdGlwb2ZhY3R1cmEiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfdGlwb2ZhY3R1cmFfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxNSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfdGlwb2ZhY3R1cmFfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCTwvbzI+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE2OTk4Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImN0bF90aXBvZmFjdHVyYSIvPgoJCQkJPC9vMjA+CgkJCQk8bzIxPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIzIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3MDAzIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX3VuaWRhZCIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImN0bF91bmlkYWRfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxNiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfdW5pZGFkX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzAwMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfdW5pZGFkIi8+CgkJCQk8L28yMT4KCQkJCTxvMjI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc1NzciLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfem9uYSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImN0bF96b25hX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMjgiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX3pvbmFfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzU3NyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfem9uYSIvPgoJCQkJPC9vMjI+CgkJCQk8bzIzPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxNCIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzAwOCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN4Y19jb2JybyIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImN4Y19jb2Jyb19wa2V5Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIxIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTE3Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9hZGQiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8xMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjgiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF91c2VyX21vZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3VzZXJfbW9kIi8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzExPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJtb250byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibW9udG8iLz4KCQkJCQkJPC9vMTE+CgkJCQkJCTxvMTI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnVtZXJvX2NoZXF1ZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJudW1lcm9fY2hlcXVlIi8+CgkJCQkJCTwvbzEyPgoJCQkJCQk8bzEzPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im51bWVyb19yZWNpYm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJudW1lcm9fcmVjaWJvIi8+CgkJCQkJCTwvbzEzPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZlY2hhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmVjaGEiLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjeGNfY29icm9faWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfYmFuY28iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9iYW5jbyIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2VtcGxlYWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZW1wbGVhZG8iLz4KCQkJCQkJPC9vNj4KCQkJCQkJPG83PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2ZhY3R1cmEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9mYWN0dXJhIi8+CgkJCQkJCTwvbzc+CgkJCQkJCTxvOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9mb3JtYV9wYWdvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZm9ybWFfcGFnbyIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdXNlcl9hZGQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF91c2VyX2FkZCIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzAwOCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjeGNfY29icm8iLz4KCQkJCQk8dW5pcXVlPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPEZpZWxkcyB2YWx1ZT0iYm5WdFpYSnZYM0psWTJsaWJ3PT0gWm1WamFHRT0iLz4KCQkJCQkJCQk8SUQgdmFsdWU9IjI1OTg2Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InVrX251bWVyb19mZWNoYSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPGlkIHZhbHVlPSIyNTk4NiIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InVrX251bWVyb19mZWNoYSIvPgoJCQkJCQk8L28wPgoJCQkJCTwvdW5pcXVlPgoJCQkJPC9vMjM+CgkJCQk8bzI0PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIyNSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzAxNiIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImZhY19mYWN0dXJhIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iZmFjX2ZhY3R1cmFfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMSIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxMyIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJjYW1wbyBwYXJhIGRldGVybWluYXIgc2kgZWwgcmVnaXN0cm8gZXN0YSBhY3Rpdm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjgiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkFsbWFjZW5hIGVsIGNvYnJvIHRvdGFsIHBhcmEgbGFzIGZhY3R1cmFzIGEgY3JlZGl0byB5IHF1ZSBzb24gY2FuY2VsYWRhcyBhIHRyYXZlcyBjdWVudGFzIHBvciBjb2JyYXIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY29icm9fdG90YWwiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvYnJvX3RvdGFsIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMTA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2VtcGxlYWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZW1wbGVhZG8iLz4KCQkJCQkJPC9vMTA+CgkJCQkJCTxvMTE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2Zvcm1hdG9fZG9jdW1lbnRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZm9ybWF0b19kb2N1bWVudG8iLz4KCQkJCQkJPC9vMTE+CgkJCQkJCTxvMTI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX25vdGFyZW1pc2lvbiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8L28xMj4KCQkJCQkJPG8xMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJmayAtIHBhcmEgZWwgdGlwbyBkZSBmYWN0dXJhIChjb25zdW1pZG9yIGZpbmFsIG8gQ0NGKSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3RpcG9mYWN0dXJhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdGlwb2ZhY3R1cmEiLz4KCQkJCQkJPC9vMTM+CgkJCQkJCTxvMTQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iZmsgLSBwYXJhIHNhYmVyIGVsIHVzdWFyaW8gcXVlIGNyZW8gZWwgcmVnaXN0cm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjkiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF91c2VyX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCTwvbzE0PgoJCQkJCQk8bzE1PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9ImZrIC0gcGFyYSBzYWJlciBlbCB1c3VhcmlvIHF1ZSBtb2RpZmljw7MgZWwgcmVnaXN0cm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF91c2VyX21vZCIvPgoJCQkJCQk8L28xNT4KCQkJCQkJPG8xNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJhbG1hY2VuYSBlbCBjYWxjdWxvIGRlbCBJVkEgYWN0dWFsIHNlZ8O6biBjb25maWd1YXJjacOzbiAoMC4xMykgZW4gYmFzZSBhIGxhIHN1bWEgZGUgbGFzIHZlbnRhcyBncmF2YWRhcyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpdmEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Iml2YSIvPgoJCQkJCQk8L28xNj4KCQkJCQkJPG8xNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaXZhX3JldGVuaWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpdmFfcmV0ZW5pZG8iLz4KCQkJCQkJPC9vMTc+CgkJCQkJCTxvMTg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2FtcG8gcGFyYSBlbCBudW1lcm8gZGUgZmFjdHVyYSBvIENDRiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im51bWVybyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im51bWVybyIvPgoJCQkJCQk8L28xOD4KCQkJCQkJPG8xOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ic3VidG90YWwiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InN1YnRvdGFsIi8+CgkJCQkJCTwvbzE5PgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9hZGQiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8yMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJjYW1wbyBwYXJhIGFsbWFjZW5hciBsYSBzdW1hdG9yaWEgZGUgbGFzIHZlbnRhcyBncmF2YWRhcyBkZSB0b2RvcyBsb3MgSVRFTVMgZGUgbGEgZmFjdHVyYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjAiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJzdW1hcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ic3VtYXMiLz4KCQkJCQkJPC9vMjA+CgkJCQkJCTxvMjE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InZlbnRhX3RvdGFsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ2ZW50YV90b3RhbCIvPgoJCQkJCQk8L28yMT4KCQkJCQkJPG8yMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idmVudGFzX2V4ZW50YXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InZlbnRhc19leGVudGFzIi8+CgkJCQkJCTwvbzIyPgoJCQkJCQk8bzIzPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ2ZW50YXNfZ3JhdmFkYXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InZlbnRhc19ncmF2YWRhcyIvPgoJCQkJCQk8L28yMz4KCQkJCQkJPG8yND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idmVudGFzX25vc3VqZXRhcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idmVudGFzX25vc3VqZXRhcyIvPgoJCQkJCQk8L28yND4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX21vZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZXN0YWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImVzdGFkbyIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iY2FtcG8gcGFyYSBhbG1hY2VuYXIgZmVjaGEgZGUgbGEgZmFjdHVyYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZlY2hhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmVjaGEiLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkZlY2hhIGVuIHF1ZSBsYSBmYWN0dXJhIGVzIHBhZ2FkYSBlbiBjYXNvIGRlIGNvbnRhZG8gZXMgZWwgbWlzbW8gZGlhIGRlIGxhIGZhY3R1cmEgeSBkZSBjcmVkaXRvIGVuIGJhc2UgYSBsbyBhY29yZGFkbyBjb24gY2xpZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmZWNoYV9wYWdvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmVjaGFfcGFnbyIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2ZhY19mYWN0dXJhX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iZmsgLSBjbGllbnRlIGEgcXVpZW4gc2UgbGUgZmFjdHVybyBlbCBwcm9kdWN0byIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2NsaWVudGUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9jbGllbnRlIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJmayAtIHBhcmEgYWxtYWNlbmFyIGNvbmRpY2lvbiBkZSBwYWdvLCBjcmVkaXRvIG8gY29udGFkbyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2NvbmRpY2lvbnBhZ28iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9jb25kaWNpb25wYWdvIi8+CgkJCQkJCTwvbzk+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE3MDE2Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImZhY19mYWN0dXJhIi8+CgkJCQkJPHVuaXF1ZT4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxGaWVsZHMgdmFsdWU9ImJuVnRaWEp2IGFXUmZkR2x3YjJaaFkzUjFjbUU9IFlXTjBhWFp2Ii8+CgkJCQkJCQkJPElEIHZhbHVlPSIyNjAxMiIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ1a190aXBvZmFjdHVyYV9udW1lcm8iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxpZCB2YWx1ZT0iMjYwMTIiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ1a190aXBvZmFjdHVyYV9udW1lcm8iLz4KCQkJCQkJPC9vMD4KCQkJCQk8L3VuaXF1ZT4KCQkJCTwvbzI0PgoJCQkJPG8yNT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iOSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzAxOSIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPExpbmtfQ291bnQgdmFsdWU9IjIiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImZhY19mYWN0dXJhZGV0YWxsZSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImZhY19mYWN0dXJhZGV0YWxsZV9wa2V5Ii8+CgkJCQkJCTxSZWNvcmRfQ291bnQgdmFsdWU9IjUiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMjEiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY2FudGlkYWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNhbnRpZGFkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyMDQ0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRlc2NyaXBjaW9uIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRlc2NyaXBjaW9uIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnZmFjX2ZhY3R1cmFkZXRhbGxlX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2ZhY3R1cmEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9mYWN0dXJhIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9wcm9kdWN0byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3Byb2R1Y3RvIi8+CgkJCQkJCTwvbzQ+CgkJCQkJCTxvNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJwcmVjaW9fdW5pdGFyaW8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InByZWNpb191bml0YXJpbyIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idmVudGFzX2V4ZW50YXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InZlbnRhc19leGVudGFzIi8+CgkJCQkJCTwvbzY+CgkJCQkJCTxvNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjgiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ2ZW50YXNfZ3JhdmFkYXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InZlbnRhc19ncmF2YWRhcyIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idmVudGFzX25vc3VqZXRhcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idmVudGFzX25vc3VqZXRhcyIvPgoJCQkJCQk8L284PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzAxOSIvPgoJCQkJCTxuYW1lIHZhbHVlPSJmYWNfZmFjdHVyYWRldGFsbGUiLz4KCQkJCTwvbzI1PgoJCQkJPG8yNj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMTIiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc0NzQiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbl9wa2V5Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTI1Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9ImRldGVybWluYSBzaSBlbCByZWdpc3RybyBlc3RhIGFjdGl2byIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iZmVjaGEgcXVlIHNlIGNyZW8gZWwgcmVnaXN0cm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMTA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0ibnVtZXJvIGRlIGRvY3VtZW50byBkZSByZW1pc2lvbiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJudW1lcm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJudW1lcm8iLz4KCQkJCQkJPC9vMTA+CgkJCQkJCTxvMTE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iY2FtcG8gcGFyYSBhbG1hY2VuYXIgbGEgc3VtYXRvcmlhIGRlbCB0b3RhbCBkZSBsb3MgaXRlbSBkZWwgZGV0YWxsZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ2ZW50YV90b3RhbCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idmVudGFfdG90YWwiLz4KCQkJCQkJPC9vMTE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJ1bHRpbWEgZmVjaGEgcXVlIHNlIG1vZGlmaWNvIGVsIHJlZ2lzdHJvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJkYXRlX21vZCIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImVzdGFkbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJlc3RhZG8iLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9ImZlY2hhIGRlbCBkb2N1bWVudG8gZGUgcmVtaXNpw7NuIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmVjaGEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmZWNoYSIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTGxhdmUgcHJpbWFyaWEiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnZmFjX25vdGFyZW1pc2lvbl9pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzU+CgkJCQkJCTxvNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJmayAtIGRlbCBjYXRhbG9nbyBjdGxfY2xpZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2NsaWVudGUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9jbGllbnRlIi8+CgkJCQkJCTwvbzY+CgkJCQkJCTxvNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJmayAtIGRlbCBjYXRhbG9nbyBjdGxfY29uZGljaW9uZGVwYWdvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfY29uZGljaW9ucGFnbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2NvbmRpY2lvbnBhZ28iLz4KCQkJCQkJPC9vNz4KCQkJCQkJPG84PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9InVzdWFyaW8gcXVlIGFncmVnw7MgZWwgcmVnaXN0cm8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjkiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF91c2VyX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJ1bHRpbW8gaWQgZGUgdXN1YXJpbyBxdWUgbW9kaWZpY8OzIGVsIHJlZ2lzdHJvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJPC9vOT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTc0NzQiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbiIvPgoJCQkJPC9vMjY+CgkJCQk8bzI3PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSI2Ii8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE3NDk0Ii8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iZmFjX25vdGFyZW1pc2lvbmRldGFsbGUiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uZGV0YWxsZV9wa2V5Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTI3Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNhbnRpZGFkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjYW50aWRhZCIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2ZhY19ub3RhcmVtaXNpb25kZXRhbGxlX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI5Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX25vdGFyZW1pc2lvbiIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX25vdGFyZW1pc2lvbiIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfcHJvZHVjdG8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9wcm9kdWN0byIvPgoJCQkJCQk8L28zPgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icHJlY2lvX3VuaXRhcmlvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJwcmVjaW9fdW5pdGFyaW8iLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InRvdGFsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ0b3RhbCIvPgoJCQkJCQk8L281PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzQ5NCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJmYWNfbm90YXJlbWlzaW9uZGV0YWxsZSIvPgoJCQkJPC9vMjc+CgkJCQk8bzI4PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIzOSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzAzNyIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjIiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImZvc191c2VyX3VzZXIiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9ImZvc191c2VyX3VzZXJfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUyNCIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI0Ii8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImJpb2dyYXBoeSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImJpb2dyYXBoeSIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMyIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb25maXJtYXRpb25fdG9rZW4iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjb25maXJtYXRpb25fdG9rZW4iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8xMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6dGltZXN0YW1wIHdpdGhvdXQgdGltZSB6b25lIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBhc3N3b3JkX3JlcXVlc3RlZF9hdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iVGltZXN0YW1wIFdpdGhvdXQgVGltZSBab25lIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icGFzc3dvcmRfcmVxdWVzdGVkX2F0Ii8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzExPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjgiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSI2NCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJwaG9uZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InBob25lIi8+CgkJCQkJCTwvbzExPgoJCQkJCQk8bzEyPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjp0aW1lc3RhbXAgd2l0aG91dCB0aW1lIHpvbmUiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTIiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZXhwaXJlc19hdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iVGltZXN0YW1wIFdpdGhvdXQgVGltZSBab25lIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZXhwaXJlc19hdCIvPgoJCQkJCQk8L28xMj4KCQkJCQkJPG8xMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iKERDMlR5cGU6YXJyYXkpIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJyb2xlcyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJUZXh0Ii8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icm9sZXMiLz4KCQkJCQkJPC9vMTM+CgkJCQkJCTxvMTQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNyIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJzYWx0Ii8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ic2FsdCIvPgoJCQkJCQk8L28xND4KCQkJCQkJPG8xNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI3Ii8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNjQiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idGltZXpvbmUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ0aW1lem9uZSIvPgoJCQkJCQk8L28xNT4KCQkJCQkJPG8xNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6dGltZXN0YW1wIHdpdGhvdXQgdGltZSB6b25lIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE3Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNyZWRlbnRpYWxzX2V4cGlyZV9hdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iVGltZXN0YW1wIFdpdGhvdXQgVGltZSBab25lIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY3JlZGVudGlhbHNfZXhwaXJlX2F0Ii8+CgkJCQkJCTwvbzE2PgoJCQkJCQk8bzE3PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzgiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idG9rZW4iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ0b2tlbiIvPgoJCQkJCQk8L28xNz4KCQkJCQkJPG8xOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iKERDMlR5cGU6anNvbikiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjM0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InR3aXR0ZXJfZGF0YSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJUZXh0Ii8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idHdpdHRlcl9kYXRhIi8+CgkJCQkJCTwvbzE4PgoJCQkJCQk8bzE5PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzMiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idHdpdHRlcl9uYW1lIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idHdpdHRlcl9uYW1lIi8+CgkJCQkJCTwvbzE5PgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzNSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJncGx1c191aWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJncGx1c191aWQiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8yMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMyIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InR3aXR0ZXJfdWlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idHdpdHRlcl91aWQiLz4KCQkJCQkJPC9vMjA+CgkJCQkJCTxvMjE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzOSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ0d29fc3RlcF9jb2RlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idHdvX3N0ZXBfY29kZSIvPgoJCQkJCQk8L28yMT4KCQkJCQkJPG8yMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE5Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InVwZGF0ZWRfYXQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IlRpbWVzdGFtcCBXaXRob3V0IFRpbWUgWm9uZSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InVwZGF0ZWRfYXQiLz4KCQkJCQkJPC9vMjI+CgkJCQkJCTxvMjM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IihEQzJUeXBlOmpzb24pIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmYWNlYm9va19kYXRhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IlRleHQiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmYWNlYm9va19kYXRhIi8+CgkJCQkJCTwvbzIzPgoJCQkJCQk8bzI0PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idXNlcm5hbWUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ1c2VybmFtZSIvPgoJCQkJCQk8L28yND4KCQkJCQkJPG8yNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InVzZXJuYW1lX2Nhbm9uaWNhbCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InVzZXJuYW1lX2Nhbm9uaWNhbCIvPgoJCQkJCQk8L28yNT4KCQkJCQkJPG8yNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIzIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNjQiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0id2Vic2l0ZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9IndlYnNpdGUiLz4KCQkJCQkJPC9vMjY+CgkJCQkJCTxvMjc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNiIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjcmVkZW50aWFsc19leHBpcmVkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJjcmVkZW50aWFsc19leHBpcmVkIi8+CgkJCQkJCTwvbzI3PgoJCQkJCQk8bzI4PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjp0aW1lc3RhbXAgd2l0aG91dCB0aW1lIHpvbmUiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGF0ZV9vZl9iaXJ0aCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iVGltZXN0YW1wIFdpdGhvdXQgVGltZSBab25lIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9vZl9iaXJ0aCIvPgoJCQkJCQk8L28yOD4KCQkJCQkJPG8yOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImVtYWlsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZW1haWwiLz4KCQkJCQkJPC9vMjk+CgkJCQkJCTxvMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvMzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJlbWFpbF9jYW5vbmljYWwiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJlbWFpbF9jYW5vbmljYWwiLz4KCQkJCQkJPC9vMzA+CgkJCQkJCTxvMzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImVuYWJsZWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImVuYWJsZWQiLz4KCQkJCQkJPC9vMzE+CgkJCQkJCTxvMzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJleHBpcmVkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJleHBpcmVkIi8+CgkJCQkJCTwvbzMyPgoJCQkJCQk8bzMzPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmFjZWJvb2tfbmFtZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZhY2Vib29rX25hbWUiLz4KCQkJCQkJPC9vMzM+CgkJCQkJCTxvMzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyOSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1NSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJmYWNlYm9va191aWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmYWNlYm9va191aWQiLz4KCQkJCQkJPC9vMzQ+CgkJCQkJCTxvMzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyMSIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjY0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZpcnN0bmFtZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImZpcnN0bmFtZSIvPgoJCQkJCQk8L28zNT4KCQkJCQkJPG8zNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJnZW5kZXIiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJnZW5kZXIiLz4KCQkJCQkJPC9vMzY+CgkJCQkJCTxvMzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IihEQzJUeXBlOmpzb24pIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzNyIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJncGx1c19kYXRhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IlRleHQiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJncGx1c19kYXRhIi8+CgkJCQkJCTwvbzM3PgoJCQkJCQk8bzM4PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iTlVMTDo6Y2hhcmFjdGVyIHZhcnlpbmciLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMzYiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNTUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZ3BsdXNfbmFtZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImdwbHVzX25hbWUiLz4KCQkJCQkJPC9vMzg+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE4Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImNyZWF0ZWRfYXQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IlRpbWVzdGFtcCBXaXRob3V0IFRpbWUgWm9uZSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNyZWF0ZWRfYXQiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjp0aW1lc3RhbXAgd2l0aG91dCB0aW1lIHpvbmUiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJsYXN0X2xvZ2luIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJUaW1lc3RhbXAgV2l0aG91dCBUaW1lIFpvbmUiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJsYXN0X2xvZ2luIi8+CgkJCQkJCTwvbzU+CgkJCQkJCTxvNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Ik5VTEw6OmNoYXJhY3RlciB2YXJ5aW5nIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIyIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNjQiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibGFzdG5hbWUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJsYXN0bmFtZSIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJOVUxMOjpjaGFyYWN0ZXIgdmFyeWluZyIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyNiIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjgiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibG9jYWxlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibG9jYWxlIi8+CgkJCQkJCTwvbzc+CgkJCQkJCTxvOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImxvY2tlZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibG9ja2VkIi8+CgkJCQkJCTwvbzg+CgkJCQkJCTxvOT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjU1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InBhc3N3b3JkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icGFzc3dvcmQiLz4KCQkJCQkJPC9vOT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTcwMzciLz4KCQkJCQk8aW5kZXg+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDbHVzdGVyZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPEZpZWxkcyB2YWx1ZT0iZFhObGNtNWhiV1ZmWTJGdWIyNXBZMkZzQ1VGVFF3bE1RVk5VIi8+CgkJCQkJCQkJPElEIHZhbHVlPSIxNzE5OCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ1bmlxX2M1NjBkNzYxOTJmYzIzYTgiLz4KCQkJCQkJCQk8VGV4dCB2YWx1ZT0iQ1JFQVRFIFVOSVFVRSBJTkRFWCB1bmlxX2M1NjBkNzYxOTJmYzIzYTggT04gZm9zX3VzZXJfdXNlciBVU0lORyBidHJlZSAodXNlcm5hbWVfY2Fub25pY2FsKSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJidHJlZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxpZCB2YWx1ZT0iMTcxOTgiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ1bmlxX2M1NjBkNzYxOTJmYzIzYTgiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENsdXN0ZXJlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RmllbGRzIHZhbHVlPSJaVzFoYVd4ZlkyRnViMjVwWTJGc0NVRlRRd2xNUVZOVSIvPgoJCQkJCQkJCTxJRCB2YWx1ZT0iMTcxOTkiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idW5pcV9jNTYwZDc2MWEwZDk2ZmJmIi8+CgkJCQkJCQkJPFRleHQgdmFsdWU9IkNSRUFURSBVTklRVUUgSU5ERVggdW5pcV9jNTYwZDc2MWEwZDk2ZmJmIE9OIGZvc191c2VyX3VzZXIgVVNJTkcgYnRyZWUgKGVtYWlsX2Nhbm9uaWNhbCkiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iYnRyZWUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8aWQgdmFsdWU9IjE3MTk5Ii8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idW5pcV9jNTYwZDc2MWEwZDk2ZmJmIi8+CgkJCQkJCTwvbzE+CgkJCQkJPC9pbmRleD4KCQkJCQk8bmFtZSB2YWx1ZT0iZm9zX3VzZXJfdXNlciIvPgoJCQkJPC9vMjg+CgkJCQk8bzI5PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxMSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzA3MCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imludl9lbnRyYWRhIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iaW52X2VudHJhZGFfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxOCIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMTA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnVtZXJvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibnVtZXJvIi8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI3Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJkYXRlX21vZCIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmVjaGEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmZWNoYSIvPgoJCQkJCQk8L28zPgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2ludl9lbnRyYWRhX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2VzdGFkbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2VzdGFkbyIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3Byb3ZlZWRvciIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3Byb3ZlZWRvciIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdGlwb2VudHJhZGEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF90aXBvZW50cmFkYSIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdXNlcl9hZGQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF91c2VyX2FkZCIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjEiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF91c2VyX21vZCIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzA3MCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJpbnZfZW50cmFkYSIvPgoJCQkJPC9vMjk+CgkJCQk8bzM+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5MTYiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfYmFuY28iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfYmFuY29fcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI0Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX2JhbmNvX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMj4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5MTYiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY3RsX2JhbmNvIi8+CgkJCQk8L28zPgoJCQkJPG8zMD4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMTAiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTcwNzUiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJpbnZfZW50cmFkYWRldGFsbGUiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJpbnZfZW50cmFkYWRldGFsbGVfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxOSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjYW50aWRhZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iY2FudGlkYWQiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJjb21lbnRhcmlvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvbWVudGFyaW8iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImZlY2hhX3ZlbmNpbWllbnRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZmVjaGFfdmVuY2ltaWVudG8iLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdpbnZfZW50cmFkYWRldGFsbGVfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzM+CgkJCQkJCTxvND4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9lbnRyYWRhIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZW50cmFkYSIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3Byb2R1Y3RvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfcHJvZHVjdG8iLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImxvdGUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibG90ZSIvPgoJCQkJCQk8L282PgoJCQkJCQk8bzc+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iNTAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibW9kZWxvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im1vZGVsbyIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0icHJlY2lvX3VuaXRhcmlvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJwcmVjaW9fdW5pdGFyaW8iLz4KCQkJCQkJPC9vOD4KCQkJCQkJPG85PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InNlcmllIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9InNlcmllIi8+CgkJCQkJCTwvbzk+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE3MDc1Ii8+CgkJCQkJPG5hbWUgdmFsdWU9Imludl9lbnRyYWRhZGV0YWxsZSIvPgoJCQkJPC9vMzA+CgkJCQk8bzMxPgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxMiIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzQxMyIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Imludl9ub3RhZW52aW8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJpbnZfbm90YWVudmlvX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMjIiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMTA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTEiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjIwNDQiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ib2JzZXJ2YWNpb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ib2JzZXJ2YWNpb24iLz4KCQkJCQkJPC9vMTA+CgkJCQkJCTxvMTE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InZlbnRhX3RvdGFsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFByZWNpc2lvbiB2YWx1ZT0iMTAiLz4KCQkJCQkJCQk8U2NhbGUgdmFsdWU9IjIiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iTnVtZXJpYyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ2ZW50YV90b3RhbCIvPgoJCQkJCQk8L28xMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjIwNDQiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZXN0YWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImVzdGFkbyIvPgoJCQkJCQk8L28zPgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI1Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZmVjaGEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iRGF0ZSIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJmZWNoYSIvPgoJCQkJCQk8L280PgoJCQkJCQk8bzU+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2ludl9ub3RhZW52aW9faWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjEyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L281PgoJCQkJCQk8bzY+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI2Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfY2xpZW50ZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2NsaWVudGUiLz4KCQkJCQkJPC9vNj4KCQkJCQkJPG83PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9hZGQiLz4KCQkJCQkJPC9vNz4KCQkJCQkJPG84PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJPC9vOD4KCQkJCQkJPG85PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im51bWVybyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im51bWVybyIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzQxMyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJpbnZfbm90YWVudmlvIi8+CgkJCQk8L28zMT4KCQkJCTxvMzI+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjYiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTc0MjQiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJpbnZfbm90YWVudmlvZGV0YWxsZSIvPgoJCQkJCQk8T2JqZWN0X093bmVyIHZhbHVlPSJwb3N0Z3JlcyIvPgoJCQkJCQk8UHJpbWFyeV9LZXkgdmFsdWU9ImFXUT0iLz4KCQkJCQkJPFByaW1hcnlfS2V5X05hbWUgdmFsdWU9Imludl9ub3RhZW52aW9kZXRhbGxlX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMjMiLz4KCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJPGZpZWxkPgoJCQkJCQk8bzA+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY2FudGlkYWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8UHJlY2lzaW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxTY2FsZSB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJOdW1lcmljIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNhbnRpZGFkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnaW52X25vdGFlbnZpb2RldGFsbGVfaWRfc2VxJzo6cmVnY2xhc3MpIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjUiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9ub3RhZW52aW8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9ub3RhZW52aW8iLz4KCQkJCQkJPC9vMj4KCQkJCQkJPG8zPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3Byb2R1Y3RvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfcHJvZHVjdG8iLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9InByZWNpb191bml0YXJpbyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0icHJlY2lvX3VuaXRhcmlvIi8+CgkJCQkJCTwvbzQ+CgkJCQkJCTxvNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ0b3RhbCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxQcmVjaXNpb24gdmFsdWU9IjEwIi8+CgkJCQkJCQkJPFNjYWxlIHZhbHVlPSIyIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9Ik51bWVyaWMiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idG90YWwiLz4KCQkJCQkJPC9vNT4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTc0MjQiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iaW52X25vdGFlbnZpb2RldGFsbGUiLz4KCQkJCTwvbzMyPgoJCQkJPG8zMz4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMyIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNzA4MyIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9Im1udF9lbXBsZWFkb19NTV9jbGllbnRlIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0ibW50X2VtcGxlYWRvX01NX2NsaWVudGVfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUyMCIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0nbmV4dHZhbCgmYXBvczsibW50X2VtcGxlYWRvX01NX2NsaWVudGVfaWRfc2VxIiZhcG9zOzo6cmVnY2xhc3MpJy8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjMiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF9jbGllbnRlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfY2xpZW50ZSIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfZW1wbGVhZG8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF9lbXBsZWFkbyIvPgoJCQkJCQk8L28yPgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNzA4MyIvPgoJCQkJCTxuYW1lIHZhbHVlPSJtbnRfZW1wbGVhZG9fTU1fY2xpZW50ZSIvPgoJCQkJPC9vMzM+CgkJCQk8bzM0PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIzIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjI1ODYzIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0ibW50X2VtcGxlYWRvX3pvbmEiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJtbnRfZW1wbGVhZG9fem9uYV9wa2V5Ii8+CgkJCQkJCTxTY2hlbWEgdmFsdWU9InB1YmxpYyIvPgoJCQkJCQk8VHJpZ2dlcl9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8VW5pcXVlX0NvdW50IHZhbHVlPSIxIi8+CgkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCTxjb250cm9sIHZhbHVlPSJUYWJsZTI5Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdtbnRfZW1wbGVhZG9fem9uYV9pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2VtcGxlYWRvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfZW1wbGVhZG8iLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3pvbmEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF96b25hIi8+CgkJCQkJCTwvbzI+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjI1ODYzIi8+CgkJCQkJPG5hbWUgdmFsdWU9Im1udF9lbXBsZWFkb196b25hIi8+CgkJCQkJPHVuaXF1ZT4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxGaWVsZHMgdmFsdWU9ImFXUmZaVzF3YkdWaFpHOD0gYVdSZmVtOXVZUT09Ii8+CgkJCQkJCQkJPElEIHZhbHVlPSIyNTg4MiIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ1a19lbXBsZWFkb196b25hIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8aWQgdmFsdWU9IjI1ODgyIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idWtfZW1wbGVhZG9fem9uYSIvPgoJCQkJCQk8L28wPgoJCQkJCTwvdW5pcXVlPgoJCQkJPC9vMzQ+CgkJCQk8bzQ+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjMiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5MjQiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfY2FyZ29mdW5jaW9uYWwiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfY2FyZ29mdW5jaW9uYWxfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUxIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9jYXJnb2Z1bmNpb25hbF9pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCTwvbzI+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE2OTI0Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImN0bF9jYXJnb2Z1bmNpb25hbCIvPgoJCQkJPC9vND4KCQkJCTxvNT4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMyIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNjkyOSIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9jYXRlZ29yaWEiLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfY2F0ZWdvcmlhX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlMiIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkJvb2xlYW4iLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSJuZXh0dmFsKCdjdGxfY2F0ZWdvcmlhX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzI+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMj4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5MjkiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY3RsX2NhdGVnb3JpYSIvPgoJCQkJPC9vNT4KCQkJCTxvNj4KCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCTxDaGVja19Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8Q29tbWVudCB2YWx1ZT0iQ2F0YWxvZ28gZGUgY2xpZW50ZXMiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIxOSIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNjkzNCIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9jbGllbnRlIi8+CgkJCQkJCTxPYmplY3RfT3duZXIgdmFsdWU9InBvc3RncmVzIi8+CgkJCQkJCTxQcmltYXJ5X0tleSB2YWx1ZT0iYVdRPSIvPgoJCQkJCQk8UHJpbWFyeV9LZXlfTmFtZSB2YWx1ZT0iY3RsX2NsaWVudGVfcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMSIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGUzIi8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9ImVzdGFkbyBkZWwgcmVnaXN0cm8gdHJ1ZT1hY3Rpdm87IGZhbHNlPWluYWN0aXZvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI5Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYWN0aXZvIi8+CgkJCQkJCTwvbzA+CgkJCQkJCTxvMT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iY29kaWdvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImNvZGlnbyIvPgoJCQkJCQk8L28xPgoJCQkJCQk8bzEwPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9ImZrIC0gaWQgbXVuaWNpcGlvIHNlZ3VuIGRpcmVjY2nDs24gZGVsIG5lZ29jaW8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjExIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWRfbXVuaWNpcGlvIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfbXVuaWNpcGlvIi8+CgkJCQkJCTwvbzEwPgoJCQkJCQk8bzExPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IlVzdWFyaW8gcXVlIGFncmVnbyBlbCByZWdpc3RybyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTQiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJpZF91c2VyX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX3VzZXJfYWRkIi8+CgkJCQkJCTwvbzExPgoJCQkJCQk8bzEyPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IlVzdWFyaW8gcXVlIG1vZGlmaWNhIGVsIHJlZ2lzdHJvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3VzZXJfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfdXNlcl9tb2QiLz4KCQkJCQkJPC9vMTI+CgkJCQkJCTxvMTM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxOCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX3pvbmEiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZF96b25hIi8+CgkJCQkJCTwvbzEzPgoJCQkJCQk8bzE0PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOaXQgZGUgbGEgZW1wcmVzYSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibml0Ii8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5pdCIvPgoJCQkJCQk8L28xND4KCQkJCQkJPG8xNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTm9tYnJlIGRlIGxhIGVtcHJlc2Egbm8gcHVlZGUgc2VyIHJlcGV0aWRvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIyIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMSIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQk8L28xNT4KCQkJCQkJPG8xNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iTm9tYnJlIGNvbWVyY2lhbCBkZSBsYSBlbXByZXNhIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIzIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibm9tYnJlX2NvbWVyY2lhbCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmVfY29tZXJjaWFsIi8+CgkJCQkJCTwvbzE2PgoJCQkJCQk8bzE3PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJOdW1lcm8gZGUgcmVnaXN0cm8gZGUgY29udHJpYnV5ZW50ZSIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0ibnJjIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9Im5yYyIvPgoJCQkJCQk8L28xNz4KCQkJCQkJPG8xOD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iVGVsZWZvbm9zIHB1ZWRlIHNlciBtYXMgZGUgdW5vIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIyNSIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJ0ZWxlZm9ubyIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJ0ZWxlZm9ubyIvPgoJCQkJCQk8L28xOD4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IkZlY2hhIGRlIGNyZWFjaW9uIGRlbCByZWdpc3RybyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMTIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkYXRlX2FkZCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJEYXRlIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRhdGVfYWRkIi8+CgkJCQkJCTwvbzI+CgkJCQkJCTxvMz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJGZWNoYSBkZSBtb2RpZmljYWNpb24gZGVsIHJlZ2lzdHJvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImRhdGVfbW9kIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkRhdGUiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGF0ZV9tb2QiLz4KCQkJCQkJPC9vMz4KCQkJCQkJPG80PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSJEaXJlY2Npb24gZGVsIG5lZ29jaW8iLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjciLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJkaXJlY2Npb24iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZGlyZWNjaW9uIi8+CgkJCQkJCTwvbzQ+CgkJCQkJCTxvNT4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxNiIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImVtYWlsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIxIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImVtYWlsIi8+CgkJCQkJCTwvbzU+CgkJCQkJCTxvNj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjE3Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImV4ZW50byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJCb29sZWFuIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZXhlbnRvIi8+CgkJCQkJCTwvbzY+CgkJCQkJCTxvNz4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iR2lybyBkZSBsYSBlbXByZXNhLCBzZWfDum4gbmF0dXJhbGl6YSBkZWwgbmVnb2NpbyIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMTAwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Imdpcm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iZ2lybyIvPgoJCQkJCQk8L283PgoJCQkJCQk8bzg+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9jbGllbnRlX2lkX3NlcSc6OnJlZ2NsYXNzKSIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxIi8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjEiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iSW50ZWdlciIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjEiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJpZCIvPgoJCQkJCQk8L284PgoJCQkJCQk8bzk+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iZmsgLSBpZCBkZWwgZGVwYXJ0YW1lbnRvIHNlZ8O6biBkaXJlY2Npw7NuIGRlbCBuZWdvY2lvIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSIxMCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2RlcGFydGFtZW50byIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJJbnRlZ2VyIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImlkX2RlcGFydGFtZW50byIvPgoJCQkJCQk8L285PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNjkzNCIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfY2xpZW50ZSIvPgoJCQkJCTx1bmlxdWU+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RmllbGRzIHZhbHVlPSJibTl0WW5KbCIvPgoJCQkJCQkJCTxJRCB2YWx1ZT0iMjYwMTYiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0idWtfbm9tYnJlIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8aWQgdmFsdWU9IjI2MDE2Ii8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0idWtfbm9tYnJlIi8+CgkJCQkJCTwvbzA+CgkJCQkJPC91bmlxdWU+CgkJCQk8L282PgoJCQkJPG83PgoJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJPENoZWNrX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJPEZpZWxkX0NvdW50IHZhbHVlPSIzIi8+CgkJCQkJCTxIYXNfT0lEcyB2YWx1ZT0iMCIvPgoJCQkJCQk8SUQgdmFsdWU9IjE2OTQyIi8+CgkJCQkJCTxJbmRleF9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCQk8TmFtZSB2YWx1ZT0iY3RsX2NvbmRpY2lvbnBhZ28iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfY29uZGljaW9uX3BhZ29fcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGU0Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9jb25kaWNpb25fcGFnb19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMT4KCQkJCQkJPG8yPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZSIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJPC9vMj4KCQkJCQk8L2ZpZWxkPgoJCQkJCTxpZCB2YWx1ZT0iMTY5NDIiLz4KCQkJCQk8bmFtZSB2YWx1ZT0iY3RsX2NvbmRpY2lvbnBhZ28iLz4KCQkJCTwvbzc+CgkJCQk8bzg+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IkFsbWFjZW5hIGRlcGFydGFtZW50b3MgZGUgcGFpc2VzIi8+CgkJCQkJCTxGaWVsZF9Db3VudCB2YWx1ZT0iMiIvPgoJCQkJCQk8SGFzX09JRHMgdmFsdWU9IjAiLz4KCQkJCQkJPElEIHZhbHVlPSIxNjk0NyIvPgoJCQkJCQk8SW5kZXhfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPE5hbWUgdmFsdWU9ImN0bF9kZXBhcnRhbWVudG8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfZGVwYXJ0YW1lbnRvX3BrZXkiLz4KCQkJCQkJPFNjaGVtYSB2YWx1ZT0icHVibGljIi8+CgkJCQkJCTxUcmlnZ2VyX0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxVbmlxdWVfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJPGNvbnRyb2wgdmFsdWU9IlRhYmxlNSIvPgoJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQk8ZmllbGQ+CgkJCQkJCTxvMD4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9IiIvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0ibmV4dHZhbCgnY3RsX2RlcGFydGFtZW50b19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vMD4KCQkJCQkJPG8xPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjEwMCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJub21icmUiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibm9tYnJlIi8+CgkJCQkJCTwvbzE+CgkJCQkJPC9maWVsZD4KCQkJCQk8aWQgdmFsdWU9IjE2OTQ3Ii8+CgkJCQkJPG5hbWUgdmFsdWU9ImN0bF9kZXBhcnRhbWVudG8iLz4KCQkJCTwvbzg+CgkJCQk8bzk+CgkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQk8Q2hlY2tfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQk8RmllbGRfQ291bnQgdmFsdWU9IjgiLz4KCQkJCQkJPEhhc19PSURzIHZhbHVlPSIwIi8+CgkJCQkJCTxJRCB2YWx1ZT0iMTY5NTIiLz4KCQkJCQkJPEluZGV4X0NvdW50IHZhbHVlPSIwIi8+CgkJCQkJCTxOYW1lIHZhbHVlPSJjdGxfZW1wbGVhZG8iLz4KCQkJCQkJPE9iamVjdF9Pd25lciB2YWx1ZT0icG9zdGdyZXMiLz4KCQkJCQkJPFByaW1hcnlfS2V5IHZhbHVlPSJhV1E9Ii8+CgkJCQkJCTxQcmltYXJ5X0tleV9OYW1lIHZhbHVlPSJjdGxfZW1wbGVhZG9fcGtleSIvPgoJCQkJCQk8U2NoZW1hIHZhbHVlPSJwdWJsaWMiLz4KCQkJCQkJPFRyaWdnZXJfQ291bnQgdmFsdWU9IjAiLz4KCQkJCQkJPFVuaXF1ZV9Db3VudCB2YWx1ZT0iMCIvPgoJCQkJCTwvUHJvcGVydGllcz4KCQkJCQk8Y29udHJvbCB2YWx1ZT0iVGFibGU2Ii8+CgkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCTxmaWVsZD4KCQkJCQkJPG8wPgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMyIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhY3Rpdm8iLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQm9vbGVhbiIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImFjdGl2byIvPgoJCQkJCQk8L28wPgoJCQkJCQk8bzE+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNCIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjA0NCIvPgoJCQkJCQkJCTxOYW1lIHZhbHVlPSJhcGVsbGlkb3MiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iYXBlbGxpZG9zIi8+CgkJCQkJCTwvbzE+CgkJCQkJCTxvMj4KCQkJCQkJCTxDaGFuZ2VzIHZhbHVlPSIiLz4KCQkJCQkJCTxQcm9wZXJ0aWVzPgoJCQkJCQkJCTxDb2xsYXRpb24gdmFsdWU9JyJwZ19jYXRhbG9nIi4iZGVmYXVsdCInLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9IiIvPgoJCQkJCQkJCTxEaW1lbnNpb25zIHZhbHVlPSIwIi8+CgkJCQkJCQkJPEZpZWxkX1Bvc2l0aW9uIHZhbHVlPSI4Ii8+CgkJCQkJCQkJPEluZGV4ZWQgdmFsdWU9IjAiLz4KCQkJCQkJCQk8TGVuZ3RoIHZhbHVlPSIxMDAiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZGlyZWNjaW9uIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImRpcmVjY2lvbiIvPgoJCQkJCQk8L28yPgoJCQkJCQk8bzM+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPScicGdfY2F0YWxvZyIuImRlZmF1bHQiJy8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPExlbmd0aCB2YWx1ZT0iMjUiLz4KCQkJCQkJCQk8TmFtZSB2YWx1ZT0iZHVpIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkNoYXJhY3RlciBWYXJ5aW5nIi8+CgkJCQkJCQkJPFVuaXF1ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPC9Qcm9wZXJ0aWVzPgoJCQkJCQkJPGNvbnRyb2wgdmFsdWU9IiIvPgoJCQkJCQkJPGRlbGV0ZSB2YWx1ZT0iMCIvPgoJCQkJCQkJPG5hbWUgdmFsdWU9ImR1aSIvPgoJCQkJCQk8L28zPgoJCQkJCQk8bzQ+CgkJCQkJCQk8Q2hhbmdlcyB2YWx1ZT0iIi8+CgkJCQkJCQk8UHJvcGVydGllcz4KCQkJCQkJCQk8Q29sbGF0aW9uIHZhbHVlPSIiLz4KCQkJCQkJCQk8Q29tbWVudCB2YWx1ZT0iIi8+CgkJCQkJCQkJPERlZmF1bHRfVmFsdWUgdmFsdWU9Im5leHR2YWwoJ2N0bF9lbXBsZWFkb19pZF9zZXEnOjpyZWdjbGFzcykiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iMSIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIxIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIxIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWQiLz4KCQkJCQkJPC9vND4KCQkJCQkJPG81PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0iIi8+CgkJCQkJCQkJPENvbW1lbnQgdmFsdWU9IiIvPgoJCQkJCQkJCTxEZWZhdWx0X1ZhbHVlIHZhbHVlPSIiLz4KCQkJCQkJCQk8RGltZW5zaW9ucyB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxGaWVsZF9Qb3NpdGlvbiB2YWx1ZT0iNyIvPgoJCQkJCQkJCTxJbmRleGVkIHZhbHVlPSIwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9ImlkX2NhcmdvZnVuY2lvbmFsIi8+CgkJCQkJCQkJPE51bGxhYmxlIHZhbHVlPSIwIi8+CgkJCQkJCQkJPFR5cGUgdmFsdWU9IkludGVnZXIiLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0iaWRfY2FyZ29mdW5jaW9uYWwiLz4KCQkJCQkJPC9vNT4KCQkJCQkJPG82PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjYiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjI1Ii8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5pdCIvPgoJCQkJCQkJCTxOdWxsYWJsZSB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxUeXBlIHZhbHVlPSJDaGFyYWN0ZXIgVmFyeWluZyIvPgoJCQkJCQkJCTxVbmlxdWUgdmFsdWU9IjAiLz4KCQkJCQkJCTwvUHJvcGVydGllcz4KCQkJCQkJCTxjb250cm9sIHZhbHVlPSIiLz4KCQkJCQkJCTxkZWxldGUgdmFsdWU9IjAiLz4KCQkJCQkJCTxuYW1lIHZhbHVlPSJuaXQiLz4KCQkJCQkJPC9vNj4KCQkJCQkJPG83PgoJCQkJCQkJPENoYW5nZXMgdmFsdWU9IiIvPgoJCQkJCQkJPFByb3BlcnRpZXM+CgkJCQkJCQkJPENvbGxhdGlvbiB2YWx1ZT0nInBnX2NhdGFsb2ciLiJkZWZhdWx0IicvPgoJCQkJCQkJCTxDb21tZW50IHZhbHVlPSIiLz4KCQkJCQkJCQk8RGVmYXVsdF9WYWx1ZSB2YWx1ZT0iIi8+CgkJCQkJCQkJPERpbWVuc2lvbnMgdmFsdWU9IjAiLz4KCQkJCQkJCQk8RmllbGRfUG9zaXRpb24gdmFsdWU9IjIiLz4KCQkJCQkJCQk8SW5kZXhlZCB2YWx1ZT0iMCIvPgoJCQkJCQkJCTxMZW5ndGggdmFsdWU9IjUwIi8+CgkJCQkJCQkJPE5hbWUgdmFsdWU9Im5vbWJyZXMiLz4KCQkJCQkJCQk8TnVsbGFibGUgdmFsdWU9IjAiLz4KCQkJCQkJCQk8VHlwZSB2YWx1ZT0iQ2hhcmFjdGVyIFZhcnlpbmciLz4KCQkJCQkJCQk8VW5pcXVlIHZhbHVlPSIwIi8+CgkJCQkJCQk8L1Byb3BlcnRpZXM+CgkJCQkJCQk8Y29udHJvbCB2YWx1ZT0iIi8+CgkJCQkJCQk8ZGVsZXRlIHZhbHVlPSIwIi8+CgkJCQkJCQk8bmFtZSB2YWx1ZT0ibm9tYnJlcyIvPgoJCQkJCQk8L283PgoJCQkJCTwvZmllbGQ+CgkJCQkJPGlkIHZhbHVlPSIxNjk1MiIvPgoJCQkJCTxuYW1lIHZhbHVlPSJjdGxfZW1wbGVhZG8iLz4KCQkJCTwvbzk+CgkJCTwvdGFibGU+CgkJPC9wdWJsaWM+Cgk8L01vZGVsPgo8L3Byb3BlcnRpZXM+Cgo=', NULL, 'iVBORw0KGgoAAAANSUhEUgAAAIIAAABwCAIAAABdOz+4AAAABmJLR0QA/wD/AP+gvaeTAAAgAElEQVR4nOS9Wa9tSXIeFpHTGvd09pnvOXequtVVXT2xSZlDE02LgCFBJkDDMCDZfhDkZxswYOjBMPQ//GDZsAXowfSTIRrwG2VKpGCJaqqnqmLXcOd7pj2vvabMjPBD7rPPeG/VLTapBwfQjVtnr71WrozMjIgvvoiNH3300c7OjveemQEAABARbsjrPl3//c0ffb0vvtVIvtYXsWnLf/2zP3A8bW0Tx6pcWiGQPA+2YiGQGcK1VVX34w++++j3Gfwv9xWklMfHx2p7e3swGNy89P8n0rRx1jVC5bMpR7EGVohAxBubuVLIDESMAtpGG9LDzb+SiWJm5b3/8gv/fYi1jScvhLj2d/J86/VBEMGYCPH6t14rJO/u/b1U2EUyyfLOvbuHYamSZwYA5k8+OSOGDDGKWmZ6izt/ZfHeq8v/bW3jvA1vjojMzATMDAgQ3j38AwERI5PcuuNa23jvhEA435KrFyMGuH4fgcKY+OZ9vPf/4s//l4aPFvOZVMI7RgTnCBF3DzMpEFY3uLhfuMdkUnx48F88uPM3vvosGK0kkkCRxNEnH398/+E7kdFSrYb04bd2ZtP65ctCyFte9pclV9Twr376T4vm8XI5IwLvSWnR34yTRK7PQEQEYGaejeu/8d5/vTN8eO12zPCnP/4npX1WFFMdqWLeMrE2kpgP7nfWs40IAEhE80n7mx/8t8P+wY37kBCDTBqMC+8x6UUIyMyI2DXmpva957pxUmDHNK6VbzUFCCAQEcE5p7Ru6joyev1pXbvprI5i5X39Vrd9K7lQAxNLHGaxUFQQodGRUiKJldHIAADoPdWVQwFCYKpq195yOyZSYpjHSvklCtkdKkQUAlHAevoQsGmdtSQRcmOdvf2Qubf3t2OFxew0TrKDg903v0ZTw+PHM0TglPPYvt0cIHoiQATEPM+lvKJFgUCehUCGv5bdwEB3tn9glC7nZ1pHd+/duXZpW8PjxzMpERA3B05LghveAjMd7PzN2Ojl9EQodf/+4a1PnU/dq6MlInDmjLp98TJ4Yq6bMsvTn/7kJ/cePOjk+eteI4rhG+/3XjyfjyfVrfN1zW27NGAm34JgrbVAsbOzc+1bJlLDzeT5s4WJ32ST/pJyWQ0igbFkGW9uDvrdWwYtPAjXWBoMEu/h+ORIa7z8dojonbOOtIbW1tTyRx9//ODBg8nIzua1lAiAea7n80YI9ERKCgQLcIvRE4gY/DkhmTnL86qq3qAGADg7WxZLm2aayV37aDwe32rGhBDj8STVC4H9jf07SRxdu+DZs9ls1sSJ3t7J5ovbtv8vSS7UgEAlb8TSNNPR2elxt9vbGGw9ez4TAr2nNDXWeq0keVgW1rbN/u7uYLBx7Xbk/fJ4CkxSySxOrLUAMNiIy6qVQnhPQmBkJAN4z1ILWzPcWGRlWS6LgggRpdaaiIQQaZquL2Dm0agSAplYKIEMxNw0XkoE5qoqZ7PZevkz82w229i4PlQAEEI4b227k/TEdDJ6VVXO+cO799b62NxMy9IxcdN4a+kvO9mvlws1CCGns4+L8sQ7x8zHUxUdR1XliBgYlBZM7Dx7T1IKYNrc+a1b7hfWMIo4jsOba60FYhSptvVCYmvJRKppvFKCiYVAIa/vhqZp8jxfTmtEobQG5iiK4iheX1BVrqps23oAiCKFCHXtnCNAlMhxHHW7nZVjBgAA3vs8z8uyvBlRCiGQEQCtc1IqAByNzvr9fp5lABDHejCIx+OKiKPo7Sz/W8kVT+k77/+68361f5n53AsEuHAMz31E1ErDVWHmum7ALVEaIVSWZeuPOh2zXFoMnm4ky9JKidaxVOLo6Dh8VwgRzCMzK6WYPRF751CIg91LJpphPKrq2glEqYRSOJ+H4wKlQAQILsHa0DrnmLlt26Io8jwPmghWYX1LRLDWaqURsSpLpXRQgxAYR0pJUVUuScU6qP6lyxU1CKGMUK+79EtlMpmUZSXcwsQdkfcuf9Trxb3eajnXtWMql7Xb3snrqvrs4yfeO0S01m5tbTVNU5al396J+URztrWz1+1kVx6DcHB4xXRtb9Gnn46dpSyLlcKj41dxrBAFIrZtO5lM6rrudDqXl8XlI4uJiRgB6rpWSkkhxqOzfr8fRwYAiNlTiOT4r0gHcE0NJ6PHdTsTIhwsAABELBBXgRIzYnBemQl3Nh4ZkwAAEY1GI6XUbDZjIL/IsqhbtLPTk+O6rpTSxhjvXafb29vdBYA4Vo/eG37+2fjsZKkj/s3f/I1Op+O9f/78eZIkUsqmaRaLGda9aJAXxWwyPhtubuVZenP0QYQU7z4aPns2qyqnFOzv7w6Hm+Gjtm2zLCOibvcWp6MsS+dcxMDM2hjmNs/zs9PTw3v3gw4gnAe3ulm/VLnkKTH8+NP/c2m/mM0mJlLFvKlrh4hRLJnYOd67lw2GEQIQ8/h0+R/gPzzY+SYAeO+NMb1eDwC6nfz5ybw1DDU+evTIr444Pjoq6so/ezpjgCRWZWWFFEISOe+cA4DlcqmUyrJMKVXXdX/QL04bALDWeu+dtePRyMRxnmW3voYQaIxsas+A08kkz9KwjpqmadvWe6/19SMUAE5OTsIaR0SBKIQgojiOl8uik2cAUFX27LSSShij6rr65U//uVzaDUybvR9uil9vkjGg2vlgW6C4QFAYpMZl0Y7GlRSYJN6IFc51zRcUQmoVoWrH46mSqtPNEcHo2FkbLhZSA7NAEIhSnJsaRK211tp7L6VMkqSSjoGFECy4qsrFYj7YGL5ODd4REQMCea6qqm1bIUQ46Ky1RBR8trUgYlmWRVEcHh4sCqEirItaSm1M3Ov2pVpNS5LoXi+dTGqjDaD+67ANDLDd2zba2Px+mmW93i1O+ghaDa1Swjnb1Iu2bZnZWnsJuZUnZ39h3aJZzp0nIXBzcyuOo/G4XC4tIqKANNGLRYsIrSUjuTf4/sUY1rufmRmYmImcc8YYY0xVvXY9TqbVfNYIKYyRk4kPur1sAOBGpFmWpRAiieOfffFvBJd1uQSATqfb6/WYaW3Ji0UzGlf2ud/f2bwnviSY/9pyRQ0KnUTUWb7WgfcgJYRVUNd+Nivb1vcHCTCXVR3UwMzB+jEzCvHo3oO6WaIIngoTEQAkkfXO5nlOzOs1hQAM2O8OLk/WWkrDsUIF5u7dezfHPRlXp2ellOgc9fvxYtFGsaprV5V09/BOv7+6Z9u24VC6aRsmkwkRmSh6//5D5y2iCMpnujKMXgcP7wADR7rzNef4K8iluAH4bMlSNtX0SdW0/X5/e2vv8eMJMZDnvGOc9Z7Ytr4ohbP23Xd28lvCWu52trqdrWt/dda3tk3T5HXjQMTrhxugkrJp7OPHj7vd3sbGBdZPxMWyNUYScZoaIpZSEFEI37y/iLOYmYjeaGJxo7//+k//muRSFC1komfz5amIRR6j5dGLk5FJVwEDAaJhxSANA6JmNvF10CnMIxERUfj3+cRi2zZN00YmIr4lFhUorHXX5woBEZnYOue9L8tl21ohBDOnac4riwJSrgAVZpBSMH3VWFeguBXh+PciVxzWO3vv7fqH4VVRrMbIzETn6P65CMQousWDZIZ/9eN/urTPl8u5iVVbe+9Ja6kMdvtGnF0OmFd3DP+bThab8Q93dv7O5c/DKo6M8d7NpjPrnJSSmLOsIwVaS0IAEQuB4Wy8FpRdHRgtqzkCoEBgkFJU7byxRdXMw2NuySYhxCZTN6LUvwq5UAMR/fGP/nFNL+azaZLq+bRBBAaIYrV3uJrx9XqfjdsffPAPh4Nb8gTOCyU7GtGVaJRyRJGUSopEmxCYwxpFQmTitvVCYBolbXMlD8gAxBwnyfb29s1x53lWlktkrCz1+3HpWEpV11ap654bIgqhzqZP/uTH/yvjvG6aKFLzacNAtvX/7rECZqHE/UfdS+kQDCvj/sbvffvdv3Pz6b90uZxvoNjcTcQw5oUQaucw8Z6FBKVEFitmQMS6tm3rEbEfWe9vSwcyHe7+7UjJ5fRER/EVoHu92i7Nkm3gs8/GCEgGnDy+fCfnXOXdYnzy4uWTGr9AURNbIYV3FG6SZloIZMHLAlBj0zS+Ocz9d7Ls5oZgINNJ30+MW8xLAOht6TRNiVgIYAYhMYtVUIP3tFxaKcVGbAX1v960vq1cOZQOtn8z1qqcT6M42b+zc/Pq2cSdnlWI4I0NiFwwA5cXICIDehQgBH/66ad3Dg6SOAYAQCDip09nzhEwaCOlxLp2UjMzS2Z/CcKUQpXFx2U9Bsa6KabNp1Fsp5MiilVVWiKO00t7FAAFNradTV4Ns2pj87vXhs1Msem9c+8/SaGcZ3PnbK8/2N3dvHrR6l7OwpPHc0CUiVC6+Jrz+pZyPd8gyAy3t67DOAAAUFf21dGMmIfDtK7p6OhECsHMzrk8z5Pk3AtCRCGlksPNzciYa8msELIChtgVpETvL8MkACvHF7/7zR8G81FV1edH01Q0i2ySd3v37h4CsHeeiMP58RefnDFAxnBw17/36P7lx4UgLqwTTy0Lh4Kkwun0jNnt7e0evVpOpxUgAEI3N9NZgwjMoLUAjwL/mvgSl/MNfkEbiVazk1cvntvBxka/O3z6bJVvyHPTNE5p0TRuOq1t2xwc7vf7fQCo6zoAEgDAIDQvwAoTxUkcX+NVIMLGRuqcBwCpBAKcnpQAoI3UStTNjdHh6ltZknZMSs7naefo1QkxHB6s/LQXzxd5pysEai2K5cR7Z60L40HEul4FN0pJgKyqau99lmV1VTVN/dlnnznnNoYb29srD3tvHxBhPCqPj5dRrOq2raqyWM4bN0FBgStxMTb+GmATbvXf0fp6fulS3CDVfPbzo3pE3gPDpFRK6aZx4VGjQpInInaelBJMcIA/vPU5ClFpJVR6k9uCiFmmmXU4kYlYaSyX3kQy5FZvHzkDAAe8msgvi2K4eRGXdLuGGKrKti3VdfnkyZPT0zPnXHh627YBzOh0Og/vDznqDDeHAlFsbCAiEQGzugI38fHxsml8muk0NT/5ybNPPvnp0eiT/uGxp/GybKJIVqXPu3oxa/Oe2TtMLzzwS87H1dcGYEAE72k6qn7w/n+/t/3ea9WAiL/y4Q/XIS4T3AqhhD2LCLdmyBGo5DxiCeVy0O/dvGA+a45PCiHQO+5vxLYlE8n5rDFaIL0pyPLeOee89yhE3rkIaDvdCACc9dNpnWX5w4d3tDb9fj9NU2YO0F5QhmLpVjAZe+9NFEXR9VUJAEqJ+azRRgLAxnCwvT34le9/u/FnKIg8MAMKYOIAzAQe0NUZeIMuAHow6F6PtwBABev6o4//0PHU2lYqYVsSCCZRxogLaswtd+eqbN87+Ft5vA2wTv8iAguBdVN//Mknvd4K3A5CxLN5rZQE5ihT3hEgek9aC7jsSd1QPgWUwVM466uqjMyFjpdF8+qoyDJjXQXnWaNgk7z3ATT94osvTHxI8eLk5Ng517bt1vbO1ubw+mQhDocpeT4bla2lTp6laby3twdwC6DySxQFgM63R6OPQM2mk7nWslxa8jzcTQab5raYNwwXAGBeLqfz73aSK4BXoP0IIQQKBBiPRlVdSymJaHNrWyAKAcAgBJ7/G0F8GfmEQUollRiPx0m6e3Lsj16dxbFCgLrx5EkpkeXGWTEajefzeUDLAaBpGmttt9v13iNzCAmZWUpZFIvNzeGtzw3wB3OAFv8KU9BrUQAsUN7b/89j4YpklGSde3cPzofCwCH8WY2WmYUUi1n9+OlMCswNpSa9zK4FWNFTpFLDTlcgAnOcJAKRiJWUcazmi1ZJJGKtV2nFYBbWe+Cm4VtxuZTu9QfbW0PviZnDqLwnRJxOqsm4imLc39+oqnIwGATPLZxIeZ7fv3//bMmisULIR48erABUAAAoivb4eKkUWkvdXlQWFgVIicjgrccUAOCL5/+2bMaIpLTwnsK0eGIEkArPR+KN7D+48+tfAyJZ2YY0zjqJQu+JQavk8o2Kwo5GlVLCO8pyXVUWQHbyjhACwQvga8cVAjKDlHrQH9w8OuPEFEsHiM5RlimBHiW2pdVarK3NjQQGhtx92GFVVRBzJ1+ZB6WEs+Q8B7T1mhbD2g//EIhxHFdV9fLVq+3tbSUlALStn05rJdE5imNlWw8IzpFznCayqhgQmfkXz/6oci8mk2nWMbNxRQRSYVN7qbA7iA7uZwDY1I1bDg+2v2/MW+MfaxPN3lnnnTHx6enJYLCh9eojY0S3G3AIGcdKIDCC1lhVzrub1CxclLNF0cxHR188+TjLO/fu3l1FdwiIMJlVo/FSCPTEnuP5rEbEqnZGC4krduJlcNB7Px5PyANKlFI2TT2fTQFF9k4uVhdwWbWLRZMk2r6erncONSIRtU3b1E2LIIQQQhstSQnDnKambR0A1pVLU62UEK0Iftre5u8p6evuSEhz99cOLydGEeHJ42lrKRUoU7oU/3wdNYD33jmfZWo8HqdZfkkN0piLECxNNQAQ8YsX87L0HbhKNZQqVrOiHGX9kFebPnk+BUTnrPcUPJMoR2ZWALUDnQIA5DE0TRVH+3Ce2c7zPARd4/F4Op3tbSmB/cHO7jpFvJbnz2azeZNlJsvMbP6m44ABrLVSSq3NaHRWlmUUxQeHB9s7l2PViIib2jED8bkjxNDvbEdaLrzp9vu29L3+IIoulnz6jb1l0Y7HNWP19dLWq7nmlSviAcAYU5blG1LwAHB8VCzmbRQrT1fAfUR45973bl5PHtrGx6kEgNm0PA+tidkDAAoxn8/LcjmdTouiqOt6zSqXUqZZ7JZbpkujs9OyLJnh4cOH6pxyee9+f3RWnpwuR6MqTl7LeifyRVnGfrEsyzt3Dra2B4HqWSyKx0+miOA9d7tRXVlicI4YINKSfNXpJABA7InBurZt6+VyaeIoii5cNWOwEszgnXNfDztf7wZkgDgOGWMcDC4gLe/pyZMZM5PnONHA3FryzmsjbWtlfvHmiKK19Uef/xHj0joLgCGAQ0TnnFSYJJFtrfM+iqKmbjayb2723iX2gpnZA/CFDQhg+0qEWIEfGEWRtfbs7DQcXDs7u1orIVBJAa+P/wBAKtEUP6mZAOHp0Wn1eTWfz7d3thGQJAMDKJhXAADWuaJY9vu9mqmT7gdu58pxImIArXVZVv3ehRqs9UdHhTYKPfwldgMDAARfWyh1uL8yXwDAzMfHS0QE5gDGtS0Ft4aYlRIh+3KuBmzb6snxv1ZRMT5bIKK1rqkp5AMeftBfAgKAEFhZWJRL8tHh3neJbCAUMXOSJOdkDrj8/4DB8gcHSVRVKaVWSq7m/Xz2A4PhMtS4/needX/1239r/dqjs/Hjx49/9VsXafCLOW3d0fHR4eEBAFRVNR6PwwwhCq31ZDy+c+fudMoff3zGxEmqmblpPDN7T1+7BEWdD3dFeyRPUqlLvgrmuYkiAmClpJS4XLazWRMIKd45ALrkKbEU0f39v5/Kdm7O8k7v8PBO8HoBgJgR0Dv/6WcTREyRN3KtFAIYAIjjmIiMMZ1OJ9BVz7cCKqXAIzNZa72nkNTsD4aDfi/sCSYmZilEsSzms7iqqjVPMkTRSqnL7r8QYlkW8BpbypfeaLUjhRAorXUosNvr9fvdfh/WnIEwV8Wief58IeTXpG4oAACEMFdEhAC2tdElslS3G3nPUiITA2Jk5HJpAaBtvRAQCD7rlYsod9JGyGx781t5lt10WI+Plv3e0BiltRiNXsxmUykVIq7Jv0KIPM8753CFc24YD2cvamJPRFIpapo4Tsaj08l4ZK0l8knSB4jyTvTyxeyZrauqQsQQNwQ1XOaOAICU8tWrV8fHxx988MENFiXWdV2WZWCBlGU5m80Wi4WUrt8fRN1+nq9favVqRdFWlQWAbi+qqvYva6LbpiXmB3fvXZs7Z+nx46nzxMRJZoCIiEPQ5KxbQmWMcM4rpcqyJCKWPaUNE1dVHccxANaVl1IQcYC1gZEZiVBKCeez4JybzWZ37ty5PT+MCADGRHVdS6WsbZkhTuKHDx8ui/bZ87kQYFvftGJnp0dESZIENQRebJIk19RgjDk9PW3bVkp5TQ3uXADAe18UxcZwqEFIlioyxpimabTWa+CSPM1nTWtpeztr29dBSl9BDULIHI8Zk/7O7s31q7R499EFK91a//lnE0/c7UVKmn/+//zxxqAXiO/z+TyJI8zjLHKL2dR7v7m5aXR2dFwErl+vFxdFiwhV5YwRCpi5Dcf9bDZ78eKFMWZvb68oivl8Hvb7YrE4PTtNeaCFcK1FBO99FEVSqs3NTQBIM70xiMfjmpmHw16aptPpLBj5oIagiXUcF7yvMODgCISTB15fioLItkw4iRf19Oz0pG3twcFht7var91ebIx8+nR2dFSk2Wsgzy9Vg7X22fNnXPXyblwuF7PpRAjJTEII5/zOzs61mFApef9B/8WLeds4r+C3f/Bb3W7HOdfpdEajUa/Xmy5eOmd3tnYQgIgA+L1u2tp2uVxGRu/u9pgYEJg5izezpMvAiDidTpumqevaGKO1NsYENWitpZJYIgALIYg4TaO6quJuEhkTpskYKRW2rXfOlmUVAAy5CpLbtm2bprm2G8IxFQzGtd0Q7E0okA3l4kSMQAyMKIyJvKfx+Ozly5dNU9+9d3/Q73li5lvQ1rdQQ1EUGxuDpgEGrJvGtjasnSRN4zi6qVpEiCIVRaooQtHaKiGhlIqiSGullNJanruPq7pBIYVzLo7jOIpX6AIwSmfOjVAcx8aYOI7jOI6iKI7ji79HZlE1zA6FQCQlpXU2vRTWBCSOmK11Sqn4XOC8giGO42tqSNN0a2ur1+vdPAObpmmaJmS0oiiaTCYCEc4NIDEPBoPFYt7r94YbDwLNUggUEoG+PrVSIWK31xsvCiYSQoRlWFVVlmbrfXdTeAX84Ww6S+KoLKsoigTKyfzlH/3of9Tx/OxkjghN7ZUSTeN3D7OtnYRqxlkIJrAsK6h3f/dX/pHWChEDIn1ZwiR67733TCuw21rro0gptZgvAp+1XLbHJ0tm6PaSydgGpzZ4UwgoUCGSQH25qAgBu53BJJl/FZ5SlmVEPnA1goTqI0Q0xgAAEc/njZKCBHztiiAFAMwUwhNgttbmeV4sFu6NZeshd3ZOj0NmPj4+ruvauvr+4NtCd9/b7WmlQtqJPGsjUDACzmb1cmGVEv1Elt5Op5Og+MVisVwupZTBM5nNZmGO5vN5HEXLOM6UMBzdPbx7bSRnZ2UciCPAw83h7u6ec34wGMRxvKymz05/DGgrigPZh4kDT8n6Ztp8MS/e6ebXCYaXJUmSNE3btnFecKhXJGKGOL6gHzJzU7uqcr1BUpXl11QDIgoh1w5nOH+jKCrL5cbgdnrI8VGxLG3I9k/rtmlqANBaF0XhHTzc/V1WOs1zpRQTnddSg4kkAJQdHp2VVeM3h+lUna3UeCnauvygS38PplKcnZ4674n85ub22mgholSB3rYCU8MRdDL69KOnf8g4P365GGzG01HNDEmqiPjgQcfn9auz996sBgBI07TX6x5NKqvALx0zCCl3ti++JaXY3smbZjab1mn2NWvYVVmWL1+8wDbOEkOOQupq/84dvJFJXstwM60q2zqOlBhubgBgCLsCxdFWKabVq5fPqroxRhOxlFIIvHf/gRSYZihl/PTZ7OWraZZDr9c1JgqHT5ZleZ73er3pdBpO7WAwI6PruUOBVVEwgFRKSbk+ZLLclKX1nllCAJrWIVUnOfhw7z8kHP7Od7cFShRgW/f06QwA4liLlGJxS+3JNQk7oG1bZFGWS6G0nZydHr98771vCCVDkvnZs4nzhALbtr2lpPKrqGG5XO7t7ZYeCIEZ8jxP0mRtIYOEAj8pkDiQdtlEsmnbqqIokr1eV2sTfPPN4fDz03lWlfNiygw7e3dtq46PCynxxz9+2u9H00ktJFpLSon5pD64sxGmLHiWRFRVVXCZ4DyYYiJiAQCePAD2O91+72L6hsNUYHVysqxqlyRUVdU6il7M6/3Bb7eyTXRinZMoh1t5J/HHx4XWUiqU8svPEGYQQjXVZ2ejU2Cg0gdz/eNPnq+5n855JmDg2HSkvM5k/EpqUEoNBoOFXTjkNMu2Nq+QqIgYEctlezaqQvVVrxdNp7VAdI7jCMkTM6w9PxRglz+bsGMBAPDk5RkCkuDG+rZt24mWUjkAkswIUdyR8gpHodvt8rmE+PZcgInrukHE+Wx2WQ3e09mo1EYKIZxd2kCPcc5aW5UVa+O5nM2mTdsqpdM0yXKZFXo2b5TCTuerHCGMCN/6xm1lr7fxEL+eKADg4FcgzmfT05OTzc2tNW9nubTPn8+0lgjQ68fzWT2fN86R1iJJdBJj3VwMh4jSNP/+t/6jK7xjBgBoGjebzdI0zTvJ60bPzHEc53mepum6XNBaa4ye2xYR0zQlor29vcvfQgApQ35ufZuVbWhtfXL2pFYTa13TtAD8xdOfvfvo0ei0mc5qE8ko/ss15vnl8cHPoT0ABBQohBCe/IsXL+q61koR88OHBy9eLFDiYl7HiQ7VA+HEnC/85dgOEZn4//3ZHyzti7paSCXamvK+STNFnpz3ciLWJD5iWs7dr773Dwbdi2m9tPwvItu1y++919qcnZ1G2mxcJVUEW26M6XZ73e6i1+vFcfzeN9799MmfOevTTpJ24/Cas/krk2FH1E+ePHnv0X/8FafJ2saFtjh8zvg/36+4cg1C34dVOlKgMCb56mHEGmFFQEizbHd/f10igIgMEEUqz0yxbKUU3lMUSe+JCIhAXgW5AICY62pO0JIXtkHvBZBEkFJIKVdpO+9DNh+JbVEUgy7AKt5+rSRGRlpSmgEihXPwXIQQeR4hoJAYLMpac2nS+ea7P2zbNk3jazesyrqapRv9W7ji1ySsrT/9+f+2qJ4Wy3m3Fy1mLRELCU1NWhqFnIIAACAASURBVIfZB+85ydWduzkzEPnFxP/gw/+u372FB3yrXFJDCO4Zoii6RjzVRopKoEAiVkoieqWgrp2W1ys1mPkbd35HoNLJ5mDQAbig6J6/v//i84ltaDhMrWnnk6NpOgUAIlJKwSV8+2IWGCJRxUmWJN31zqjqxfqZUdy0rSUABgeXPCUAIHJ0o4UGAHhyzH69594sxKRws5eZCArfcjfiOE6kEuRDFMIASMwmksaj9wyrzjhvEcqpMFFVVVlu55Ozo6PjTqe7v7/HTIEkhojLopzPa7Hag9F83oRSuEhDml+J8hCooH4SqfnZq5cvn/YHg43B1tOnU0Qk4iwzbet0BARcLCvbNgcHewE2AIAnT54Ag/e+bRtrLQoUiNZZbdTjlz/xvinLyphICNG2rRColEYEpbRztmkbZtoa3Gc+dN46Z4k0Aztv27a11l0FM8StKN7rhQ92fphG0WJy6j2BwHfffXir+sZn7XhSCyEwtvo1nXFeqwbvaXL8WRQZlMK5ajwpj0+e1XWz4lMAX15fo8k6JQIv5/MH999FvHCuhFRl8cnJ6Rl5AoB5I16e6tZ67721LloogdLTqvEGEx/gb5/fLcCf8ief/l/PTv7tx0e1c2CtlwrIY9gom7sRK0UI6AkFEuJssvzewX81nj+dnPy0bhbl9Mcf/dH/0bat1spZRoFNbXfuZFnHBGwjPGs+K+/2f0+Kr0RjYWZElYoxOrWxtdnvvRbgKYrm1fEMETc3s6ryzG+Ri1PhFIpSW9ZnUigK5doGYn2J7XNpe6FAgFWbyo0Eu7302sL6zge/vaa3rLHlpmnm81mSpJ1O6FqxMmvXzzRg8jpLd1yzFARaiyiWAblDhESv2sFJJNsSCDAyqaq6bVnKTqyULb0CSDItUHhNApEizqIolpIZvCfvCAXGurEtrSj+N+TymgMApdSLl8+gjgcb3apczCYjYpZSEnkh1cGdO+vEQ55H7703fPJ4Op/VQvLrw99b1YDA7EmOZTqp6zJKlG2pqb2OBJ6b7k7PnMOlVBbuu+/83U622gFVVdd1BddoMudDWL+PlFIKFVq0nP/xlilgdjvDX9/GH9SzEwBx/+F9dRkdODcz5ZKePp0hIsU+0RQN9rc2f8vOj+qmdd4/fPhOklzn0QBAtaTHT6ZKStXDqno1Kl8URRFSDpd1UNf1crlcp1ED2O5qQERrHQpB1goher1BFJlripQClZZt49+284gCQOfcaP5SqMVsujBGNY1zlk0k28YTsZB4N13vRC6aer6YrNXAN1iuztmAQYYpAwhd3ZqmbYQUWqtr53J4z/N5xhgXyE00GG5t3uiAhAAA3tGLFxNm6vRigeLo6EnWG8S5ado6imNh7cuXT43plaVAhFA1XSzawMWTUgB49sxEQuC6COXyYC5TQ8Jf0jRdNJYFeOek0kbrUAwZx9ebPraWAob4thI4rOL+/t+LpV/EJ3GaP3xwP9RQXF6wk3H14uUCETuxi/R1/+98ltDa5o///B97HC8Wc6Wla8lar5Tsbpg4EThHcSrWwV2g/Bcz9xsf/DeDzi4zA1EjO9Js+XL8+PGTJEl3drYAYDa180UjpSDPaaZNZJTiuiJg2tvdE6JBOlL9jZ3trXNiBwbMODiytM3O+sdPpkJgmmmB7CGK4/hyq6y1CCGS5AqcExmztLOSHAICg9K6adujo1ebW9vX0M9y2VrLUaSY7Vs5AcFTEgM9QpFuPHi3k5+P7JKabeun0zaJTacXWdv+7Gc/DcU2iFiWZdu2xpgsy6bTaRQb5+Ik3XYqJS/SVJNnITGLdBKriwJ8BNt671khRNKOzibo48ViMV8sav9sPH8hmIIL+/Qo9t7VtQtpdwCIY12WDSJax0ryg8MP86jfyzYsN7PpDAWGFihXZxalxP397slx4RxpFfxzvtVhvRwwBiGmui4F+NnoeP/O4ebWYHNrI1zYtCtUSiBOJtWLlwutZQSqLMte7y1C9HCGkZU7iVF1WVZl2ck7SRot5q5tKZTlSCW00c6SbcFZ+OD997e2NsM7LJfLpmmMMYFOkaVJ1LmTKCqSUZp37lyuY7xaWT0dt0fHJSJQareGUa/X7fV6g8Egy3c//sTevXcvHBdNXTdtG/KLoWEYApZlKaWI41jJSIp4fDLvxZutnQVOQhTHcZLI6/Ve2O1GRdHMZ62LRGj8/BVFCOXts1l5Bgpeno1fjS71c1m9Egd6i0d2DioPwMJEP3g7NSDi8+OPgJZ1WXhPed7pD3rTSRWIMIiYpir0BmsabzR8+P731kfqOueOq1S7BKi1VihoNh/v7W2vM7TPn88XRSvEqvRqsWiFRO9ZihXVjZmBxc+/+L9fLn70+Y/m1nJdOSmF0oI85z2ztRuv5k4AIi5HZcIfvLf3n4X1S8xCCO99U1Wz2fzWZAlRKFlg+TYN2xDhm49+4y2+8PaimFkpfbizVTep3N7FUJ1PvLMTnzudQJ62t9ZhrbzZ6ZAvWrQwIlrXOucH/f7nn316cHg3jiMA2L+z6n8XPMWdHSbiJ49nzl/QwhlIy92N7vd8U1gH0TAxkQy1IUqLRKvgLc3nDSLm6LXY2NnZ9CgW4LkmIVW/35/P56fHx23b7u5cwSqq0pali2MlJIY2x19dltXMudWmDBRCWAFrqz2VxF2jIwBwzi6rKeKVfA0DsF8tISl1nl5fIiEP3P7ki39G4nQ8GiNC05CUuO7lnPXM/kEwGOicW0xho/8/aHVLI0dYxQIBh0dgQCHatg1qEAIvcxeEwMmkUlp4vjgfnLNb/W/uyO/Vi4mQ6uBg/xbvm+HJk6X3TMRCLpk9MEkpWCprbWttyMo1dX3hsAFY609Pl8ZIKQUzNW9s9H1NiOhf/eSfVP7ZdDIWUlrrmYA8b+2nvb4BhMl49mD4+9959HsA8PLsZ//m4z+Qaj4elUqLtqG29iaW73zQlxKbpm2K9He/94+S+Ir1Usw8nRUduSX01uBObLTxjoTAwGFBRKWFQF4UrZQiVkKadjqZRzoPMVrTXCmjXUUEiIjovFdSOn8LpAMAztFi3hCx0atUmjFmsSiMmgy6ieoONoe3m7gXL+bLZWMi2R8k87kP6LAQAvG8azezUsq2TVXV2SUCh3MslUABcA5dfkU1MHMWPUpwN6FF21J3K6uqmhliqWQNSZLmA4jVbl230+nk6PlkN3+AKt/tRIgoJAjEpnFUs1YiVVgbutmfQ+V5TkTvHPxOFOUmzkP5AsAVi1ot4eho2Vra2EiX0Zz83DkbtktI6F/GRwNnQyu1XC7jOOLX1HdOJ1XdeK0lAAS0Sil1cGd/XDQFRHZ2fHJylKbZvbuHTe2ePpsJRO8py6O2ddqItnUnJ4WWAdFCxNCtLNDbKWTUl8tyrYbQLwYRLxXaffUNwfs7vxEpOR8dMWC3263rSkrJDE1db2zsJEle1ZPR6JSZNwf3Njc+bJ3Z3OyvJ3Ax49PT0nna2sqXy9nNtvdKa721ufnnf/F5XB4vpj9rW7u1vZ1n/WdPZ6FnWq8fl8sWEJvGzQpJrvnWh++k6cWequv6JkzNwCE2quvqiy++cM5JKQ8OD41e5/HPK38vfw1FuXz67NVHSZQA4HQpx4uPm6YlRgh11EtBxG3riFgp0e/sIN6tmqIqJnZx3DQ2y3Mmaq1tmqZsplGyGljb+tPRRCqhlGAmJektsjYMRM6Td75lAGLL4Ftr4yRWHsaTl1t6B5EQcWNjY1mVn53NjX32i88LFOL+/fuRMU+eTK0lYKhaNRhI5usA+CqmzfS4aYukI1KQrR+N52d5HxkYAAkg7jAzmJQRAUHpN9Z2IQoUK398nRgRQmhtlLqI8c9jVWRGIWW4BhG+8c6vxGoYZe0nT/65VM208s5b9qiUzLpGKQQEaR0KlFJaOPrTn/54M/s++qXJwGTIVIxGZ0ab/rBHXD17+dH6iWnvIiPYSw8X8/lX1cQl3ggzoBCdTj5fFK1NiFMABoiYLAAQcWRQ+ccsRWcAwHQ6/gwAVIQqCgrlooz2d6/TfFbz8ujBr90sRl/jFK8rRr8+WkRAoWmCPk6zPDImZPnPa0bEeYsmcI6q2goBSou25T/5l3+yv7/3+PHj6XSaJMnx0anKZgW/EqIuFg0T2NYzwEGWR0oyAUgAZkfIzPNlvdP5wcODb3tyQbvcfra/tzcMWAjfPvLZdN42z621QggElOpLcDgMR56QYSaIWCBIARZRK6RzL4jIdzob337/b375ZF0VFfoM/9Gf/c8Ox3W1hNDQy5KQuLOfng96+cGd//Te3i3VVLB6PDGz975pWw0gENKsk6UJwKrd8LXrnfNN46vSZXnkHOZ5nmVpkiRZlqVpOk/ng8EHe53fkdVpkZZ37hwOh30iXls2IXA0Ko+OCgTsJK6TJiaSRKs4Js/TJI0B4NXpx//uF/+MofBMQkBdeamQPEeJ6g102yv/7PG/AITZdPnh4d893P3Ol0wVrjokBGEGIYUkDOT21SVflz2pAIHI2fmpkhNRlt4hEaFnkNJHdYiio7ZqitnrbqG1DnUAy+VyND4ztpf19WQyevZk4bw3UbSzvdO/2rghjvWDB4MvPp+cHhcmhu9977tZljnnu91ukiRFUURabpjTWvYevvNecHOFvIBx28YvC8rSpNONm6ZSSgZZvdJ5mYy1HjDWAm3ZSq0jCQgIko2UsYpMvtFaJxCN1HX9xm70wXVnJmK+hHa0rQeW4cd/Qm34GgVh5j//5A9re2JtzYwMrE1oOgJZR0uJ5bK+u/Xbh7vfPVcDAALez78nyqPSz5LELOs2zYxW3cVZKC+HvS0m9VqEREoZuqKXZelLQmREYOIojjOldnZ3A/X6mjx5Mq0bl6TG+cZ5AgDvfV3Xw+EwTdM871iVatFMpzOBoj/oFgvvHAXqIyJora0lZ4Hcaxdgntz5xoN/IJtxVdW7e/u93hVXvSz8F4+nUop+Qnn0xoQlrmvfPEOIcth7LxQA8eWOiuvd4L0/m3zucFQslsxoWx/FqqkdERw+7JgIi3Y5nr1zRQ2AQuz+aixaPx9LbTLvlVZxtOGWTgq0jsxuZv3NNjvXpW3bw8PD5akFoNCdoaoq29pb1bC3mz99NidipfDo1Usp7iyXy06no7WOooig/ezJR9IVVdMg4PbO9rLwRdEAgBCYprooLCK0rTcKv9O/UsJ2cUQACAHOtVKL+ezs5PTVo3ffXV+W5vLDbw2fPZvN5+1Xo2IH/OYiVR6SMWuXD86riYUQ83nxcPhbcZyZbGtrOCTygdHyxReTYtGm2uwPJcPFr9QET0lkYixVlu3f63Y63ntEYBbVs7knSju6bHB0NlJS32RUrkFKRFwsFnESMxuFGExCkiTLZaG1utmrRSmhlWhaD8jz+TxN06IomqY5OjqazWZ37x7c296F876LRNTNQOyJQDeOTAQXfTowjuJ1FHktokQEIZAJpFRSeOvstUb7V9MNrxG+MNG8UvO5AoJXeH5hQIV7vV63kz87yU2s62Ly+exJr9cbDgeLuVUqHgwST7yxkdX15GI2As2GVN9oTd4tFvMkSbQ2VemkEtQyE8Sx6nbz9GrH92vDR8RQVVCXK9K99z5N0+lkoo25qQbnGQCYgICjKAoQfzjWsyxDVMP+vdDgj5nxvExc8UJpFcfJCg0EAADvvXd2Paeh0mI1KgCtta1qRzQYDIqFE4JCAjYANgjQ7cVSvNE2nGcL8fx0Ukoncd5aOE/Xn2+OcxFCnY1+/LyZONsCo5nE6VnaVE1VtgDIwMdT3Nt8tA1bAIAYknXM04WNlV3OJ877fn+wubkxHi2ns0YIXBRMZIyRt3YbvyyhSqfhhpmAgcgTkdZ6uSw3bvzC3/FRsVy2UWKca5lX5cBKKa1129qqXvz88R8Ks2xtHUWqmLeA0N+IABkBROiUfG0VANR1I/3+h/d+f+2bBeSVvEfAwWBweloWRYmI4WSbzxvvudvVX6VQhzx5T0Iqa9vNrU2j+fh4AXJVlRCedjEcgd/74De9dyjUsno6G33ux4t7D76bd+8AU7DzRsfO15+8+pcJ7ysA8ESjo0+0USiEs275avT4qW3PUX4A+MVn029+8L1rrMWbwszAvIwhM7KZ1I5IKvXwnXcAoCrts+dzIdA7yjtRXVtElFKQJ3L84MH9brfb7XZ7vV6aplobpaFqS431YrZsY11XjhnSLkaRZGZP12svvCUU6Nmyr9dVpIDgvJeehJSBhrO1lW5tXaBMm5vp82ezo6Nie/uNwDcDM3gKcfJgOpm0bUssiRkJ6TxLdG1hKGWUMgCwWDSNn/B4jne9UobOC0e8o7JZTseTqLMTgG61tdutmwIRgJFBAkiE8ywgwuZOvrP7JXUAaxEIwGyMSZRSUr58+TLPO91u5969XhioVIKJJ+Nq5khrqZS+IAyfv7eS0cPD/zIRbZFMsrx79+4dWP8y4Q1BgF/8xci2jAJ1VgMSgBiPx6PR2bDrmmhw7/79a19x1n/2+cR77vbira30srW8/QHn+DwRCSmICEEiIgrA87DhdTbm1fjl87Mnvrv4+U//J3JsYkmelREbWzECeOU+fvLFKorudrsZa4CLZsSrxzMAgPeUJrfnn2+V0MMfANq2KcvSRDEARNEVtoIxUmkhBDBfxD5lWVpry7Js20hJKYUAhChSH3300cN33o1eD6J844PNYtE+e74g8rPZDFHM53PberAHqMrT09O6rrU2u7srMEdp+eDB4MWLeVM7pSBNL3bD61kzgCK4HlIK6XkF3QvB5+mHi+vXP3WLKJuq1agkD00sV5iCZAZGpwWiEeDaViEikfuzj/93VqPR2TSK5WLWdDeivcOUecVSHY/m39j5+x88+KoxOgMyMeGqhI1XVZW0Tj1i2DLEjonPcecoivr9fmioF0URti6AouFnOuq6eoMa2sadjco4lk2DURQhijRNtdLAkijUz3mlaDKZ9nq9cNgaI+NILRYtIC4Wi243D7NdVdX130kNYz5P9UCon7wCkqzSWXBOsVksFqEyrm3bfvzOO3vfbinf3r5I0hwfVWenldRie6sD05+Hoiu1v/37kWx3zNhEye73dxBACGwa9/LlQkixH1EirzaPfYMOGJicJwotzrVSnqmu3OMnUwAgz91eVFUWAJ3zWivbOOCVY2OMkVI65yJjEMl7LwQCYrfb1epN1B8hhUDwDFrLoIbw41h2yiw4VGkQ+ZOT47yTi3MWETETs2RcFIuqGgTD3jTNNUbBev4DZrOqkAyFugg3G+KHRpdrbkdledSqZvLsZDRDir33WR5551FxVbl5wXnOarFYfPrpp5tJlqV71LufZ3marb4/Gbc7w0YpQURaf/lPqiAiMHgiYbT3TkrVtm2v19/d2WHm99/fXI8XEU+Oi9G4AmAdhbTPBQwAq6xhgwK0NlLIra03WaYAeg+H6dNnc6ku0rGrDu/nzV8E6rDY9bkNDz+uROFHls5rT5VSN38QgRkolGoyA7MUwhMwMxNe+El8PgmXUA0AIBqdnv7ivGclAkA9RwYmAiK2U1EuSIUiXC2dEJzEeZLGAZW0lmezqmm87kRpKt/QuOvSWFlIORn/6MQVzlqBwpOfVubFqfHkg7u9pt4550O7bwDY3vnh1cYbiKhycUaY7+3fudnK6pocvVqMxpUxans7m86ac6gYAWGRQuSwqlsp1WA43Nu/+lMNIRQgPrhzcOvv8125FmGdOvJEAHJlGy5M9HUFBLl/8MH9gw/ecOezs5HKsuzO/t5PPn8a1aNi8klj7ebm1p393ePjxXhcC4GTOe3uZdEbz4Qgwen6tW//LhGtA5vAWG3bdjIZmyi6ZMgubCF5ODs7C5WH3vuqqo6OX8V+K+nh8dGrEAbu7r72B12Gw3SxaAG4qtxFZTIzAEpET6t+oNPJRCk1HA4RcTqtytIBoFJisBEDv3Gv88pNEquGmiKY6JWndOkXFr50il4zb6SYGYXM9KRui6QrUlCOx4+fjxEhPa8wmy9PDne/9aW3O1/OQt74YcMkSeJ4/w0D9d5Pp9Ow1oQQUoZWTYgCkbCq6pcvX3a7vTy/pXm4ieTmZnpyWhJxvPbHEABQCKWUcdZrZaqqzlMZBpnEcV3V1rk4iqRQ7vZ8OVy+1eW55nUeY3WCXo+i31ZUAH8ePfi1N1+3KEbz4iw0qMLzCmQAIAJmlkLl2ZeQ1NaI2K1CRKGm3Nr/r70r643jOMJVfUzP7L3cJUWJpyVDdhBZSBD4zU8G8pSX5A/l9+Q9fyGAESSAgQAJktByJJmklueec/ZReejhckUuyRVXBoyEH0BygRlOz07NdPVUffWVvgwKIbhy5Ue31LoiolJcCpZlJgynQ7CiSN72/s31ME1TKYM8y7rdbgHnvv1Mmpv9g5HgjMBtbTwBuG0N4t9q/NTqfLVTqaVxoZS6HBZiHh8c//3P//gDsuHJ8bjdCUeDwhoXRsJa2titCQnxgH/9y98v2eCdc64uBJvjZOIpYF63inPeXV29qdsYlL0KnY/sQ1mJ5pqNxpM8AFxDRN/0xDkqigyRjcfxq1fff/HyBUN0znWuxVrmDjGlN3DGjHfRNOui728MscijxKG6Vt1morbRDoXgbtUBoNZmEuvIikhxFRqytx7n0iPcMATnxhivqOY/T2N3nAtEODs5+W5v7+mzTxv1ee2KCXxlsifL+GGUquxszs+pZakZnrLdjZezR7gl0YtlPJVNXTR6F82nefelJ6U7d4rUyoud3xQUrK52p3d8llDvKE5Ts9atTSYja8k5CwTf/vOPcf5O69R3HuGChZEQsjzFOE63Ol99svHlte+J3ZmS7DBUg8OMQCultDaVSuXk+Hh7Z3e+DbxkLgOGfDLu7+8X9XpjPJoM48PXR98ApgDEGBa5ZRx9S7ei0IP+IPnLN62VcLp4S9O0W335+SdfzxuhVFHzlIBLF+1VJC6ZrPfEouUQOm7qoP/mzX/SLCNH1tnnz59v71S/f3V+dDRgIpvsDxuNBgH1R+80HE/GEyLIM6sUb3VVhQtfsJe7ZDA+unM4f2uyizSLcy6qVK7XUngY44ajXAqOjCWJ9VULjPFJOhrFPcQsSYrSDJ5V5itJGQ5GvaisViJEzG3aHx/OP5vyL8110fcTaJiFYIz1+32YmdquPFxE9PbtDxuNp+ScdU7KYGt7yyfUtC5lWKUMdneeam0QYWv9t5JD3O9xqZ49e+rvIKPt3t45ItYZNcKFSiQNB4lojPHRci8GNndPIsozU2jXbAZJIqMoklJyge360+fqs8gNz/t9Y8yj9cebG0+cc9PiFyJyDsi5ve/OEbEdoAqLOdMT+oA5OOuI3KyLBh9wXNYKIBqNRrvdvuVIiJim2Un/gHHUWgPi2zc/aF14SRutXZ4V+ixfW/0CAA4Pe8oOa2G9ubnbbl1KKvTeJWGowkhIyfJidOdpIUEqSXC0xiDjnc57xehXkk5SciEYAaaprtYq7Xbb020ZgoSDwrVevvzFNGh/ZTHNORzsj6SQKhSVSjCJ+3ADiIgLLqXMsmzqogFme+GUl+vOb3cdM3XRtwDNq8NvPOHOWIsA2hgq6dlIZK1lAC/q9YaU4rQfQhAZnZ2enkdRVK1GeUZEXEp0FqutCHGxVrNe4gmRyL1710vTpMjzqFrd3Nh6/bqvtSMipQRnmGbGX4UwFEVmvJGyLBuPJ+1wnYl8NB4Vee7Z/81m64olOt0KQZKmRgjD+RxKFuccGUewUF5rstYCXbxFM2QM3cU/3e/RWMg3PHm82Wz9bmpuuHamjPFQ1QBAqbB39jetR3kyNtZWokqn20nifDDIAcA5qg/kSnP9Edydvbh4kyvdQxBIY8xKe4VzfPZsZeZcAAAG/ax3FDuHKhRFUQghoyg6PTkFqSwk49EoS1PGuRCy0bzaYyUMRa0qk0QniSZIDw4OZmc/RBwOh4yZdntFNtv1ei2KwiiKiBhnvv0B14U15r2y5Q/FQmZAZNcp+TfsiZ/tfpoXCSIrp1TnVpq4vVmen7OuWrl7kW6dS/onLuB5ngNREmfO2ULr/f3D67L8CFBomyb6LC2CwNbrSgh9MWM4AtLGCCGsc1JKMa/CxLlyog+UqNWqsy9A/sqaLOaELJBeENA5B2BlwEfDvFoPjHFxkgWSjDFigajPddy/Zf1NqNc6dbjarOVDQUT7h98yToyxqSSq77J0uc/7DyVjmOd5vdr9cmXKl8GzjERugUiFYZHn5+dnaZru7O7MGsNad3aeBoEvWJLN5tUbrlavHr0eOo3D8dnpyUkURWmaBIFqtR5NxkU80VjDs9OzSsQR2dramrkjNjIHH98MHwWVSuXLX31lrCdMzBCP7oIKLlPN1jkG0lkiwm53TXCvh3l15mDIOON+kUvzSCfW+twUA0TGOGOMCB6tr+scaXpy6Fex4GW5pgoUC+InagZE7LSX7R9sbPLm7V/R5tbRMPvX5Yb3nSgBjccFABC5TusJ4hzmA7tIRRgyo+HQ83lMkTOGiMA56/V6mxurnU7nsg3hh+AnaoaPgtXO42bj1+A52LcuYLCMVpLgc3IbCKAFcIH5JANkUaUCAONxmqQukCwvnFL8xc8/39rauJNDdBP+l82AiCq4z715FQSGg2XIGRdSElGR5+NxnGWIyDhHIVijUb23DcD3iHjAHcDyJQYR4jjmQjDOsmyIOFDKAYB1lyWh98ODGT4MrKTncmtdoMJqteqJAUtEVwH+tyeljwby5PAytOpToVJKXegJDKVUy+d9Hp6GxYDT3+WP571zX77nlglyAzyYYSFc1FqRKxv1cs6dAyKmlPIqKEuKgT6YYVGUSQrGhOQbm5tPHm8XRe38zGapEZIt+TQ8+IYFQAAAzrq8yBGDeBJ+Hw+IoNUKR6PMd/B4cNE/PsqFECkVCiGybIDIGIMsY5xXifzyaakRHialxYGe4RgEqBSXUhiDSgkiveQgJAAAAKtJREFUryi61KEfzLAASiJs2TAWkQkp2601okqeGyJajhgE8GCGheA7oZQNXwDIOWfJd14jr3m2nGcAEPyDhLb+L8E5n/JXjaFCN4zFNEmazWg8LjjnxrhlLiPnXBwfH/tSDrjIo87N5N20iS6E22/a6j/ctAkvRd8XGu72TT/GVwAAcrS396dxfOKMAWSMSR9fEoIVhQMAAru9/jPEL9xMUd6CZ8I5Pz4+/i/KldnrydxbXQAAAABJRU5ErkJggg==', NULL, NULL, '121');


                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000336773 12576130370 015413  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT lnk_inv_notaenvio_inv_notaenviodetalle;
ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT lnk_inv_entrada_inv_entradadetalle;
ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_fos_user_user_inv_notaenvio_1;
ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_fos_user_user_inv_notaenvio;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_fos_user_user_inv_entrada_1;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_fos_user_user_inv_entrada;
ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_fos_user_user_fac_notaremision_1;
ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_fos_user_user_fac_notaremision;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fos_user_user_fac_factura_1;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fos_user_user_fac_factura;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fos_user_user_cxc_cobro_1;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fos_user_user_cxc_cobro;
ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_fos_user_user_ctl_proveedor_1;
ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_fos_user_user_ctl_proveedor;
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_fos_user_user_ctl_producto_1;
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_fos_user_user_ctl_producto;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_fos_user_user_ctl_cliente_1;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_fos_user_user_ctl_cliente;
ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT lnk_fac_notaremision_fac_notaremisiondetalle;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_fac_notaremision_fac_factura;
ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT lnk_fac_factura_fac_facturadetalle;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_fac_factura_cxc_cobro;
ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "lnk_empleado_MM_cliente";
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_zona_ctl_cliente;
ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT "lnk_ctl_zona_MM_ctl_empleado";
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_unidad_ctl_producto;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_tipofactura_fac_factura;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_tipoentrada_inv_entrada;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_proveedor_inv_entrada;
ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT lnk_ctl_producto_inv_notaenviodetalle;
ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT lnk_ctl_producto_inv_entradadetalle;
ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT lnk_ctl_producto_fac_notaremisiondetalle;
ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT lnk_ctl_producto_fac_facturadetalle;
ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT lnk_ctl_pais_ctl_proveedor;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_municipio_ctl_cliente;
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_marca_ctl_producto;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_forma_pago_cxc_cobro;
ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_ctl_font_size_cfg_formato_documento;
ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_ctl_font_name_cfg_formato_documento;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT lnk_ctl_estado_inv_entrada;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_empleado_fac_factura;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_empleado_cxc_cobro;
ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT "lnk_ctl_empleado_MM_ctl_zona";
ALTER TABLE ONLY public.ctl_municipio DROP CONSTRAINT lnk_ctl_departamento_ctl_municipio;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT lnk_ctl_departamento_ctl_cliente;
ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_ctl_condicionpago_fac_notaremision;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_condicionpago_fac_factura;
ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT lnk_ctl_cliente_inv_notaenvio;
ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT lnk_ctl_cliente_fac_notaremision;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_ctl_cliente_fac_factura;
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT lnk_ctl_categoria_ctl_producto;
ALTER TABLE ONLY public.ctl_empleado DROP CONSTRAINT lnk_ctl_cargofuncional_ctl_empleado;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT lnk_ctl_banco_cxc_cobro;
ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "lnk_cliente_MM_empleado";
ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT lnk_cfg_plantilla_cfg_formato_documento;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT lnk_cfg_formato_documento_fac_factura;
ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fk_b3c77447fe54d947;
ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fk_b3c77447a76ed395;
ALTER TABLE ONLY public.acl_object_identities DROP CONSTRAINT fk_9407e54977fa751a;
ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT fk_825de299c671cea1;
ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT fk_825de2993d9ab4a6;
ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b806ea000b10;
ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b806df9183c9;
ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT fk_46c8b8063d9ab4a6;
DROP INDEX public.uniq_c560d761a0d96fbf;
DROP INDEX public.uniq_c560d76192fc23a8;
DROP INDEX public.uniq_9407e5494b12ad6ea000b10;
DROP INDEX public.uniq_8835ee78772e836af85e0677;
DROP INDEX public.uniq_69dd750638a36066;
DROP INDEX public.uniq_583d1f3e5e237e06;
DROP INDEX public.uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4;
DROP INDEX public.idx_b3c77447fe54d947;
DROP INDEX public.idx_b3c77447a76ed395;
DROP INDEX public.idx_9407e54977fa751a;
DROP INDEX public.idx_825de299c671cea1;
DROP INDEX public.idx_825de2993d9ab4a6;
DROP INDEX public.idx_46c8b806ea000b103d9ab4a6df9183c9;
DROP INDEX public.idx_46c8b806ea000b10;
DROP INDEX public.idx_46c8b806df9183c9;
DROP INDEX public.idx_46c8b8063d9ab4a6;
ALTER TABLE ONLY public.ctl_estado DROP CONSTRAINT unique_abreviatura;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT uk_tipofactura_numero;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT uk_numero_fecha;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT uk_nombre;
ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT uk_empleado_zona;
ALTER TABLE ONLY public.vs_database_diagrams DROP CONSTRAINT pk_name;
ALTER TABLE ONLY public.mnt_empleado_zona DROP CONSTRAINT mnt_empleado_zona_pkey;
ALTER TABLE ONLY public."mnt_empleado_MM_cliente" DROP CONSTRAINT "mnt_empleado_MM_cliente_pkey";
ALTER TABLE ONLY public.inv_notaenviodetalle DROP CONSTRAINT inv_notaenviodetalle_pkey;
ALTER TABLE ONLY public.inv_notaenvio DROP CONSTRAINT inv_notaenvio_pkey;
ALTER TABLE ONLY public.inv_entradadetalle DROP CONSTRAINT inv_entradadetalle_pkey;
ALTER TABLE ONLY public.inv_entrada DROP CONSTRAINT inv_entrada_pkey;
ALTER TABLE ONLY public.fos_user_user DROP CONSTRAINT fos_user_user_pkey;
ALTER TABLE ONLY public.fos_user_user_group DROP CONSTRAINT fos_user_user_group_pkey;
ALTER TABLE ONLY public.fos_user_group DROP CONSTRAINT fos_user_group_pkey;
ALTER TABLE ONLY public.fac_notaremisiondetalle DROP CONSTRAINT fac_notaremisiondetalle_pkey;
ALTER TABLE ONLY public.fac_notaremision DROP CONSTRAINT fac_notaremision_pkey;
ALTER TABLE ONLY public.fac_facturadetalle DROP CONSTRAINT fac_facturadetalle_pkey;
ALTER TABLE ONLY public.fac_factura DROP CONSTRAINT fac_factura_pkey;
ALTER TABLE ONLY public.cxc_cobro DROP CONSTRAINT cxc_cobro_pkey;
ALTER TABLE ONLY public.ctl_zona DROP CONSTRAINT ctl_zona_pkey;
ALTER TABLE ONLY public.ctl_unidad DROP CONSTRAINT ctl_unidad_pkey;
ALTER TABLE ONLY public.ctl_tipofactura DROP CONSTRAINT ctl_tipofactura_pkey;
ALTER TABLE ONLY public.ctl_tipoentrada DROP CONSTRAINT ctl_tipoentrada_pkey;
ALTER TABLE ONLY public.ctl_proveedor DROP CONSTRAINT ctl_proveedor_pkey;
ALTER TABLE ONLY public.ctl_producto DROP CONSTRAINT ctl_producto_pkey;
ALTER TABLE ONLY public.ctl_pais DROP CONSTRAINT ctl_pais_pkey;
ALTER TABLE ONLY public.ctl_municipio DROP CONSTRAINT ctl_municipio_pkey;
ALTER TABLE ONLY public.ctl_marca DROP CONSTRAINT ctl_marca_pkey;
ALTER TABLE ONLY public.ctl_formapago DROP CONSTRAINT ctl_forma_pago_pkey;
ALTER TABLE ONLY public.ctl_font_size DROP CONSTRAINT ctl_font_size_pkey;
ALTER TABLE ONLY public.ctl_font_name DROP CONSTRAINT ctl_font_name_pkey;
ALTER TABLE ONLY public.ctl_estado DROP CONSTRAINT ctl_estado_pkey;
ALTER TABLE ONLY public.cfg_empresa DROP CONSTRAINT ctl_empresa_pkey;
ALTER TABLE ONLY public.ctl_empleado DROP CONSTRAINT ctl_empleado_pkey;
ALTER TABLE ONLY public.ctl_departamento DROP CONSTRAINT ctl_departamento_pkey;
ALTER TABLE ONLY public.ctl_condicionpago DROP CONSTRAINT ctl_condicion_pago_pkey;
ALTER TABLE ONLY public.ctl_cliente DROP CONSTRAINT ctl_cliente_pkey;
ALTER TABLE ONLY public.ctl_categoria DROP CONSTRAINT ctl_categoria_pkey;
ALTER TABLE ONLY public.ctl_cargofuncional DROP CONSTRAINT ctl_cargofuncional_pkey;
ALTER TABLE ONLY public.ctl_banco DROP CONSTRAINT ctl_banco_pkey;
ALTER TABLE ONLY public.cfg_plantilla DROP CONSTRAINT cfg_plantilla_pkey;
ALTER TABLE ONLY public.cfg_formato_documento DROP CONSTRAINT cfg_formato_documento_pkey;
ALTER TABLE ONLY public.acl_security_identities DROP CONSTRAINT acl_security_identities_pkey;
ALTER TABLE ONLY public.acl_object_identity_ancestors DROP CONSTRAINT acl_object_identity_ancestors_pkey;
ALTER TABLE ONLY public.acl_object_identities DROP CONSTRAINT acl_object_identities_pkey;
ALTER TABLE ONLY public.acl_entries DROP CONSTRAINT acl_entries_pkey;
ALTER TABLE ONLY public.acl_classes DROP CONSTRAINT acl_classes_pkey;
ALTER TABLE public.mnt_empleado_zona ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."mnt_empleado_MM_cliente" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.inv_notaenviodetalle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.inv_notaenvio ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.inv_entradadetalle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.inv_entrada ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.fac_notaremisiondetalle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.fac_notaremision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.fac_facturadetalle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.fac_factura ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cxc_cobro ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_zona ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_unidad ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_tipofactura ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_tipoentrada ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_proveedor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_producto ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_pais ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_municipio ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_marca ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_formapago ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_font_size ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_font_name ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_estado ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_empleado ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_departamento ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_condicionpago ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_cliente ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_categoria ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_cargofuncional ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.ctl_banco ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cfg_plantilla ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cfg_formato_documento ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cfg_empresa ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acl_security_identities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acl_object_identities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acl_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acl_classes ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.vs_database_diagrams;
DROP SEQUENCE public.mnt_empleado_zona_id_seq;
DROP TABLE public.mnt_empleado_zona;
DROP SEQUENCE public."mnt_empleado_MM_cliente_id_seq";
DROP TABLE public."mnt_empleado_MM_cliente";
DROP SEQUENCE public.inv_notaenviodetalle_id_seq;
DROP TABLE public.inv_notaenviodetalle;
DROP SEQUENCE public.inv_notaenvio_id_seq;
DROP TABLE public.inv_notaenvio;
DROP SEQUENCE public.inv_entradadetalle_id_seq;
DROP TABLE public.inv_entradadetalle;
DROP SEQUENCE public.inv_entrada_id_seq;
DROP TABLE public.inv_entrada;
DROP SEQUENCE public.fos_user_user_id_seq;
DROP TABLE public.fos_user_user_group;
DROP TABLE public.fos_user_user;
DROP SEQUENCE public.fos_user_group_id_seq;
DROP TABLE public.fos_user_group;
DROP SEQUENCE public.fac_notaremisiondetalle_id_seq;
DROP TABLE public.fac_notaremisiondetalle;
DROP SEQUENCE public.fac_notaremision_id_seq;
DROP TABLE public.fac_notaremision;
DROP SEQUENCE public.fac_facturadetalle_id_seq;
DROP TABLE public.fac_facturadetalle;
DROP SEQUENCE public.fac_factura_id_seq;
DROP TABLE public.fac_factura;
DROP SEQUENCE public.cxc_cobro_id_seq;
DROP TABLE public.cxc_cobro;
DROP SEQUENCE public.ctl_zona_id_seq;
DROP TABLE public.ctl_zona;
DROP SEQUENCE public.ctl_unidad_id_seq;
DROP TABLE public.ctl_unidad;
DROP SEQUENCE public.ctl_tipofactura_id_seq;
DROP TABLE public.ctl_tipofactura;
DROP SEQUENCE public.ctl_tipoentrada_id_seq;
DROP TABLE public.ctl_tipoentrada;
DROP SEQUENCE public.ctl_proveedor_id_seq;
DROP TABLE public.ctl_proveedor;
DROP SEQUENCE public.ctl_producto_id_seq;
DROP TABLE public.ctl_producto;
DROP SEQUENCE public.ctl_pais_id_seq;
DROP TABLE public.ctl_pais;
DROP SEQUENCE public.ctl_municipio_id_seq;
DROP TABLE public.ctl_municipio;
DROP SEQUENCE public.ctl_marca_id_seq;
DROP TABLE public.ctl_marca;
DROP SEQUENCE public.ctl_forma_pago_id_seq;
DROP TABLE public.ctl_formapago;
DROP SEQUENCE public.ctl_font_size_id_seq;
DROP TABLE public.ctl_font_size;
DROP SEQUENCE public.ctl_font_name_id_seq;
DROP TABLE public.ctl_font_name;
DROP SEQUENCE public.ctl_estado_id_seq;
DROP TABLE public.ctl_estado;
DROP SEQUENCE public.ctl_empresa_id_seq;
DROP SEQUENCE public.ctl_empleado_id_seq;
DROP TABLE public.ctl_empleado;
DROP SEQUENCE public.ctl_departamento_id_seq;
DROP TABLE public.ctl_departamento;
DROP SEQUENCE public.ctl_condicion_pago_id_seq;
DROP TABLE public.ctl_condicionpago;
DROP SEQUENCE public.ctl_cliente_id_seq;
DROP TABLE public.ctl_cliente;
DROP SEQUENCE public.ctl_categoria_id_seq;
DROP TABLE public.ctl_categoria;
DROP SEQUENCE public.ctl_cargofuncional_id_seq;
DROP TABLE public.ctl_cargofuncional;
DROP SEQUENCE public.ctl_banco_id_seq;
DROP TABLE public.ctl_banco;
DROP SEQUENCE public.cfg_plantilla_id_seq;
DROP TABLE public.cfg_plantilla;
DROP SEQUENCE public.cfg_formato_documento_id_seq;
DROP TABLE public.cfg_formato_documento;
DROP TABLE public.cfg_empresa;
DROP SEQUENCE public.acl_security_identities_id_seq;
DROP TABLE public.acl_security_identities;
DROP TABLE public.acl_object_identity_ancestors;
DROP SEQUENCE public.acl_object_identities_id_seq;
DROP TABLE public.acl_object_identities;
DROP SEQUENCE public.acl_entries_id_seq;
DROP TABLE public.acl_entries;
DROP SEQUENCE public.acl_classes_id_seq;
DROP TABLE public.acl_classes;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acl_classes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_classes (
    id integer NOT NULL,
    class_type character varying(200) NOT NULL
);


ALTER TABLE acl_classes OWNER TO postgres;

--
-- Name: acl_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acl_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_classes_id_seq OWNER TO postgres;

--
-- Name: acl_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acl_classes_id_seq OWNED BY acl_classes.id;


--
-- Name: acl_entries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_entries (
    id integer NOT NULL,
    class_id integer NOT NULL,
    object_identity_id integer,
    security_identity_id integer NOT NULL,
    field_name character varying(50) DEFAULT NULL::character varying,
    ace_order smallint NOT NULL,
    mask integer NOT NULL,
    granting boolean NOT NULL,
    granting_strategy character varying(30) NOT NULL,
    audit_success boolean NOT NULL,
    audit_failure boolean NOT NULL
);


ALTER TABLE acl_entries OWNER TO postgres;

--
-- Name: acl_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acl_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_entries_id_seq OWNER TO postgres;

--
-- Name: acl_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acl_entries_id_seq OWNED BY acl_entries.id;


--
-- Name: acl_object_identities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_object_identities (
    id integer NOT NULL,
    parent_object_identity_id integer,
    class_id integer NOT NULL,
    object_identifier character varying(100) NOT NULL,
    entries_inheriting boolean NOT NULL
);


ALTER TABLE acl_object_identities OWNER TO postgres;

--
-- Name: acl_object_identities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acl_object_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_object_identities_id_seq OWNER TO postgres;

--
-- Name: acl_object_identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acl_object_identities_id_seq OWNED BY acl_object_identities.id;


--
-- Name: acl_object_identity_ancestors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_object_identity_ancestors (
    object_identity_id integer NOT NULL,
    ancestor_id integer NOT NULL
);


ALTER TABLE acl_object_identity_ancestors OWNER TO postgres;

--
-- Name: acl_security_identities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_security_identities (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    username boolean NOT NULL
);


ALTER TABLE acl_security_identities OWNER TO postgres;

--
-- Name: acl_security_identities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acl_security_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acl_security_identities_id_seq OWNER TO postgres;

--
-- Name: acl_security_identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acl_security_identities_id_seq OWNED BY acl_security_identities.id;


--
-- Name: cfg_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cfg_empresa (
    activo boolean NOT NULL,
    direccion character varying(100) NOT NULL,
    giro character varying(100) NOT NULL,
    id integer NOT NULL,
    nit character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    nrc character varying(25) NOT NULL,
    telefono character varying(25) NOT NULL
);


ALTER TABLE cfg_empresa OWNER TO postgres;

--
-- Name: TABLE cfg_empresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE cfg_empresa IS 'Empresa propietaria de los datos, para encabezados de reportes';


--
-- Name: COLUMN cfg_empresa.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.activo IS 'estado del registro true=activo; false=inactivo';


--
-- Name: COLUMN cfg_empresa.direccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.direccion IS 'Direccion del negocio';


--
-- Name: COLUMN cfg_empresa.giro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.giro IS 'Giro de la empresa, según naturaliza del negocio';


--
-- Name: COLUMN cfg_empresa.nit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.nit IS 'Nit de la empresa';


--
-- Name: COLUMN cfg_empresa.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.nombre IS 'Nombre de la empresa';


--
-- Name: COLUMN cfg_empresa.nombre_comercial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.nombre_comercial IS 'Nombre comercial de la empresa';


--
-- Name: COLUMN cfg_empresa.nrc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.nrc IS 'Numero de registro de contribuyente';


--
-- Name: COLUMN cfg_empresa.telefono; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_empresa.telefono IS 'Telefonos puede ser mas de uno';


--
-- Name: cfg_formato_documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cfg_formato_documento (
    detalle_interlineado character varying(5) DEFAULT '1'::character varying NOT NULL,
    detalle_x_col1 character varying(5) NOT NULL,
    detalle_y character varying(5) NOT NULL,
    fila1_col1 character varying(5) NOT NULL,
    fila1_col2 character varying(5) NOT NULL,
    fila2_col1 character varying(5),
    fila2_col2 character varying(5),
    fila3_col1 character varying(5),
    fila3_col2 character varying(5),
    fila4_col1 character varying(5),
    fila4_col2 character varying(5),
    fila5_col1 character varying(5),
    fila5_col2 character varying(5),
    fila6_col1 character varying(5),
    fila6_col2 character varying(5),
    fila7_col1 character varying(5),
    fila7_col2 character varying(5),
    id integer NOT NULL,
    margen_derecho character varying(5) NOT NULL,
    margen_inferior character varying(5) NOT NULL,
    margen_izquierdo character varying(5) NOT NULL,
    margen_superior character varying(5) NOT NULL,
    nombre character varying(100) NOT NULL,
    detalle_x_col2 character varying(5),
    detalle_x_col3 character varying(5),
    detalle_x_col4 character varying(5),
    detalle_x_col5 character varying(5),
    pie_y character varying(5),
    pie_x_col1 character varying(5),
    pie_x_col2 character varying(5),
    detalle_x_col6 character varying(5),
    papel character varying(25) NOT NULL,
    detalle_numero_items integer NOT NULL,
    interlineado character varying(5) NOT NULL,
    pie_interlineado character varying(5),
    id_plantilla integer,
    id_font_name integer,
    id_font_size integer
);


ALTER TABLE cfg_formato_documento OWNER TO postgres;

--
-- Name: COLUMN cfg_formato_documento.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cfg_formato_documento.nombre IS 'Nombre del documento a configurar';


--
-- Name: cfg_formato_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cfg_formato_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cfg_formato_documento_id_seq OWNER TO postgres;

--
-- Name: cfg_formato_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cfg_formato_documento_id_seq OWNED BY cfg_formato_documento.id;


--
-- Name: cfg_plantilla; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cfg_plantilla (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE cfg_plantilla OWNER TO postgres;

--
-- Name: cfg_plantilla_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cfg_plantilla_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cfg_plantilla_id_seq OWNER TO postgres;

--
-- Name: cfg_plantilla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cfg_plantilla_id_seq OWNED BY cfg_plantilla.id;


--
-- Name: ctl_banco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_banco (
    nombre character varying(100) NOT NULL,
    activo boolean,
    id integer NOT NULL
);


ALTER TABLE ctl_banco OWNER TO postgres;

--
-- Name: ctl_banco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_banco_id_seq OWNER TO postgres;

--
-- Name: ctl_banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_banco_id_seq OWNED BY ctl_banco.id;


--
-- Name: ctl_cargofuncional; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_cargofuncional (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_cargofuncional OWNER TO postgres;

--
-- Name: ctl_cargofuncional_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_cargofuncional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_cargofuncional_id_seq OWNER TO postgres;

--
-- Name: ctl_cargofuncional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_cargofuncional_id_seq OWNED BY ctl_cargofuncional.id;


--
-- Name: ctl_categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_categoria (
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL,
    id integer NOT NULL
);


ALTER TABLE ctl_categoria OWNER TO postgres;

--
-- Name: ctl_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_categoria_id_seq OWNER TO postgres;

--
-- Name: ctl_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_categoria_id_seq OWNED BY ctl_categoria.id;


--
-- Name: ctl_cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    giro character varying(100) NOT NULL,
    nit character varying(25) NOT NULL,
    nrc character varying(25) NOT NULL,
    direccion character varying(100) NOT NULL,
    telefono character varying(25) NOT NULL,
    activo boolean NOT NULL,
    id_departamento integer NOT NULL,
    id_municipio integer NOT NULL,
    date_add date NOT NULL,
    id_user_mod integer,
    id_user_add integer NOT NULL,
    date_mod date,
    email character varying(100),
    exento boolean,
    id_zona integer NOT NULL,
    codigo character varying(25)
);


ALTER TABLE ctl_cliente OWNER TO postgres;

--
-- Name: TABLE ctl_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ctl_cliente IS 'Catalogo de clientes';


--
-- Name: COLUMN ctl_cliente.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.nombre IS 'Nombre de la empresa no puede ser repetido';


--
-- Name: COLUMN ctl_cliente.nombre_comercial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.nombre_comercial IS 'Nombre comercial de la empresa';


--
-- Name: COLUMN ctl_cliente.giro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.giro IS 'Giro de la empresa, según naturaliza del negocio';


--
-- Name: COLUMN ctl_cliente.nit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.nit IS 'Nit de la empresa';


--
-- Name: COLUMN ctl_cliente.nrc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.nrc IS 'Numero de registro de contribuyente';


--
-- Name: COLUMN ctl_cliente.direccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.direccion IS 'Direccion del negocio';


--
-- Name: COLUMN ctl_cliente.telefono; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.telefono IS 'Telefonos puede ser mas de uno';


--
-- Name: COLUMN ctl_cliente.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.activo IS 'estado del registro true=activo; false=inactivo';


--
-- Name: COLUMN ctl_cliente.id_departamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.id_departamento IS 'fk - id del departamento según dirección del negocio';


--
-- Name: COLUMN ctl_cliente.id_municipio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.id_municipio IS 'fk - id municipio segun dirección del negocio';


--
-- Name: COLUMN ctl_cliente.date_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.date_add IS 'Fecha de creacion del registro';


--
-- Name: COLUMN ctl_cliente.id_user_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.id_user_mod IS 'Usuario que modifica el registro';


--
-- Name: COLUMN ctl_cliente.id_user_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.id_user_add IS 'Usuario que agrego el registro';


--
-- Name: COLUMN ctl_cliente.date_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_cliente.date_mod IS 'Fecha de modificacion del registro';


--
-- Name: ctl_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_cliente_id_seq OWNER TO postgres;

--
-- Name: ctl_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_cliente_id_seq OWNED BY ctl_cliente.id;


--
-- Name: ctl_condicionpago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_condicionpago (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_condicionpago OWNER TO postgres;

--
-- Name: ctl_condicion_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_condicion_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_condicion_pago_id_seq OWNER TO postgres;

--
-- Name: ctl_condicion_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_condicion_pago_id_seq OWNED BY ctl_condicionpago.id;


--
-- Name: ctl_departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_departamento (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE ctl_departamento OWNER TO postgres;

--
-- Name: TABLE ctl_departamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ctl_departamento IS 'Almacena departamentos de paises';


--
-- Name: ctl_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_departamento_id_seq OWNER TO postgres;

--
-- Name: ctl_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_departamento_id_seq OWNED BY ctl_departamento.id;


--
-- Name: ctl_empleado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_empleado (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    activo boolean NOT NULL,
    apellidos character varying(2044) NOT NULL,
    dui character varying(25) NOT NULL,
    nit character varying(25) NOT NULL,
    id_cargofuncional integer NOT NULL,
    direccion character varying(100) NOT NULL
);


ALTER TABLE ctl_empleado OWNER TO postgres;

--
-- Name: ctl_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_empleado_id_seq OWNER TO postgres;

--
-- Name: ctl_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_empleado_id_seq OWNED BY ctl_empleado.id;


--
-- Name: ctl_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_empresa_id_seq OWNER TO postgres;

--
-- Name: ctl_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_empresa_id_seq OWNED BY cfg_empresa.id;


--
-- Name: ctl_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_estado (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    abreviatura character varying(10) NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE ctl_estado OWNER TO postgres;

--
-- Name: ctl_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_estado_id_seq OWNER TO postgres;

--
-- Name: ctl_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_estado_id_seq OWNED BY ctl_estado.id;


--
-- Name: ctl_font_name; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_font_name (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE ctl_font_name OWNER TO postgres;

--
-- Name: ctl_font_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_font_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_font_name_id_seq OWNER TO postgres;

--
-- Name: ctl_font_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_font_name_id_seq OWNED BY ctl_font_name.id;


--
-- Name: ctl_font_size; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_font_size (
    size character varying(5) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE ctl_font_size OWNER TO postgres;

--
-- Name: ctl_font_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_font_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_font_size_id_seq OWNER TO postgres;

--
-- Name: ctl_font_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_font_size_id_seq OWNED BY ctl_font_size.id;


--
-- Name: ctl_formapago; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_formapago (
    id integer NOT NULL,
    activo boolean NOT NULL,
    nombre character varying(25) NOT NULL
);


ALTER TABLE ctl_formapago OWNER TO postgres;

--
-- Name: ctl_forma_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_forma_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_forma_pago_id_seq OWNER TO postgres;

--
-- Name: ctl_forma_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_forma_pago_id_seq OWNED BY ctl_formapago.id;


--
-- Name: ctl_marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_marca (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_marca OWNER TO postgres;

--
-- Name: ctl_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_marca_id_seq OWNER TO postgres;

--
-- Name: ctl_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_marca_id_seq OWNED BY ctl_marca.id;


--
-- Name: ctl_municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_municipio (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE ctl_municipio OWNER TO postgres;

--
-- Name: TABLE ctl_municipio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ctl_municipio IS 'Almacena municipios por departamento';


--
-- Name: ctl_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_municipio_id_seq OWNER TO postgres;

--
-- Name: ctl_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_municipio_id_seq OWNED BY ctl_municipio.id;


--
-- Name: ctl_pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_pais (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE ctl_pais OWNER TO postgres;

--
-- Name: ctl_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_pais_id_seq OWNER TO postgres;

--
-- Name: ctl_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_pais_id_seq OWNED BY ctl_pais.id;


--
-- Name: ctl_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_producto (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    presentacion character varying(100) NOT NULL,
    id_categoria integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    id_unidad integer NOT NULL,
    existencia numeric(10,2) NOT NULL,
    existencia_maxima numeric(10,2) NOT NULL,
    existencia_minima numeric(10,2) NOT NULL,
    precio_costo numeric(10,2) NOT NULL,
    precio_venta numeric(10,2) NOT NULL,
    reservado numeric(10,2) NOT NULL,
    codigo character varying(25) NOT NULL,
    activo boolean NOT NULL,
    id_marca integer
);


ALTER TABLE ctl_producto OWNER TO postgres;

--
-- Name: ctl_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_producto_id_seq OWNER TO postgres;

--
-- Name: ctl_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_producto_id_seq OWNED BY ctl_producto.id;


--
-- Name: ctl_proveedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_proveedor (
    activo boolean NOT NULL,
    direccion character varying(100) NOT NULL,
    email character varying(100),
    nit character varying(25) NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_comercial character varying(100) NOT NULL,
    nrc character varying(25) NOT NULL,
    telefono character varying(25) NOT NULL,
    id_pais integer NOT NULL,
    id integer NOT NULL,
    date_add date NOT NULL,
    date_mod date,
    id_user_add integer NOT NULL,
    id_user_mod integer
);


ALTER TABLE ctl_proveedor OWNER TO postgres;

--
-- Name: TABLE ctl_proveedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ctl_proveedor IS 'Catalogo de proveedores';


--
-- Name: COLUMN ctl_proveedor.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.activo IS 'estado del registro true=activo; false=inactivo';


--
-- Name: COLUMN ctl_proveedor.direccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.direccion IS 'Direccion del negocio';


--
-- Name: COLUMN ctl_proveedor.nit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.nit IS 'Nit de la empresa';


--
-- Name: COLUMN ctl_proveedor.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.nombre IS 'Nombre de la empresa';


--
-- Name: COLUMN ctl_proveedor.nombre_comercial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.nombre_comercial IS 'Nombre comercial de la empresa';


--
-- Name: COLUMN ctl_proveedor.nrc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.nrc IS 'Numero de registro de contribuyente';


--
-- Name: COLUMN ctl_proveedor.telefono; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.telefono IS 'Telefonos puede ser mas de uno';


--
-- Name: COLUMN ctl_proveedor.date_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.date_add IS 'Fecha de creacion del registro';


--
-- Name: COLUMN ctl_proveedor.date_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ctl_proveedor.date_mod IS 'Fecha de modificacion del registro';


--
-- Name: ctl_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_proveedor_id_seq OWNER TO postgres;

--
-- Name: ctl_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_proveedor_id_seq OWNED BY ctl_proveedor.id;


--
-- Name: ctl_tipoentrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_tipoentrada (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_tipoentrada OWNER TO postgres;

--
-- Name: ctl_tipoentrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_tipoentrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_tipoentrada_id_seq OWNER TO postgres;

--
-- Name: ctl_tipoentrada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_tipoentrada_id_seq OWNED BY ctl_tipoentrada.id;


--
-- Name: ctl_tipofactura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_tipofactura (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_tipofactura OWNER TO postgres;

--
-- Name: ctl_tipofactura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_tipofactura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_tipofactura_id_seq OWNER TO postgres;

--
-- Name: ctl_tipofactura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_tipofactura_id_seq OWNED BY ctl_tipofactura.id;


--
-- Name: ctl_unidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_unidad (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_unidad OWNER TO postgres;

--
-- Name: ctl_unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_unidad_id_seq OWNER TO postgres;

--
-- Name: ctl_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_unidad_id_seq OWNED BY ctl_unidad.id;


--
-- Name: ctl_zona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ctl_zona (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE ctl_zona OWNER TO postgres;

--
-- Name: ctl_zona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ctl_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ctl_zona_id_seq OWNER TO postgres;

--
-- Name: ctl_zona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ctl_zona_id_seq OWNED BY ctl_zona.id;


--
-- Name: cxc_cobro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cxc_cobro (
    fecha date NOT NULL,
    numero_recibo integer NOT NULL,
    numero_cheque character varying(25),
    id_factura integer NOT NULL,
    id_forma_pago integer NOT NULL,
    id_banco integer,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    activo boolean NOT NULL,
    id_empleado integer NOT NULL,
    id integer NOT NULL,
    monto numeric(10,2) NOT NULL
);


ALTER TABLE cxc_cobro OWNER TO postgres;

--
-- Name: cxc_cobro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cxc_cobro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cxc_cobro_id_seq OWNER TO postgres;

--
-- Name: cxc_cobro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cxc_cobro_id_seq OWNED BY cxc_cobro.id;


--
-- Name: fac_factura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fac_factura (
    id integer NOT NULL,
    numero integer NOT NULL,
    id_tipofactura integer NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_condicionpago integer NOT NULL,
    activo boolean NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    iva numeric(10,2),
    iva_retenido numeric(10,2),
    subtotal numeric(10,2) NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    ventas_gravadas numeric(10,2),
    id_empleado integer NOT NULL,
    estado character varying(10),
    sumas numeric(10,2) NOT NULL,
    cobro_total numeric(10,2),
    fecha_pago date,
    id_notaremision integer,
    ventas_nosujetas numeric(10,2),
    ventas_exentas numeric(10,2),
    id_formato_documento integer
);


ALTER TABLE fac_factura OWNER TO postgres;

--
-- Name: COLUMN fac_factura.numero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.numero IS 'Campo para el numero de factura o CCF';


--
-- Name: COLUMN fac_factura.id_tipofactura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.id_tipofactura IS 'fk - para el tipo de factura (consumidor final o CCF)';


--
-- Name: COLUMN fac_factura.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.fecha IS 'campo para almacenar fecha de la factura';


--
-- Name: COLUMN fac_factura.id_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.id_cliente IS 'fk - cliente a quien se le facturo el producto';


--
-- Name: COLUMN fac_factura.id_condicionpago; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.id_condicionpago IS 'fk - para almacenar condicion de pago, credito o contado';


--
-- Name: COLUMN fac_factura.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.activo IS 'campo para determinar si el registro esta activo';


--
-- Name: COLUMN fac_factura.id_user_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.id_user_add IS 'fk - para saber el usuario que creo el registro';


--
-- Name: COLUMN fac_factura.id_user_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.id_user_mod IS 'fk - para saber el usuario que modificó el registro';


--
-- Name: COLUMN fac_factura.iva; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.iva IS 'almacena el calculo del IVA actual según configuarción (0.13) en base a la suma de las ventas gravadas';


--
-- Name: COLUMN fac_factura.sumas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.sumas IS 'campo para almacenar la sumatoria de las ventas gravadas de todos los ITEMS de la factura';


--
-- Name: COLUMN fac_factura.cobro_total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.cobro_total IS 'Almacena el cobro total para las facturas a credito y que son canceladas a traves cuentas por cobrar';


--
-- Name: COLUMN fac_factura.fecha_pago; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_factura.fecha_pago IS 'Fecha en que la factura es pagada en caso de contado es el mismo dia de la factura y de credito en base a lo acordado con cliente';


--
-- Name: fac_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fac_factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fac_factura_id_seq OWNER TO postgres;

--
-- Name: fac_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fac_factura_id_seq OWNED BY fac_factura.id;


--
-- Name: fac_facturadetalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fac_facturadetalle (
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    descripcion character varying(2044),
    cantidad numeric(10,2) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    ventas_exentas numeric(10,2),
    ventas_gravadas numeric(10,2),
    ventas_nosujetas numeric(10,2),
    id integer NOT NULL
);


ALTER TABLE fac_facturadetalle OWNER TO postgres;

--
-- Name: fac_facturadetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fac_facturadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fac_facturadetalle_id_seq OWNER TO postgres;

--
-- Name: fac_facturadetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fac_facturadetalle_id_seq OWNED BY fac_facturadetalle.id;


--
-- Name: fac_notaremision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fac_notaremision (
    activo boolean NOT NULL,
    date_add date NOT NULL,
    date_mod date,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_condicionpago integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    numero integer NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    id integer NOT NULL,
    estado character varying(10) NOT NULL
);


ALTER TABLE fac_notaremision OWNER TO postgres;

--
-- Name: COLUMN fac_notaremision.activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.activo IS 'determina si el registro esta activo';


--
-- Name: COLUMN fac_notaremision.date_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.date_add IS 'fecha que se creo el registro';


--
-- Name: COLUMN fac_notaremision.date_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.date_mod IS 'ultima fecha que se modifico el registro';


--
-- Name: COLUMN fac_notaremision.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.fecha IS 'fecha del documento de remisión';


--
-- Name: COLUMN fac_notaremision.id_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.id_cliente IS 'fk - del catalogo ctl_cliente';


--
-- Name: COLUMN fac_notaremision.id_condicionpago; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.id_condicionpago IS 'fk - del catalogo ctl_condiciondepago';


--
-- Name: COLUMN fac_notaremision.id_user_add; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.id_user_add IS 'usuario que agregó el registro';


--
-- Name: COLUMN fac_notaremision.id_user_mod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.id_user_mod IS 'ultimo id de usuario que modificó el registro';


--
-- Name: COLUMN fac_notaremision.numero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.numero IS 'numero de documento de remision';


--
-- Name: COLUMN fac_notaremision.venta_total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.venta_total IS 'campo para almacenar la sumatoria del total de los item del detalle';


--
-- Name: COLUMN fac_notaremision.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fac_notaremision.id IS 'Llave primaria';


--
-- Name: fac_notaremision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fac_notaremision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fac_notaremision_id_seq OWNER TO postgres;

--
-- Name: fac_notaremision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fac_notaremision_id_seq OWNED BY fac_notaremision.id;


--
-- Name: fac_notaremisiondetalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fac_notaremisiondetalle (
    cantidad numeric(10,2) NOT NULL,
    id_producto integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    total numeric(10,2),
    id integer NOT NULL,
    id_notaremision integer NOT NULL
);


ALTER TABLE fac_notaremisiondetalle OWNER TO postgres;

--
-- Name: fac_notaremisiondetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fac_notaremisiondetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fac_notaremisiondetalle_id_seq OWNER TO postgres;

--
-- Name: fac_notaremisiondetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fac_notaremisiondetalle_id_seq OWNED BY fac_notaremisiondetalle.id;


--
-- Name: fos_user_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fos_user_group (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    roles text NOT NULL
);


ALTER TABLE fos_user_group OWNER TO postgres;

--
-- Name: COLUMN fos_user_group.roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fos_user_group.roles IS '(DC2Type:array)';


--
-- Name: fos_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fos_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fos_user_group_id_seq OWNER TO postgres;

--
-- Name: fos_user_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fos_user_user (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    username_canonical character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_canonical character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    salt character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    locked boolean NOT NULL,
    expired boolean NOT NULL,
    expires_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    confirmation_token character varying(255) DEFAULT NULL::character varying,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    credentials_expired boolean NOT NULL,
    credentials_expire_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    date_of_birth timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    firstname character varying(64) DEFAULT NULL::character varying,
    lastname character varying(64) DEFAULT NULL::character varying,
    website character varying(64) DEFAULT NULL::character varying,
    biography character varying(255) DEFAULT NULL::character varying,
    gender character varying(1) DEFAULT NULL::character varying,
    locale character varying(8) DEFAULT NULL::character varying,
    timezone character varying(64) DEFAULT NULL::character varying,
    phone character varying(64) DEFAULT NULL::character varying,
    facebook_uid character varying(255) DEFAULT NULL::character varying,
    facebook_name character varying(255) DEFAULT NULL::character varying,
    facebook_data text,
    twitter_uid character varying(255) DEFAULT NULL::character varying,
    twitter_name character varying(255) DEFAULT NULL::character varying,
    twitter_data text,
    gplus_uid character varying(255) DEFAULT NULL::character varying,
    gplus_name character varying(255) DEFAULT NULL::character varying,
    gplus_data text,
    token character varying(255) DEFAULT NULL::character varying,
    two_step_code character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE fos_user_user OWNER TO postgres;

--
-- Name: COLUMN fos_user_user.roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fos_user_user.roles IS '(DC2Type:array)';


--
-- Name: COLUMN fos_user_user.facebook_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fos_user_user.facebook_data IS '(DC2Type:json)';


--
-- Name: COLUMN fos_user_user.twitter_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fos_user_user.twitter_data IS '(DC2Type:json)';


--
-- Name: COLUMN fos_user_user.gplus_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN fos_user_user.gplus_data IS '(DC2Type:json)';


--
-- Name: fos_user_user_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fos_user_user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE fos_user_user_group OWNER TO postgres;

--
-- Name: fos_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fos_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fos_user_user_id_seq OWNER TO postgres;

--
-- Name: inv_entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inv_entrada (
    id integer NOT NULL,
    fecha date NOT NULL,
    id_tipoentrada integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer,
    date_add date NOT NULL,
    date_mod date,
    numero integer NOT NULL,
    activo boolean NOT NULL,
    id_proveedor integer NOT NULL,
    id_estado integer
);


ALTER TABLE inv_entrada OWNER TO postgres;

--
-- Name: inv_entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inv_entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inv_entrada_id_seq OWNER TO postgres;

--
-- Name: inv_entrada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inv_entrada_id_seq OWNED BY inv_entrada.id;


--
-- Name: inv_entradadetalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inv_entradadetalle (
    comentario character varying(100),
    lote character varying(25) NOT NULL,
    id_entrada integer NOT NULL,
    serie character varying(50),
    modelo character varying(50),
    id integer NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    fecha_vencimiento date,
    id_producto integer NOT NULL
);


ALTER TABLE inv_entradadetalle OWNER TO postgres;

--
-- Name: inv_entradadetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inv_entradadetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inv_entradadetalle_id_seq OWNER TO postgres;

--
-- Name: inv_entradadetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inv_entradadetalle_id_seq OWNED BY inv_entradadetalle.id;


--
-- Name: inv_notaenvio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inv_notaenvio (
    activo boolean NOT NULL,
    date_add date NOT NULL,
    date_mod date NOT NULL,
    estado character varying(2044) NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    id_user_add integer NOT NULL,
    id_user_mod integer NOT NULL,
    numero integer NOT NULL,
    venta_total numeric(10,2) NOT NULL,
    observacion character varying(2044) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE inv_notaenvio OWNER TO postgres;

--
-- Name: inv_notaenvio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inv_notaenvio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inv_notaenvio_id_seq OWNER TO postgres;

--
-- Name: inv_notaenvio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inv_notaenvio_id_seq OWNED BY inv_notaenvio.id;


--
-- Name: inv_notaenviodetalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inv_notaenviodetalle (
    cantidad numeric(10,2) NOT NULL,
    id_producto integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    id integer NOT NULL,
    id_notaenvio integer NOT NULL
);


ALTER TABLE inv_notaenviodetalle OWNER TO postgres;

--
-- Name: inv_notaenviodetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inv_notaenviodetalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inv_notaenviodetalle_id_seq OWNER TO postgres;

--
-- Name: inv_notaenviodetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inv_notaenviodetalle_id_seq OWNED BY inv_notaenviodetalle.id;


--
-- Name: mnt_empleado_MM_cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "mnt_empleado_MM_cliente" (
    id_empleado integer NOT NULL,
    id_cliente integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE "mnt_empleado_MM_cliente" OWNER TO postgres;

--
-- Name: mnt_empleado_MM_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "mnt_empleado_MM_cliente_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "mnt_empleado_MM_cliente_id_seq" OWNER TO postgres;

--
-- Name: mnt_empleado_MM_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "mnt_empleado_MM_cliente_id_seq" OWNED BY "mnt_empleado_MM_cliente".id;


--
-- Name: mnt_empleado_zona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mnt_empleado_zona (
    id_zona integer NOT NULL,
    id_empleado integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE mnt_empleado_zona OWNER TO postgres;

--
-- Name: mnt_empleado_zona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mnt_empleado_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mnt_empleado_zona_id_seq OWNER TO postgres;

--
-- Name: mnt_empleado_zona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mnt_empleado_zona_id_seq OWNED BY mnt_empleado_zona.id;


--
-- Name: vs_database_diagrams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vs_database_diagrams (
    name character varying(80) NOT NULL,
    diadata text,
    comment character varying(1022),
    preview text,
    lockinfo character varying(80),
    locktime timestamp with time zone,
    version character varying(80)
);


ALTER TABLE vs_database_diagrams OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_classes ALTER COLUMN id SET DEFAULT nextval('acl_classes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_entries ALTER COLUMN id SET DEFAULT nextval('acl_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_object_identities ALTER COLUMN id SET DEFAULT nextval('acl_object_identities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_security_identities ALTER COLUMN id SET DEFAULT nextval('acl_security_identities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_empresa ALTER COLUMN id SET DEFAULT nextval('ctl_empresa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_formato_documento ALTER COLUMN id SET DEFAULT nextval('cfg_formato_documento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_plantilla ALTER COLUMN id SET DEFAULT nextval('cfg_plantilla_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_banco ALTER COLUMN id SET DEFAULT nextval('ctl_banco_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cargofuncional ALTER COLUMN id SET DEFAULT nextval('ctl_cargofuncional_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_categoria ALTER COLUMN id SET DEFAULT nextval('ctl_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente ALTER COLUMN id SET DEFAULT nextval('ctl_cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_condicionpago ALTER COLUMN id SET DEFAULT nextval('ctl_condicion_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_departamento ALTER COLUMN id SET DEFAULT nextval('ctl_departamento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_empleado ALTER COLUMN id SET DEFAULT nextval('ctl_empleado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_estado ALTER COLUMN id SET DEFAULT nextval('ctl_estado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_font_name ALTER COLUMN id SET DEFAULT nextval('ctl_font_name_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_font_size ALTER COLUMN id SET DEFAULT nextval('ctl_font_size_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_formapago ALTER COLUMN id SET DEFAULT nextval('ctl_forma_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_marca ALTER COLUMN id SET DEFAULT nextval('ctl_marca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_municipio ALTER COLUMN id SET DEFAULT nextval('ctl_municipio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_pais ALTER COLUMN id SET DEFAULT nextval('ctl_pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto ALTER COLUMN id SET DEFAULT nextval('ctl_producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_proveedor ALTER COLUMN id SET DEFAULT nextval('ctl_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_tipoentrada ALTER COLUMN id SET DEFAULT nextval('ctl_tipoentrada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_tipofactura ALTER COLUMN id SET DEFAULT nextval('ctl_tipofactura_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_unidad ALTER COLUMN id SET DEFAULT nextval('ctl_unidad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_zona ALTER COLUMN id SET DEFAULT nextval('ctl_zona_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro ALTER COLUMN id SET DEFAULT nextval('cxc_cobro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura ALTER COLUMN id SET DEFAULT nextval('fac_factura_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_facturadetalle ALTER COLUMN id SET DEFAULT nextval('fac_facturadetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremision ALTER COLUMN id SET DEFAULT nextval('fac_notaremision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremisiondetalle ALTER COLUMN id SET DEFAULT nextval('fac_notaremisiondetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada ALTER COLUMN id SET DEFAULT nextval('inv_entrada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entradadetalle ALTER COLUMN id SET DEFAULT nextval('inv_entradadetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenvio ALTER COLUMN id SET DEFAULT nextval('inv_notaenvio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenviodetalle ALTER COLUMN id SET DEFAULT nextval('inv_notaenviodetalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mnt_empleado_MM_cliente" ALTER COLUMN id SET DEFAULT nextval('"mnt_empleado_MM_cliente_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnt_empleado_zona ALTER COLUMN id SET DEFAULT nextval('mnt_empleado_zona_id_seq'::regclass);


--
-- Data for Name: acl_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2488.dat

--
-- Name: acl_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acl_classes_id_seq', 1, false);


--
-- Data for Name: acl_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2490.dat

--
-- Name: acl_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acl_entries_id_seq', 1, false);


--
-- Data for Name: acl_object_identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2492.dat

--
-- Name: acl_object_identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acl_object_identities_id_seq', 1, false);


--
-- Data for Name: acl_object_identity_ancestors; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2494.dat

--
-- Data for Name: acl_security_identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2495.dat

--
-- Name: acl_security_identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acl_security_identities_id_seq', 1, false);


--
-- Data for Name: cfg_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2510.dat

--
-- Data for Name: cfg_formato_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2564.dat

--
-- Name: cfg_formato_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cfg_formato_documento_id_seq', 4, true);


--
-- Data for Name: cfg_plantilla; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2566.dat

--
-- Name: cfg_plantilla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cfg_plantilla_id_seq', 4, true);


--
-- Data for Name: ctl_banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2497.dat

--
-- Name: ctl_banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_banco_id_seq', 1, true);


--
-- Data for Name: ctl_cargofuncional; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2498.dat

--
-- Name: ctl_cargofuncional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_cargofuncional_id_seq', 1, false);


--
-- Data for Name: ctl_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2500.dat

--
-- Name: ctl_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_categoria_id_seq', 2, true);


--
-- Data for Name: ctl_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2502.dat

--
-- Name: ctl_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_cliente_id_seq', 4, true);


--
-- Name: ctl_condicion_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_condicion_pago_id_seq', 3, true);


--
-- Data for Name: ctl_condicionpago; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2504.dat

--
-- Data for Name: ctl_departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2506.dat

--
-- Name: ctl_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_departamento_id_seq', 1, false);


--
-- Data for Name: ctl_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2508.dat

--
-- Name: ctl_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_empleado_id_seq', 5, true);


--
-- Name: ctl_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_empresa_id_seq', 1, false);


--
-- Data for Name: ctl_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2552.dat

--
-- Name: ctl_estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_estado_id_seq', 4, true);


--
-- Data for Name: ctl_font_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2568.dat

--
-- Name: ctl_font_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_font_name_id_seq', 1, true);


--
-- Data for Name: ctl_font_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2569.dat

--
-- Name: ctl_font_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_font_size_id_seq', 1, true);


--
-- Name: ctl_forma_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_forma_pago_id_seq', 2, true);


--
-- Data for Name: ctl_formapago; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2512.dat

--
-- Data for Name: ctl_marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2562.dat

--
-- Name: ctl_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_marca_id_seq', 2, true);


--
-- Data for Name: ctl_municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2514.dat

--
-- Name: ctl_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_municipio_id_seq', 1, true);


--
-- Data for Name: ctl_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2516.dat

--
-- Name: ctl_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_pais_id_seq', 1, false);


--
-- Data for Name: ctl_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2518.dat

--
-- Name: ctl_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_producto_id_seq', 3, true);


--
-- Data for Name: ctl_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2520.dat

--
-- Name: ctl_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_proveedor_id_seq', 3, true);


--
-- Data for Name: ctl_tipoentrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2522.dat

--
-- Name: ctl_tipoentrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_tipoentrada_id_seq', 1, true);


--
-- Data for Name: ctl_tipofactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2524.dat

--
-- Name: ctl_tipofactura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_tipofactura_id_seq', 2, true);


--
-- Data for Name: ctl_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2526.dat

--
-- Name: ctl_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_unidad_id_seq', 3, true);


--
-- Data for Name: ctl_zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2556.dat

--
-- Name: ctl_zona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ctl_zona_id_seq', 1, false);


--
-- Data for Name: cxc_cobro; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2528.dat

--
-- Name: cxc_cobro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cxc_cobro_id_seq', 8, true);


--
-- Data for Name: fac_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2530.dat

--
-- Name: fac_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fac_factura_id_seq', 17, true);


--
-- Data for Name: fac_facturadetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2531.dat

--
-- Name: fac_facturadetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fac_facturadetalle_id_seq', 14, true);


--
-- Data for Name: fac_notaremision; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2550.dat

--
-- Name: fac_notaremision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fac_notaremision_id_seq', 7, true);


--
-- Data for Name: fac_notaremisiondetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2554.dat

--
-- Name: fac_notaremisiondetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fac_notaremisiondetalle_id_seq', 7, true);


--
-- Data for Name: fos_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2533.dat

--
-- Name: fos_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fos_user_group_id_seq', 1, false);


--
-- Data for Name: fos_user_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2535.dat

--
-- Data for Name: fos_user_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2536.dat

--
-- Name: fos_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fos_user_user_id_seq', 2, true);


--
-- Data for Name: inv_entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2538.dat

--
-- Name: inv_entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inv_entrada_id_seq', 6, true);


--
-- Data for Name: inv_entradadetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2540.dat

--
-- Name: inv_entradadetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inv_entradadetalle_id_seq', 10, true);


--
-- Data for Name: inv_notaenvio; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2546.dat

--
-- Name: inv_notaenvio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inv_notaenvio_id_seq', 1, false);


--
-- Data for Name: inv_notaenviodetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2548.dat

--
-- Name: inv_notaenviodetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inv_notaenviodetalle_id_seq', 1, false);


--
-- Data for Name: mnt_empleado_MM_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2542.dat

--
-- Name: mnt_empleado_MM_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"mnt_empleado_MM_cliente_id_seq"', 1, false);


--
-- Data for Name: mnt_empleado_zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2559.dat

--
-- Name: mnt_empleado_zona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mnt_empleado_zona_id_seq', 7, true);


--
-- Data for Name: vs_database_diagrams; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/2544.dat

--
-- Name: acl_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_classes
    ADD CONSTRAINT acl_classes_pkey PRIMARY KEY (id);


--
-- Name: acl_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT acl_entries_pkey PRIMARY KEY (id);


--
-- Name: acl_object_identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_object_identities
    ADD CONSTRAINT acl_object_identities_pkey PRIMARY KEY (id);


--
-- Name: acl_object_identity_ancestors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT acl_object_identity_ancestors_pkey PRIMARY KEY (object_identity_id, ancestor_id);


--
-- Name: acl_security_identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_security_identities
    ADD CONSTRAINT acl_security_identities_pkey PRIMARY KEY (id);


--
-- Name: cfg_formato_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT cfg_formato_documento_pkey PRIMARY KEY (id);


--
-- Name: cfg_plantilla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cfg_plantilla
    ADD CONSTRAINT cfg_plantilla_pkey PRIMARY KEY (id);


--
-- Name: ctl_banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_banco
    ADD CONSTRAINT ctl_banco_pkey PRIMARY KEY (id);


--
-- Name: ctl_cargofuncional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_cargofuncional
    ADD CONSTRAINT ctl_cargofuncional_pkey PRIMARY KEY (id);


--
-- Name: ctl_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_categoria
    ADD CONSTRAINT ctl_categoria_pkey PRIMARY KEY (id);


--
-- Name: ctl_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT ctl_cliente_pkey PRIMARY KEY (id);


--
-- Name: ctl_condicion_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_condicionpago
    ADD CONSTRAINT ctl_condicion_pago_pkey PRIMARY KEY (id);


--
-- Name: ctl_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_departamento
    ADD CONSTRAINT ctl_departamento_pkey PRIMARY KEY (id);


--
-- Name: ctl_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_empleado
    ADD CONSTRAINT ctl_empleado_pkey PRIMARY KEY (id);


--
-- Name: ctl_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cfg_empresa
    ADD CONSTRAINT ctl_empresa_pkey PRIMARY KEY (id);


--
-- Name: ctl_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_estado
    ADD CONSTRAINT ctl_estado_pkey PRIMARY KEY (id);


--
-- Name: ctl_font_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_font_name
    ADD CONSTRAINT ctl_font_name_pkey PRIMARY KEY (id);


--
-- Name: ctl_font_size_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_font_size
    ADD CONSTRAINT ctl_font_size_pkey PRIMARY KEY (id);


--
-- Name: ctl_forma_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_formapago
    ADD CONSTRAINT ctl_forma_pago_pkey PRIMARY KEY (id);


--
-- Name: ctl_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_marca
    ADD CONSTRAINT ctl_marca_pkey PRIMARY KEY (id);


--
-- Name: ctl_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_municipio
    ADD CONSTRAINT ctl_municipio_pkey PRIMARY KEY (id);


--
-- Name: ctl_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_pais
    ADD CONSTRAINT ctl_pais_pkey PRIMARY KEY (id);


--
-- Name: ctl_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT ctl_producto_pkey PRIMARY KEY (id);


--
-- Name: ctl_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT ctl_proveedor_pkey PRIMARY KEY (id);


--
-- Name: ctl_tipoentrada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_tipoentrada
    ADD CONSTRAINT ctl_tipoentrada_pkey PRIMARY KEY (id);


--
-- Name: ctl_tipofactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_tipofactura
    ADD CONSTRAINT ctl_tipofactura_pkey PRIMARY KEY (id);


--
-- Name: ctl_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_unidad
    ADD CONSTRAINT ctl_unidad_pkey PRIMARY KEY (id);


--
-- Name: ctl_zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_zona
    ADD CONSTRAINT ctl_zona_pkey PRIMARY KEY (id);


--
-- Name: cxc_cobro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT cxc_cobro_pkey PRIMARY KEY (id);


--
-- Name: fac_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT fac_factura_pkey PRIMARY KEY (id);


--
-- Name: fac_facturadetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT fac_facturadetalle_pkey PRIMARY KEY (id);


--
-- Name: fac_notaremision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT fac_notaremision_pkey PRIMARY KEY (id);


--
-- Name: fac_notaremisiondetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT fac_notaremisiondetalle_pkey PRIMARY KEY (id);


--
-- Name: fos_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fos_user_group
    ADD CONSTRAINT fos_user_group_pkey PRIMARY KEY (id);


--
-- Name: fos_user_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fos_user_user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: fos_user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fos_user_user
    ADD CONSTRAINT fos_user_user_pkey PRIMARY KEY (id);


--
-- Name: inv_entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT inv_entrada_pkey PRIMARY KEY (id);


--
-- Name: inv_entradadetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT inv_entradadetalle_pkey PRIMARY KEY (id);


--
-- Name: inv_notaenvio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT inv_notaenvio_pkey PRIMARY KEY (id);


--
-- Name: inv_notaenviodetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT inv_notaenviodetalle_pkey PRIMARY KEY (id);


--
-- Name: mnt_empleado_MM_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "mnt_empleado_MM_cliente_pkey" PRIMARY KEY (id);


--
-- Name: mnt_empleado_zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT mnt_empleado_zona_pkey PRIMARY KEY (id);


--
-- Name: pk_name; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vs_database_diagrams
    ADD CONSTRAINT pk_name PRIMARY KEY (name);


--
-- Name: uk_empleado_zona; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT uk_empleado_zona UNIQUE (id_empleado, id_zona);


--
-- Name: uk_nombre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT uk_nombre UNIQUE (nombre);


--
-- Name: uk_numero_fecha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT uk_numero_fecha UNIQUE (numero_recibo, fecha);


--
-- Name: uk_tipofactura_numero; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT uk_tipofactura_numero UNIQUE (numero, id_tipofactura, activo);


--
-- Name: unique_abreviatura; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ctl_estado
    ADD CONSTRAINT unique_abreviatura UNIQUE (abreviatura);


--
-- Name: idx_46c8b8063d9ab4a6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_46c8b8063d9ab4a6 ON acl_entries USING btree (object_identity_id);


--
-- Name: idx_46c8b806df9183c9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_46c8b806df9183c9 ON acl_entries USING btree (security_identity_id);


--
-- Name: idx_46c8b806ea000b10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_46c8b806ea000b10 ON acl_entries USING btree (class_id);


--
-- Name: idx_46c8b806ea000b103d9ab4a6df9183c9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_46c8b806ea000b103d9ab4a6df9183c9 ON acl_entries USING btree (class_id, object_identity_id, security_identity_id);


--
-- Name: idx_825de2993d9ab4a6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_825de2993d9ab4a6 ON acl_object_identity_ancestors USING btree (object_identity_id);


--
-- Name: idx_825de299c671cea1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_825de299c671cea1 ON acl_object_identity_ancestors USING btree (ancestor_id);


--
-- Name: idx_9407e54977fa751a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_9407e54977fa751a ON acl_object_identities USING btree (parent_object_identity_id);


--
-- Name: idx_b3c77447a76ed395; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_b3c77447a76ed395 ON fos_user_user_group USING btree (user_id);


--
-- Name: idx_b3c77447fe54d947; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_b3c77447fe54d947 ON fos_user_user_group USING btree (group_id);


--
-- Name: uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_46c8b806ea000b103d9ab4a64def17bce4289bf4 ON acl_entries USING btree (class_id, object_identity_id, field_name, ace_order);


--
-- Name: uniq_583d1f3e5e237e06; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_583d1f3e5e237e06 ON fos_user_group USING btree (name);


--
-- Name: uniq_69dd750638a36066; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_69dd750638a36066 ON acl_classes USING btree (class_type);


--
-- Name: uniq_8835ee78772e836af85e0677; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_8835ee78772e836af85e0677 ON acl_security_identities USING btree (identifier, username);


--
-- Name: uniq_9407e5494b12ad6ea000b10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_9407e5494b12ad6ea000b10 ON acl_object_identities USING btree (object_identifier, class_id);


--
-- Name: uniq_c560d76192fc23a8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_c560d76192fc23a8 ON fos_user_user USING btree (username_canonical);


--
-- Name: uniq_c560d761a0d96fbf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_c560d761a0d96fbf ON fos_user_user USING btree (email_canonical);


--
-- Name: fk_46c8b8063d9ab4a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b8063d9ab4a6 FOREIGN KEY (object_identity_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_46c8b806df9183c9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b806df9183c9 FOREIGN KEY (security_identity_id) REFERENCES acl_security_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_46c8b806ea000b10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_entries
    ADD CONSTRAINT fk_46c8b806ea000b10 FOREIGN KEY (class_id) REFERENCES acl_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_825de2993d9ab4a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT fk_825de2993d9ab4a6 FOREIGN KEY (object_identity_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_825de299c671cea1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_object_identity_ancestors
    ADD CONSTRAINT fk_825de299c671cea1 FOREIGN KEY (ancestor_id) REFERENCES acl_object_identities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_9407e54977fa751a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_object_identities
    ADD CONSTRAINT fk_9407e54977fa751a FOREIGN KEY (parent_object_identity_id) REFERENCES acl_object_identities(id);


--
-- Name: fk_b3c77447a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fk_b3c77447a76ed395 FOREIGN KEY (user_id) REFERENCES fos_user_user(id) ON DELETE CASCADE;


--
-- Name: fk_b3c77447fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fos_user_user_group
    ADD CONSTRAINT fk_b3c77447fe54d947 FOREIGN KEY (group_id) REFERENCES fos_user_group(id) ON DELETE CASCADE;


--
-- Name: lnk_cfg_formato_documento_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_cfg_formato_documento_fac_factura FOREIGN KEY (id_formato_documento) REFERENCES cfg_formato_documento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_cfg_plantilla_cfg_formato_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_cfg_plantilla_cfg_formato_documento FOREIGN KEY (id_plantilla) REFERENCES cfg_plantilla(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_cliente_MM_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "lnk_cliente_MM_empleado" FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_banco_cxc_cobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_banco_cxc_cobro FOREIGN KEY (id_banco) REFERENCES ctl_banco(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_cargofuncional_ctl_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_empleado
    ADD CONSTRAINT lnk_ctl_cargofuncional_ctl_empleado FOREIGN KEY (id_cargofuncional) REFERENCES ctl_cargofuncional(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_categoria_ctl_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_categoria_ctl_producto FOREIGN KEY (id_categoria) REFERENCES ctl_categoria(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_cliente_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_cliente_fac_factura FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_cliente_fac_notaremision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_ctl_cliente_fac_notaremision FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_cliente_inv_notaenvio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_ctl_cliente_inv_notaenvio FOREIGN KEY (id_cliente) REFERENCES ctl_cliente(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_condicionpago_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_condicionpago_fac_factura FOREIGN KEY (id_condicionpago) REFERENCES ctl_condicionpago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_condicionpago_fac_notaremision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_ctl_condicionpago_fac_notaremision FOREIGN KEY (id_condicionpago) REFERENCES ctl_condicionpago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_departamento_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_departamento_ctl_cliente FOREIGN KEY (id_departamento) REFERENCES ctl_departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_departamento_ctl_municipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_municipio
    ADD CONSTRAINT lnk_ctl_departamento_ctl_municipio FOREIGN KEY (id_departamento) REFERENCES ctl_departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_empleado_MM_ctl_zona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT "lnk_ctl_empleado_MM_ctl_zona" FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_empleado_cxc_cobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_empleado_cxc_cobro FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_empleado_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_empleado_fac_factura FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_estado_inv_entrada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_estado_inv_entrada FOREIGN KEY (id_estado) REFERENCES ctl_estado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_font_name_cfg_formato_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_ctl_font_name_cfg_formato_documento FOREIGN KEY (id_font_name) REFERENCES ctl_font_name(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_font_size_cfg_formato_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfg_formato_documento
    ADD CONSTRAINT lnk_ctl_font_size_cfg_formato_documento FOREIGN KEY (id_font_size) REFERENCES ctl_font_size(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_forma_pago_cxc_cobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_ctl_forma_pago_cxc_cobro FOREIGN KEY (id_forma_pago) REFERENCES ctl_formapago(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_marca_ctl_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_marca_ctl_producto FOREIGN KEY (id_marca) REFERENCES ctl_marca(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_municipio_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_municipio_ctl_cliente FOREIGN KEY (id_municipio) REFERENCES ctl_municipio(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_pais_ctl_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_ctl_pais_ctl_proveedor FOREIGN KEY (id_pais) REFERENCES ctl_pais(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_producto_fac_facturadetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT lnk_ctl_producto_fac_facturadetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_producto_fac_notaremisiondetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT lnk_ctl_producto_fac_notaremisiondetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_producto_inv_entradadetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT lnk_ctl_producto_inv_entradadetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_producto_inv_notaenviodetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT lnk_ctl_producto_inv_notaenviodetalle FOREIGN KEY (id_producto) REFERENCES ctl_producto(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_proveedor_inv_entrada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_proveedor_inv_entrada FOREIGN KEY (id_proveedor) REFERENCES ctl_proveedor(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_tipoentrada_inv_entrada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_ctl_tipoentrada_inv_entrada FOREIGN KEY (id_tipoentrada) REFERENCES ctl_tipoentrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_tipofactura_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_ctl_tipofactura_fac_factura FOREIGN KEY (id_tipofactura) REFERENCES ctl_tipofactura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_unidad_ctl_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_ctl_unidad_ctl_producto FOREIGN KEY (id_unidad) REFERENCES ctl_unidad(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_zona_MM_ctl_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnt_empleado_zona
    ADD CONSTRAINT "lnk_ctl_zona_MM_ctl_empleado" FOREIGN KEY (id_zona) REFERENCES ctl_zona(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_ctl_zona_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_ctl_zona_ctl_cliente FOREIGN KEY (id_zona) REFERENCES ctl_zona(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_empleado_MM_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "mnt_empleado_MM_cliente"
    ADD CONSTRAINT "lnk_empleado_MM_cliente" FOREIGN KEY (id_empleado) REFERENCES ctl_empleado(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fac_factura_cxc_cobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fac_factura_cxc_cobro FOREIGN KEY (id_factura) REFERENCES fac_factura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fac_factura_fac_facturadetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_facturadetalle
    ADD CONSTRAINT lnk_fac_factura_fac_facturadetalle FOREIGN KEY (id_factura) REFERENCES fac_factura(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fac_notaremision_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fac_notaremision_fac_factura FOREIGN KEY (id_notaremision) REFERENCES fac_notaremision(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fac_notaremision_fac_notaremisiondetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremisiondetalle
    ADD CONSTRAINT lnk_fac_notaremision_fac_notaremisiondetalle FOREIGN KEY (id_notaremision) REFERENCES fac_notaremision(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_cliente_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_cliente
    ADD CONSTRAINT lnk_fos_user_user_ctl_cliente_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_fos_user_user_ctl_producto FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_producto_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_producto
    ADD CONSTRAINT lnk_fos_user_user_ctl_producto_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_fos_user_user_ctl_proveedor FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_ctl_proveedor_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ctl_proveedor
    ADD CONSTRAINT lnk_fos_user_user_ctl_proveedor_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_cxc_cobro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fos_user_user_cxc_cobro FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_cxc_cobro_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cxc_cobro
    ADD CONSTRAINT lnk_fos_user_user_cxc_cobro_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_fac_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fos_user_user_fac_factura FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_fac_factura_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_factura
    ADD CONSTRAINT lnk_fos_user_user_fac_factura_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_fac_notaremision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_fos_user_user_fac_notaremision FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_fac_notaremision_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fac_notaremision
    ADD CONSTRAINT lnk_fos_user_user_fac_notaremision_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_inv_entrada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_fos_user_user_inv_entrada FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_inv_entrada_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entrada
    ADD CONSTRAINT lnk_fos_user_user_inv_entrada_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_inv_notaenvio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_fos_user_user_inv_notaenvio FOREIGN KEY (id_user_add) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_fos_user_user_inv_notaenvio_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenvio
    ADD CONSTRAINT lnk_fos_user_user_inv_notaenvio_1 FOREIGN KEY (id_user_mod) REFERENCES fos_user_user(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_inv_entrada_inv_entradadetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_entradadetalle
    ADD CONSTRAINT lnk_inv_entrada_inv_entradadetalle FOREIGN KEY (id_entrada) REFERENCES inv_entrada(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lnk_inv_notaenvio_inv_notaenviodetalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inv_notaenviodetalle
    ADD CONSTRAINT lnk_inv_notaenvio_inv_notaenviodetalle FOREIGN KEY (id_notaenvio) REFERENCES inv_notaenvio(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     