-- _________________________________________________________________________________________________________________________
-- mysql 2021
-- se pide crear la base de datos de script
-- Enzo manuel Valenzuela
-- _________________________________________________________________________________________________________________________
CREATE DATABASE ESTUDIO; -- crear base de datos estudio
USE ESTUDIO;-- usar estudio
-- _________________________________________________________________________________________________________________________
-- Tabla Cliente -----------------------------------------------------------------------------------------------------------
CREATE TABLE cliente(
dni INT,
apellido varchar(45),
nombre varchar(45),
domicilio varchar(45),
primary key(dni));
-- Tabla OT ----------------------------------------------------------------------------------------------------------------
CREATE TABLE ot(
numero INT AUTO_INCREMENT,
cliente_dni INT,
tecnico_cuit INT,
fechahora_emision DATETIME,
fechahora_realizacion DATETIME,
primary key(numero),
foreign key(cliente_dni)references cliente(dni),
foreign key(tecnico_cuit)references tecnico(cuil));
-- Tabla Tecnico -----------------------------------------------------------------------------------------------------------
CREATE TABLE tecnico(
cuil INT,
apellido varchar(45),
nombre varchar(45),
fecha_ingreso DATETIME,
primary key(cuil));
-- Tabla Detalle_OT---------------------------------------------------------------------------------------------------------
CREATE TABLE detalle_ot(
ot_numero INT,
material_codigo INT,
cantidad INT,
primary key(ot_numero),
foreign key(ot_numero)references ot(numero),
foreign key(material_codigo)references material(codigo));
-- Tabla Material ----------------------------------------------------------------------------------------------------------
CREATE TABLE material(
codigo INT,
material varchar(45),
primary key (codigo));
-- Tabla Material_Por_Proveedor --------------------------------------------------------------------------------------------
CREATE TABLE material_por_proveedor(
material_cod int,
proveedor_cuit int,
precio decimal,
primary key(material_cod),
foreign key(material_cod)references material(codigo),
foreign key(proveedor_cuit)references proveedor(cuit));
-- Tabla proveedor ----------------------------------------------------------------------------------------------------------
CREATE TABLE proveedor(
cuit INT,
razon_social varchar(45),
domicilio varchar(45),
primary key(cuit));
-- _________________________________________________________________________________________________________________________