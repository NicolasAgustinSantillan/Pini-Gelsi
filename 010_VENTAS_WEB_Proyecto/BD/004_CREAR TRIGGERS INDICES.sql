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
					update PRODUCTO_TIENDA set PrecioUnidadVenta = @precioUnidad WHERE IdProducto = @idProducto
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