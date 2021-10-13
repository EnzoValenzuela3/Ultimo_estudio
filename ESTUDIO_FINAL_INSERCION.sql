-- _________________________________________________________________________________________________________________________
-- mysql 2021
-- se pide crear procedimientos de insercion de valores de las tablas(solo 3)
-- Enzo manuel Valenzuela
-- _________________________________________________________________________________________________________________________
-- Tabla Cliente -----------------------------------------------------------------------------------------------------------
-- dni INT,
-- apellido varchar(45),
-- nombre varchar(45),
-- domicilio varchar(45),primary key(dni)
-- Tabla OT ----------------------------------------------------------------------------------------------------------------
-- numero INT auto_increment,
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
-- TABLA Cliente ____________________________________________________________________________________________________
CREATE PROCEDURE alta_cliente (IN Idni INT,Iapellido varchar(45),Inombre varchar(45),Idomicilio varchar(45))
BEGIN
INSERT INTO cliente VALUES(Idni,Iapellido,Inombre,Idomicilio);
END;
call alta_cliente(12345678,"almeyda","ruvyralta","qwerty 124");
-- TABLA ot _________________________________________________________________________________________________________
CREATE PROCEDURE alta_ot (IN Icliente_dni INT,IN Itecnico_cuit INT,Ifechahora_emision DATETIME,Ifechahora_realizacion DATETIME)
BEGIN
INSERT INTO ot VALUES(numero,Icliente_dni,Itecnico_cuit,Ifechahora_emision,Ifechahora_realizacion)
END;
-- TABLA tecnico_____________________________________________________________________________________________________
CREATE PROCEDURE alta_tecnico(IN Icuil INT,Iapellido varchar(45),Inombre varchar(45),Ifecha_ingreso DATETIME)
BEGIN
INSERT INTO tecnico VALUES(Icuil,Iapellido,Inombre,Ifecha_ingreso)
END;
-- ____________________________