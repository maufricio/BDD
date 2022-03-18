use Northwind;

--USO DE INNER JOIN
INSERT INTO Customers (CustomerID, CompanyName) VALUES ('TIPLE', 'Típicos Regionales'),
													   ('FLOSU', 'Flores del Sur');

INSERT INTO Orders(CustomerID) VALUES(NULL);

SELECT OrderID, Customers.CustomerID FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT OrderID as Ordenes, Customers.CustomerID as Cliente FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


--USO DE RIGHT JOIN

SELECT OrderID, Customers.CustomerID FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT OrderID as [Numero de Orden], Customers.CustomerID [Identificador Cliente] FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--USO DE RIGHT JOIN IS NULL

SELECT OrderID, Customers.CustomerID FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Customers.CustomerID IS NULL;

SELECT OrderID as [Identificador de Orden], Customers.CustomerID as [Identificador Cliente] FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Customers.CustomerID IS NULL;

--USO DE LEFT JOIN 

SELECT OrderId, Customers.CustomerID FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT OrderId as [Identificador Orden], Customers.CustomerID as [Identificador Cliente] FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- USO DE LEFT JOIN (IS NULL)

SELECT OrderID, Customers.CustomerID FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Orders.CustomerID IS NULL;

SELECT OrderID as [Identificador Orden], Customers.CustomerID as [Identificador Cliente] FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Orders.CustomerID IS NULL


--USO DEL FULL JOIN

SELECT OrderID, Customers.CustomerID FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT OrderID as [Identificador Orden], Customers.CustomerID as [Identificador Cliente] FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


--USO DEL FULL JOIN (IS NULL)

SELECT OrderID, Customers.CustomerID FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Customers.CustomerID IS NULL OR Orders.CustomerID IS NULL;

SELECT OrderID as [Identificador Orden], Customers.CustomerID as [Identificador Cliente] FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Customers.CustomerID IS NULL OR Orders.CustomerID IS NULL;

 
--USO DEL CROSS

SELECT OrderID, Customers.CustomerID FROM Customers CROSS JOIN Orders;

SELECT OrderID AS [Identificador Orden], Customers.CustomerID AS [Identificador Cliente] FROM Customers CROSS JOIN Orders WHERE Orders.OrderID = Customers.CustomerID; --arroja error de conversion

--SUBCONSULTAS IMPLEMENTADAS EN LA INSTRUCCION WHERE

SELECT CustomerID, CompanyName, ContactName, Country FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE OrderDate>='1998-01-01');

SELECT CustomerID, CompanyName, ContactName, Country FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders WHERE OrderDate >= '1998-01-01');

SELECT CustomerID, CompanyName, ContactName, Country FROM Customers WHERE CustomerID = (SELECT CustomerID FROM Orders WHERE OrderID = '10248');

SELECT CustomerID, CompanyName, ContactName, Country FROM Customers C WHERE EXISTS (SELECT * FROM Orders O WHERE C.CustomerID = O.CustomerID AND OrderDate >= '1998-01-01');

SELECT CustomerID, CompanyName, ContactName, Country FROM Customers C WHERE NOT EXISTS(SELECT * FROM Orders O WHERE C.CustomerID = O.CustomerID AND OrderDate >= '1998-01-01');

SELECT O.OrderID, OrderDate, (SELECT MAX(UnitPrice) FROM [Order Details] OD WHERE OD.OrderID = O.OrderID) AS MaxPrecioUnitario FROM Orders AS O;
