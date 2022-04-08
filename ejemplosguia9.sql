USE Northwind;
--Ejemplo1 Trigger
--Creacion de triggers
CREATE TRIGGER modificacion_Clientes
ON Customers FOR UPDATE AS 
PRINT 'Han actualizado la tabla de Customers'

--Comprobacion de trigger para update
UPDATE Customers SET ContactName = 'Maria Walters'
WHERE CustomerID =  'AROUT'

--Ejemplo2 Trigger
SELECT * FROM deleted

CREATE TABLE tablaPruebas
(
	codigo INT,
	nombre VARCHAR(30),
	fecha DATE
)

CREATE TRIGGER TriggertablaPruebas ON tablaPruebas
AFTER INSERT, UPDATE, DELETE
AS
	SELECT * FROM deleted;
	SELECT * FROM inserted;



INSERT INTO tablaPruebas VALUES (1, 'María Morales', '2016-05-14'),
								(2, 'Luis Alberto Pérez', '2016-05-29')

DELETE FROM tablaPruebas WHERE codigo = 2

UPDATE tablaPruebas SET nombre = 'Marcia Morales' WHERE codigo = 1





--PARTE DE EJEMPLOS DE LA GUIA

--EJEMPLO 1
CREATE PROCEDURE Mostrar_10_pedidos_PS212544
AS 
DECLARE @contador int
DECLARE @num int

SET @contador = 0
--Obteniendo el primer valor del campo OrderID de la tabla Orders
SET @num = (SELECT TOP 1 OrderID FROM Orders ORDER BY OrderID)

--Evalua si el contador es menor que 10, si la condicion se cumple
--realiza la instruccion SELECT

WHILE @contador < 10
BEGIN
	SELECT OrderID, OrderDate FROM Orders WHERE OrderID = @num + @contador
	--Se incrementa el contador
	SET @contador = @contador + 1
END

--Ejecutamos el procedimiento almacenado
EXEC Mostrar_10_pedidos_PS212544


--EJEMPLO2

CREATE PROCEDURE Actualizar_precio_PS212544
AS
	WHILE(SELECT AVG(UnitPrice) FROM Products) < 300
	BEGIN
		UPDATE Products
		SET UnitPrice = UnitPrice * 2
		SELECT MAX(UnitPrice) AS [Precio Máximo] FROM Products
		IF (SELECT MAX(UnitPrice) FROM Products) < 500
			BREAK
			--Sale del bucle mas interno en una instruccion	WHILE o una instruccion IF-else
			--dentro de un bucle WHILE
			ELSE
				CONTINUE
				--Reinicia un bucle WHILE. Las instrucciones que se encuentren despues de la 
				--palabra clave CONTINUE se omiten
			END
			--Aquí termina el código del procedimiento

			SELECT UnitPrice FROM Products ORDER BY UnitPrice DESC

			EXECUTE Actualizar_precio_PS212544


