PGDMP         
    
            v            pedidos    10.4    10.4 0    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            +           1262    33867    pedidos    DATABASE     �   CREATE DATABASE pedidos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';
    DROP DATABASE pedidos;
          
   estudiante    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ,           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            -           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33892 
   categorias    TABLE     k   CREATE TABLE public.categorias (
    categoriaid integer NOT NULL,
    nombrecat character(50) NOT NULL
);
    DROP TABLE public.categorias;
       public      
   estudiante    false    3            �            1259    33877    clientes    TABLE     E  CREATE TABLE public.clientes (
    clienteid integer NOT NULL,
    cedula_ruc character(12) NOT NULL,
    nombrecia character(30) NOT NULL,
    nombrecontacto character(50) NOT NULL,
    direccioncli character(50) NOT NULL,
    fax character(12),
    email character(50),
    celular character(12),
    fijo character(12)
);
    DROP TABLE public.clientes;
       public      
   estudiante    false    3            .           0    0    TABLE clientes    ACL     �   GRANT INSERT,UPDATE ON TABLE public.clientes TO unl_usuario_facturador;
GRANT UPDATE ON TABLE public.clientes TO unl_usuario_contador;
            public    
   estudiante    false    198            �            1259    33883    detalle_ordenes    TABLE     �   CREATE TABLE public.detalle_ordenes (
    ordenid integer NOT NULL,
    detalleid integer NOT NULL,
    productoid integer NOT NULL,
    cantidad integer NOT NULL
);
 #   DROP TABLE public.detalle_ordenes;
       public      
   estudiante    false    3            /           0    0    TABLE detalle_ordenes    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.detalle_ordenes TO unl_usuario_facturador;
GRANT INSERT,UPDATE ON TABLE public.detalle_ordenes TO unl_usuario_contador;
            public    
   estudiante    false    200            �            1259    33868 	   empleados    TABLE     �   CREATE TABLE public.empleados (
    empleadoid integer NOT NULL,
    nombre character(30),
    apellido character(30),
    fecha_nac date,
    reporta_a integer,
    extension integer
);
    DROP TABLE public.empleados;
       public      
   estudiante    false    3            0           0    0    TABLE empleados    ACL     �   GRANT SELECT ON TABLE public.empleados TO grupo_gerencia;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.empleados TO recursos_humanos;
            public    
   estudiante    false    196            �            1259    33895    notificacion_existencia_minima    TABLE     �   CREATE TABLE public.notificacion_existencia_minima (
    correo character varying(40),
    bandera boolean,
    notificacion_existencia_minima_id integer NOT NULL,
    productoid integer,
    proveedorid integer
);
 2   DROP TABLE public.notificacion_existencia_minima;
       public      
   estudiante    false    3            �            1259    33880    ordenes    TABLE     �   CREATE TABLE public.ordenes (
    ordenid integer NOT NULL,
    empleadoid integer NOT NULL,
    clienteid integer NOT NULL,
    fechaorden date NOT NULL,
    descuento integer
);
    DROP TABLE public.ordenes;
       public      
   estudiante    false    3            1           0    0    TABLE ordenes    ACL     >   GRANT SELECT ON TABLE public.ordenes TO unl_usuario_contador;
            public    
   estudiante    false    199            �            1259    33886 	   productos    TABLE     �   CREATE TABLE public.productos (
    productoid integer NOT NULL,
    proveedorid integer NOT NULL,
    categoriaid integer NOT NULL,
    descripcion character(50),
    preciounit numeric NOT NULL,
    existencia integer NOT NULL
);
    DROP TABLE public.productos;
       public      
   estudiante    false    3            2           0    0    TABLE productos    ACL     @   GRANT SELECT ON TABLE public.productos TO unl_usuario_contador;
            public    
   estudiante    false    201            �            1259    33871    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    proveedorid integer NOT NULL,
    nombreprov character(50) NOT NULL,
    contacto character(50) NOT NULL,
    celuprov character(12),
    fijoprov character(12)
);
    DROP TABLE public.proveedores;
       public      
   estudiante    false    3            3           0    0    TABLE proveedores    ACL     ~   GRANT SELECT ON TABLE public.proveedores TO grupo_gerencia;
