
go
use DBTIENDANAS
go

--select * from PLANCUENTAS
--INNER JOIN RUBRO ON PLANCUENTAS.PlanCuentasId = RUBRO.PlanCuentasId
--where PLANCUENTAS.Tipo = 'Activo'


--REGISTROS EN PLANCUENTAS
--PATRIMONIALES
INSERT INTO PLANCUENTAS(Tipo) VALUES('Activo')--EFECTIVO (CAJA)
INSERT INTO PLANCUENTAS(Tipo) VALUES('Pasivo')--MERCADERIA A PROVEERDOR
INSERT INTO PLANCUENTAS(Tipo) VALUES('Patrimonio Neto')--CUENTA CAPITAL SOCIAL, REPRESENTA LOS APORTES QUE HACEN LOS SOCIOS AL INICIAR LAS ACTIVIDADES
--RESULTADO
INSERT INTO PLANCUENTAS(Tipo) VALUES('Ingresos')--COBRO DE UN ALQUILER +
INSERT INTO PLANCUENTAS(Tipo) VALUES('Egresos')--LUZ - GAS - TELEFONO  -

--REGISTROS EN RUBRO
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 1, 'Caja y Bancos')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 2, 'Inversiones')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 3, 'Creditos')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 4, 'Bienes de Cambio')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 5, 'Bienes de Uso')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(1, 6, 'Bienes Intangibles')

INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(2, 1, 'Obligaciones')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(2, 2, 'Previsiones')

INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(3, 1, 'Capital')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(3, 2, 'Resultado Acumulado')

INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(4, 1, 'Ventas')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(4, 2, 'Alquileres Obtenidos')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(4, 3, 'Intereses Adquiridos')

INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(5, 1, 'Costo de las Mercaderias Vendidas')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(5, 2, 'Alquileres Cedidos')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(5, 3, 'Intereses cedidos')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(5, 4, 'Gastos Generales')
INSERT INTO RUBRO(PlanCuentasId, Numero, Tipo) VALUES(5, 5, 'Sueldos y Jornales')

