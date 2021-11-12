-- -----------------------------------------------
-- Autor       : NTTData Centers - Sevilla
-- Descripción : Java - JDBC - MySQL - Taller 1
-- Responsable : Daniel Vázquez Muñoz
-- -----------nttdata_mysql_departament-----------

-- Eliminación de esquema.
DROP SCHEMA nttdata_javajdbc;

-- Creación de esquema.
CREATE SCHEMA nttdata_javajdbc DEFAULT CHARACTER SET utf8;

-- Uso de esquema.
USE nttdata_javajdbc;

-- Creación de tabla para departamentos.
CREATE TABLE nttdata_mysql_departament (
	
	id_departament INT NOT NULL AUTO_INCREMENT,
	nameDepartament VARCHAR(35),
	center VARCHAR(15),
	
	PRIMARY KEY(id_departament)
);

-- Creación de tabla para trabajadores.
CREATE TABLE nttdata_mysql_employee (
	
	id_employee INT NOT NULL AUTO_INCREMENT,
	nameEmployee VARCHAR(35),
	birth_date DATE,
	rol VARCHAR(20),
	id_departament INT,
	
	PRIMARY KEY(id_employee),
	FOREIGN KEY(id_departament) REFERENCES nttdata_mysql_departament(id_departament)
);

-- Añadido de departamentos.
INSERT INTO nttdata_mysql_departament (nameDepartament, center) 
VALUES ("RRHH", "Sevilla");
INSERT INTO nttdata_mysql_departament (nameDepartament, center) 
VALUES ("Programador Junior", "Sevilla");
INSERT INTO nttdata_mysql_departament (nameDepartament, center) 
VALUES ("Programador Senior", "Sevilla");
INSERT INTO nttdata_mysql_departament (nameDepartament, center) 
VALUES ("Jefe de Proyecto", "Sevilla");
INSERT INTO nttdata_mysql_departament (nameDepartament, center) 
VALUES ("Analista programador", "Sevilla");

-- Añadido de trabajadores.
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Sonia Pérez", '1985-11-21', "Programador", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Jefe de Proyecto"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Gustavo Rodríguez", '1986-04-10', "Analista", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Analista programador"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Daniel Vázquez", '1998-01-01', "Analista", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Analista programador"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Juan Manuel Hermida", '1988-12-20', "Programador", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Programador Senior"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Diego Strickland", '1985-09-04', "Programador", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Programador Senior"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Fátima García", '1996-04-21', "RRHH", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "RRHH"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Alexei Viadero", '1995-07-09', "RRHH", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "RRHH"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Juan Alejandro Tellez", '1980-11-08', "Programador", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Programador Junior"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Antonio Lobato", '1982-12-01', "Programador", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Programador Junior"));
INSERT INTO nttdata_mysql_employee (nameEmployee, birth_date, rol, id_departament) 
VALUES ("Manuel Lopera", '1989-12-21', "Analista", (SELECT id_departament FROM nttdata_mysql_departament WHERE nameDepartament = "Analista programador"));

