-- _________________________________________________________________________________________________________________________
-- mysql 2021
-- se pide crear procedimientos segun los puntos en el tp
-- Enzo manuel Valenzuela
-- _________________________________________________________________________________________________________________________
-- 1) Listado de materiales del proveedor de cuit 11-11111111-1 indicando los precios y materiales
-- 2) Listado de tecnicos que hayan instalado un material de codigo 34567 mayor a 10 (apellido,nombre,cantidad)
-- 3) Listado de todos los proveedores del material de codigo 12345 cuyo precio supere al promedio de los precios de todos 
--    los proveedores de dicho articulo(nombre,cuit,precio)
-- 4) listado de ot cuyo material 23456 no se utilice(omit)
-- 5) listado de consumo de materiales para el mes 9/2019 disctiminado por quincena(codigo de material,quincena,material)
-- regimen de entidades
-- _________________________________________________________________________________________________________________________
-- Tabla Cliente -----------------------------------------------------------------------------------------------------------
-- dni INT,
-- apellido varchar(45),
-- nombre varchar(45),
-- domicilio varchar(45),primary key(dni)
-- Tabla OT ----------------------------------------------------------------------------------------------------------------
-- numero INT AUTO_INCREMENT,
-- cliente_dni INT,
-- tecnico_cuit INT,
-- fechahora_emision DATETIME,
-- fechahora_realizacion DATETIME,primary key(numero),
-- foreign key(cliente_dni)references cliente(dni),foreign key(tecnico_cuit)references tecnico(cuil)
-- Tabla Tecnico -----------------------------------------------------------------------------------------------------------
-- cuil INT,
-- apellido varchar(45),
-- nombre varchar(45),
-- fecha_ingreso DATETIME,primary key(cuil)
-- Tabla Detalle_OT---------------------------------------------------------------------------------------------------------
-- ot_numero INT,
-- material_codigo INT,
-- cantidad INT,primary key(ot_numero),
-- foreign key(ot_numero)references ot(numero),foreign key(material_codigo)references material(codigo)
-- Tabla Material ----------------------------------------------------------------------------------------------------------
-- codigo INT,
-- material varchar(45),primary key (codigo)
-- Tabla Material_Por_Proveedor----------------------------------------------------------------------------------------------
-- material_cod int,
-- proveedor_cuit int,
-- precio decimal,
-- primary key(material_cod),
-- foreign key(material_cod)references material(codigo),
-- foreign key(proveedor_cuit)references proveedor(cuit)
-- Tabla proveedor ----------------------------------------------------------------------------------------------------------
-- cuit INT,
-- razon_social varchar(45),
-- domicilio varchar(45),primary key(cuit)
-- _________________________________________________________________________________________________________________________
USE ESTUDIO;-- SE UTILIZA LA BASE DE DATOS ESTUDIO
-- _________________________________________________________________________________________________________________________
-- 1)____________________________
SELECT p.nombre,material from material inner join material_por_proveedor p on material_cod=codigo
 where p.proveedor_cuit=11111111111;
-- 2)____________________________
SELECT apellido,nombre,count(tecnico)as cantidad from tecnico inner join ot o on tecnico_cuit=cuit inner join detalle_ot t on 
 ot_numero=numero where material_codigo=34567;
-- 3)____________________________
SELECT razon_social,cuit,mp.precio from proveedor inner join material_por_proveedor mp on cuit=proveedor_cuit
 where material_cod=12345;
-- 4)____________________________
SELECT * from ot where material_cod=23456;
-- 5)____________________________(omit)