--REGISTROS EN CUENTAS
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(1, 1, 'Caja')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(1, 2, 'Banco Cta. Cte.')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(1, 3, 'Moneda Extranjera')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(2, 1, 'Titulos Publicos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(2, 2, 'Banco Plazo Fijo')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(3, 1, 'Deudores por Venta')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(3, 2, 'Cocumentos a Cobrar')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(3, 3, 'Deudores Varios')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(4, 1, 'Mercaderias')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 1, 'Rodados')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 2, 'Inmuebles')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 3, 'Instalaciones')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 4, 'Equipos de Computacion')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 5, 'Muebles y Utiles')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(5, 6, 'Maquinarias')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(6, 1, 'Marcas')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(6, 2, 'Marca/Fondo de Comercio')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(7, 1, 'Proveedores')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(7, 2, 'Documentos a Pagar')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(7, 3, 'Acreedores Varios')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(8, 1, 'Deudores Incobrables')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(8, 2, 'Despidos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(8, 3, 'Servicios')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(9, 1, 'Capital')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(10, 1, 'Resultados no Asignados')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(10, 2, 'Resultados del Ejercicio')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(11, 1, 'Ventas')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(12, 1, 'Alquileres Obtenidos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(13, 1, 'Intereses Adquiridos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(14, 1, 'Costo de las Mercaderias Vendidas')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(15, 1, 'Alquileres Cedidos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(16, 1, 'Intereses Cedidos')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(17, 1, 'Gastos Generales')
INSERT INTO CUENTA(RubroId, Numero, Tipo) VALUES(18, 1, 'Sueldos y Jornales')

GO

--REGISTROS EN TABLA ROL
INSERT INTO ROL(Descripcion) VALUES ('ADMINISTRADOR'),('EMPLEADO')
/*<i class="fa-thin fa-book-open-cover"></i>*/
GO
--REGISTROS EN TABLA MENU
INSERT INTO MENU(Nombre,Icono) VALUES ('Mantenedor','fa fa-cogs'),('Compras','fa fa-shopping-basket'),('Ventas','fa fa-tags'),('Reportes','fa fa-tasks'),('Contable','fa fa-book')

GO
--REGISTROS EN TABLA SUBMENU
INSERT INTO SUBMENU(IdMenu,Nombre,NombreFormulario) VALUES
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Rol','frmRol'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Asignar rol permisos','frmRolPermiso'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Usuario','frmUsuario'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Proveedor','frmProveedor'),
--((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Tienda','frmTienda'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Categoria','frmCategoria'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Producto','frmProducto'),
--((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Mantenedor'),'Asignar producto a tienda','frmProductoTienda'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Registrar','frmRegistrarCompra'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Compras'),'Consultas','frmConsultarCompra'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Ventas'),'Crear Nueva','frmCrearVenta'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Ventas'),'Consultar','frmConsultarVenta'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Reportes'),'Productos por tienda','rptProductoTienda'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Reportes'),'Ventas','rptVentas'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Contable'),'Libro Mayor','frmLibroMayor'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Contable'),'Libro Diario','frmLibroDiario'),
((SELECT TOP 1 IdMenu FROM MENU WHERE Nombre = 'Contable'),'Cuentas','frmCuentas')
GO
--REGISTROS EN TABLA TIENDA
INSERT INTO TIENDA(Nombre,RUC,Direccion,Telefono) VALUES ('Tienda 93','25689789654','San Martín Nº 101','963852896')

GO
--REGISTROS USUARIO
insert into usuario(Nombres,Apellidos,Correo,Usuario,Clave,IdTienda,IdRol)
values('Nicolas','Santillan','snk@gmail.com','Admin','Admin123',(select TOP 1 IdTienda from TIENDA where Nombre = 'Tienda 93'),(select TOP 1 IdRol from ROL where Descripcion = 'ADMINISTRADOR'))
go
insert into usuario(Nombres,Apellidos,Correo,Usuario,Clave,IdTienda,IdRol)
values('Juan','Perez','snk@gmail.com','Tienda','Tienda123',(select TOP 1 IdTienda from TIENDA where Nombre = 'Tienda 93'),(select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO'))


GO
--REGISTROS EN TABLA PERMISOS
INSERT INTO PERMISOS(IdRol,IdSubMenu)
SELECT (select TOP 1 IdRol from ROL where Descripcion = 'ADMINISTRADOR'), IdSubMenu FROM SUBMENU
go
INSERT INTO PERMISOS(IdRol,IdSubMenu,Activo)
SELECT (select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO'), IdSubMenu, 0 FROM SUBMENU 

go

update p set p.Activo = 1 from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
where sm.NombreFormulario in ('frmCrearVenta','frmConsultarVenta') and p.IdRol = (select TOP 1 IdRol from ROL where Descripcion = 'EMPLEADO')


GO
--REGISTRO EN TABLA CATEGORIA
INSERT INTO CATEGORIA(Descripcion) VALUES
('Bebidas'),
('Frutas'),
('Embutidos'),
('Lacteos')

GO
--REGISTRO EN TABLA PRODUCTO
INSERT INTO PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria)
values
(
RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),
(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),
'Inca Kola',
'Gaseosa 3Lts',
(select top 1 IdCategoria from CATEGORIA where Descripcion = 'Bebidas')
)
GO
INSERT INTO PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria)
values
(
RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),
(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),
'Mantequilla Gloria',
'bote de 500 mg',
(select top 1 IdCategoria from CATEGORIA where Descripcion = 'Embutidos')
)
GO
INSERT INTO PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria)
values
(
RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),
(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),
'Coca Cola',
'1.5 Lts',
(select top 1 IdCategoria from CATEGORIA where Descripcion = 'Bebidas')
)
GO
INSERT INTO PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria)
values
(
RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),
(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),
'Mermelada Fanny',
'Bote 310g',
(select top 1 IdCategoria from CATEGORIA where Descripcion = 'Embutidos')
)
GO
INSERT INTO PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria)
values
(
RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),
(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),
'Queso Perfecta',
'Empaque 350g',
(select top 1 IdCategoria from CATEGORIA where Descripcion = 'Lacteos')
)

---- ingreso de mercaderia
--insert into LIBRO(Asiento, Cuenta, DebeCuenta, Debe) 
--values(1, 9, '+', 10000)

---- Debemos a el proveedor
--insert into LIBRO(Asiento, Cuenta, HaberCuenta, Haber) 
--values((SELECT MAX(Asiento) FROM LIBRO), 18, '+', 10000)

---- Realizamos pago al proveedor
---- Restamos pasivo al proveedor
--insert into LIBRO(Asiento, Cuenta, DebeCuenta, Debe) 
--values((SELECT MAX(Asiento)+1 FROM LIBRO), 18, '-', 10000)

---- Restamos activo de la caja
--insert into LIBRO(Asiento, Cuenta, HaberCuenta, Haber) 
--values((SELECT MAX(Asiento) FROM LIBRO), 1, '-', 10000)

-- Ingreso en la caja la caja
insert into LIBRO(Asiento, Cuenta, DebeCuenta, Debe) 
values(1, 1, '+', 10000)