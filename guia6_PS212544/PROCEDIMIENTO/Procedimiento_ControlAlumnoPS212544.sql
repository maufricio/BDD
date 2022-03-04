use master
GO

CREATE DATABASE ControlAlumnoPS212544
go

USE ControlAlumnoPS212544;
GO

CREATE TABLE Alumno(
	Carnet char(8) NOT NULL,
	NombreCompleto varchar(50)
	--creando la llave primaria de la tabla
	CONSTRAINT pk_alumno PRIMARY KEY(Carnet)
)
GO

CREATE TABLE Materia(
	Codigo char(5) NOT NULL, 
	Nombre varchar(30),
	UV int

	--creando la llave primaria de la tabla
	CONSTRAINT pk_materia PRIMARY KEY(Codigo),
	--creando una restriccion UNIQUE en el campo nombre de la materia
	CONSTRAINT u_nombre UNIQUE(Nombre),
	--Creando una restriccion CHeck en donde las unidades valorativas
	--se encuetren entre 2 y 5 unidades
	CONSTRAINT ck_uv CHECK (UV>=2 AND UV<=5)
)
GO

CREATE TABLE Inscripcion(
	Carnet char(8),
	CodigoMateria char(5),
	Ciclo char(5),
	--se esta creando una clave primaria compuesta
	--en donde la union de los tres datos es un valor unico
	CONSTRAINT pk_inscripcion PRIMARY KEY(Carnet,CodigoMateria,Ciclo)
)
GO

--Creando las relaciones entre tablas

--RELACION Inscripcion-Alumno

ALTER TABLE Inscripcion
ADD
--Creando la relacion entre la tabla inscripcion y la tabla alumno
CONSTRAINT fk_alumno_ins FOREIGN KEY (Carnet) REFERENCES Alumno(Carnet)
ON UPDATE CASCADE
ON DELETE CASCADE

GO

ALTER TABLE Inscripcion
ADD
--Creando la relacion entre la tabla inscripcion y la tabla materia
CONSTRAINT fk_materia_ins FOREIGN KEY (CodigoMateria) REFERENCES Materia(Codigo)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--Agregando multiples registros

INSERT INTO Alumno VALUES
('GH121214', 'Gerardo Hierro'),
('VN121415', 'Veronica Nuñez'),
('CD121515', 'Cesar Deras'),
('HL130334', 'Helen Lara'),
('GM119056', 'Gricelda Martinez')
GO

SELECT * FROM Alumno
GO

--Agregando datos a la tabla Materia, registro por registro

INSERT INTO Materia VALUES('BD01', 'Base de datos I', 4)
INSERT INTO Materia VALUES('IP01', 'Introduccion a la programacion', 4)
INSERT INTO Materia VALUES('AL01', 'Algebra Lineal', 3)
INSERT INTO Materia VALUES('RD02', 'Redes de area amplia', 5)
INSERT INTO Materia VALUES('GE01', 'Gestion Empresarial', 2)
INSERT INTO Materia VALUES('HM02', 'Humanistica II', 3)

SELECT * FROM Materia;

--Agregando datos especificando el orden de los campos de la tabla

INSERT INTO Inscripcion (Carnet, CodigoMateria, Ciclo)
VALUES ('GH121214', 'BD01', 'C1-15')
INSERT INTO Inscripcion (CodigoMateria, Carnet, Ciclo)
VALUES ('GE01', 'GH121214', 'C1-15')
INSERT INTO Inscripcion (Ciclo, Carnet, CodigoMateria)
VALUES('C1-15', 'GH121214', 'HM02')

SELECT * FROM Inscripcion;

--Uso de la instruccion UPDATE

UPDATE Alumno SET NombreCompleto = 'Gerardo Hernández' WHERE Carnet = 'GH121214'

SELECT * FROM Alumno
SELECT * FROM Inscripcion

UPDATE Alumno SET Carnet = 'GH111214' WHERE NombreCompleto = 'Gerardo Hernández'

SELECT * FROM Alumno
SELECT * FROM Inscripcion

--Uso de la instruccion DELETE

DELETE FROM Alumno WHERE Carnet = 'GH111214'

SELECT * FROM Alumno
SELECT * FROM Inscripcion

--FIN DEL MANEJO DE PROCEDIMIENTO DE LA BASE DE DATOS