GRANT UPDATE ON TABLE public.proveedores TO unl_usuario_contador;
            public    
   estudiante    false    197            $          0    33892 
   categorias 
   TABLE DATA               <   COPY public.categorias (categoriaid, nombrecat) FROM stdin;
    public    
   estudiante    false    202   �9                  0    33877    clientes 
   TABLE DATA               }   COPY public.clientes (clienteid, cedula_ruc, nombrecia, nombrecontacto, direccioncli, fax, email, celular, fijo) FROM stdin;
    public    
   estudiante    false    198   x:       "          0    33883    detalle_ordenes 
   TABLE DATA               S   COPY public.detalle_ordenes (ordenid, detalleid, productoid, cantidad) FROM stdin;
    public    
   estudiante    false    200   L<                 0    33868 	   empleados 
   TABLE DATA               b   COPY public.empleados (empleadoid, nombre, apellido, fecha_nac, reporta_a, extension) FROM stdin;
    public    
   estudiante    false    196   �<       %          0    33895    notificacion_existencia_minima 
   TABLE DATA               �   COPY public.notificacion_existencia_minima (correo, bandera, notificacion_existencia_minima_id, productoid, proveedorid) FROM stdin;
    public    
   estudiante    false    203   �=       !          0    33880    ordenes 
   TABLE DATA               X   COPY public.ordenes (ordenid, empleadoid, clienteid, fechaorden, descuento) FROM stdin;
    public    
   estudiante    false    199   �=       #          0    33886 	   productos 
   TABLE DATA               n   COPY public.productos (productoid, proveedorid, categoriaid, descripcion, preciounit, existencia) FROM stdin;
    public    
   estudiante    false    201   >                 0    33871    proveedores 
   TABLE DATA               \   COPY public.proveedores (proveedorid, nombreprov, contacto, celuprov, fijoprov) FROM stdin;
    public    
   estudiante    false    197   '?       �
           2606    42076     clientes clientes_cedula_ruc_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cedula_ruc_key UNIQUE (cedula_ruc);
 J   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cedula_ruc_key;
       public      
   estudiante    false    198            �
           2606    42074 '   empleados empleados_nombre_apellido_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_nombre_apellido_key UNIQUE (nombre, apellido);
 Q   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_nombre_apellido_key;
       public      
   estudiante    false    196    196            �
           2606    33928    categorias pk_categorias 
   CONSTRAINT     _   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (categoriaid);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT pk_categorias;
       public      
   estudiante    false    202            �
           2606    33903    clientes pk_clientes 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (clienteid);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT pk_clientes;
       public      
   estudiante    false    198            �
           2606    33907 "   detalle_ordenes pk_detalle_ordenes 
   CONSTRAINT     p   ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT pk_detalle_ordenes PRIMARY KEY (ordenid, detalleid);
 L   ALTER TABLE ONLY public.detalle_ordenes DROP CONSTRAINT pk_detalle_ordenes;
       public      
   estudiante    false    200    200            �
           2606    33899    empleados pk_empleados 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT pk_empleados PRIMARY KEY (empleadoid);
 @   ALTER TABLE ONLY public.empleados DROP CONSTRAINT pk_empleados;
       public      
   estudiante    false    196            �
           2606    33911 @   notificacion_existencia_minima pk_notificacion_existencia_minima 
   CONSTRAINT     �   ALTER TABLE ONLY public.notificacion_existencia_minima
    ADD CONSTRAINT pk_notificacion_existencia_minima PRIMARY KEY (notificacion_existencia_minima_id);
 j   ALTER TABLE ONLY public.notificacion_existencia_minima DROP CONSTRAINT pk_notificacion_existencia_minima;
       public      
   estudiante    false    203            �
           2606    33905    ordenes pk_ordenes 
   CONSTRAINT     U   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT pk_ordenes PRIMARY KEY (ordenid);
 <   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT pk_ordenes;
       public      
   estudiante    false    199            �
           2606    33909    productos pk_productos 
   CONSTRAINT     \   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (productoid);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT pk_productos;
       public      
   estudiante    false    201            �
           2606    33901    proveedores pk_proveedores 
   CONSTRAINT     a   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (proveedorid);
 D   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT pk_proveedores;
       public      
   estudiante    false    197            �
           2606    33929 !   productos fk_categorias_productos    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categorias_productos FOREIGN KEY (categoriaid) REFERENCES public.categorias(categoriaid);
 K   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_categorias_productos;
       public    
   estudiante    false    2714    202    201            �
           2606    33917    ordenes fk_empleado_ordenes    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_empleado_ordenes FOREIGN KEY (empleadoid) REFERENCES public.empleados(empleadoid);
 E   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_empleado_ordenes;
       public    
   estudiante    false    199    196    2700            �
           2606    33939     empleados fk_empleados_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT fk_empleados_empleados FOREIGN KEY (empleadoid) REFERENCES public.empleados(empleadoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.empleados DROP CONSTRAINT fk_empleados_empleados;
       public    
   estudiante    false    196    2700    196            �
           2606    33912 %   ordenes fk_ordenes_clien_ord_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ordenes_clien_ord_clientes FOREIGN KEY (clienteid) REFERENCES public.clientes(clienteid);
 O   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_ordenes_clien_ord_clientes;
       public    
   estudiante    false    199    2706    198            �
           2606    33922 *   detalle_ordenes fk_ordenes_detalle_ordenes    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT fk_ordenes_detalle_ordenes FOREIGN KEY (ordenid) REFERENCES public.ordenes(ordenid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.detalle_ordenes DROP CONSTRAINT fk_ordenes_detalle_ordenes;
       public    
   estudiante    false    199    2708    200            �
           2606    42059 5   notificacion_existencia_minima fk_producto_not_ex_min    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificacion_existencia_minima
    ADD CONSTRAINT fk_producto_not_ex_min FOREIGN KEY (productoid) REFERENCES public.productos(productoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 _   ALTER TABLE ONLY public.notificacion_existencia_minima DROP CONSTRAINT fk_producto_not_ex_min;
       public    
   estudiante    false    201    2712    203            �
           2606    42064 6   notificacion_existencia_minima fk_proveedor_not_ex_min    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificacion_existencia_minima
    ADD CONSTRAINT fk_proveedor_not_ex_min FOREIGN KEY (proveedorid) REFERENCES public.proveedores(proveedorid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 `   ALTER TABLE ONLY public.notificacion_existencia_minima DROP CONSTRAINT fk_proveedor_not_ex_min;
       public    
   estudiante    false    203    2702    197            �
           2606    33934 "   productos fk_proveedores_productos    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_proveedores_productos FOREIGN KEY (proveedorid) REFERENCES public.proveedores(proveedorid);
 L   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_proveedores_productos;
       public    
   estudiante    false    197    201    2702            $   r   x���=
�0��9E:;�_�]0�$�B��9�����0]�V���Q��L���R�f�����'i��VYĳ�9��i�Ԙ
s�+��31v��8?������UW��\;�          �  x�͖�n�0���)r˭
�I��*�@�!+m���u�E4M���BBĉ?~�����ƶ�J)�4#�H=Q�� �e�_	&	��{���Fx�,�!���U����vִ��(��I�.�!șpZ@�F��r��ս=�6S�|���9dJ!>|5�:3-�j��n�vIr�8p��B�6N=����(�>�K�u�3+k������;�
��f��P������=��|�o�m��5�9g]ʹ��}���Z����D���D����a�朥���h�K��GY[\Y%��V|<���[g�p� ��mٸCk�6�:��Fm��q��f�k$�R�2��|e�w��j|�r�n]�#{2ʐ�r�_L��m�
��Y�\�{ʵ�''�����x �)�~�pN]��/�F��vܞ��w\�ى�i��{��рt<�&$k˫����g_C�?�UU��rn      "   \   x�=���0��a�@޻t�9j'RE$Np8�DC0P1No��@=��"+li�K�n���3���^8�K����2=ٿ�T�'��!�#��         �   x����� �s��q����vč茂٢���K��E����e�<Bj����މ�v�4��I`,���KN���F�e�f(1^DG��b���\�P�1^_��2�t�cj��iiZ��P��;�A�UZ�y���XJ�`ee�ԭ��3a��\�82\@�h�x�6`kH�9�.����(ܶ�9 � �X�      %      x������ � �      !   Z   x�U���0���K+ 	Iv��s������:Ld^�T�2�����H`m�X��XD���V�ZYKۧM4����h��߈>7���      #   �   x����n� ���ܼX]W�#K��-�&M���Q��m/E_��G���Jh�8�Nf1!>�?p�����~!�@+-��9�SU084�M4�(�Ư$w�dm��A���z3������ѥ���:��m~���G{�hD�d���F���4Y\M� %Z�%�b'R�Q�M(!�Hm􇡽q�����$�H=��֫�6o�I���m��j_-S�@��9S��:
;�>�C3�HH���O���z�         9  x������ �>7n�"r�54�j�}��X��C�=�Iד�~��X�b���L�Q�b����FCZחF�
/�n��t��E����8���u�̓6u�44���ـ��	k�;����dX�H���s��	����B47�+�-��!<	>XwHhd��N�p3���3cl
��RF"�V�R�BUZ$B��h�.x�S��n��].)���D=�PH����Nz��ˠw�����u*��%�[�ĵ^��Kb�g��xfW~�����~�iBU��ӱ)��w�Z�`��*������     