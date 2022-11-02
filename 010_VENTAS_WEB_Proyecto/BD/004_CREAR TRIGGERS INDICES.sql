go
use DBTIENDANAS
go

--(14) HISTORICO PARA PRODUCTO_TIENDA
if not exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PRODUCTO_TIENDA_HISTORICO')
create table PRODUCTO_TIENDA_HISTORICO(
IdProducto int references PRODUCTO(IdProducto),
PrecioUnidadVentaViejo float default 0,
PrecioUnidadVentaNuevo float default 0,
FechaUpdate DateTime default getdate()
)
go

IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'TD_PrecioCambiado')  
	DROP TRIGGER TD_PrecioCambiado
go

-- triger para cada vez que se modifique el precio de un producto
CREATE TRIGGER TD_PrecioCambiado
ON DETALLE_VENTA AFTER INSERT
AS
BEGIN TRY
		BEGIN TRAN
		-- SECCION ACTUALIZA EL PRECIO DE UN DE LOS PRODUCTOS QUE SE VENDIERON
		declare @idProducto int
		declare @precioUnidad float
		declare @precioUnidadOriginal decimal

		select @precioUnidad = PrecioUnidad, @idProducto = IdProducto from inserted

		select @precioUnidadOriginal = PrecioUnidadVenta from PRODUCTO_TIENDA WHERE IdProducto = @idProducto

			IF (@precioUnidadOriginal != @precioUnidad)
				BEGIN
					--update PRODUCTO_TIENDA set PrecioUnidadVenta = @precioUnidad WHERE IdProducto = @idProducto
					INSERT INTO PRODUCTO_TIENDA_HISTORICO(IdProducto, PrecioUnidadVentaViejo, PrecioUnidadVentaNuevo) VALUES (@idProducto, @precioUnidadOriginal, @precioUnidad)
				END
		COMMIT
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO

-- select * from PRODUCTO_TIENDA_HISTORICO


-- INDICES
if exists (select name from sysindexes where name = 'coberturaLibro') drop index coberturaLibro on Libro
create index coberturaLibro on Libro (IdLibro) include (asiento, Fecha, DebeCuenta, HaberCuenta, Debe, Haber)

if exists (select name from sysindexes where name = 'coberturaCuenta') drop index coberturaCuenta on CUENTA
create index coberturaCuenta on CUENTA (RubroId) include (Numero, Tipo)

if exists (select name from sysindexes where name = 'coberturaRubro') drop index coberturaRubro on Rubro
create index coberturaRubro on Rubro (PlanCuentasId) include (Numero)

if exists (select name from sysindexes where name = 'libro') drop index libro on LIBRO
create index libro on LIBRO (asiento)

SELECT L.Asiento as asiento, L.Fecha as fecha, CONCAT(PlanCuentas.PlanCuentasId, '.', R.Numero, '.', C.Numero) AS Numero, PLanCuentas.Tipo AS PlanCuentas, C.Tipo AS Cuenta,
	L.DebeCuenta as debe, L.HaberCuenta, L.Debe, L.Haber
	FROM PlanCuentas
	INNER JOIN Rubro as R ON PlanCuentas.PlanCuentasId = R.PlanCuentasId
	INNER JOIN CUENTA as C ON C.RubroId = R.RubroId
	INNER JOIN LIBRO as L ON L.Cuenta = C.CuentasId

select GETDATE()