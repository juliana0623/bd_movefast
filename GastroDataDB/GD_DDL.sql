CREATE TABLE cliente (
    id_cliente INT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    observaciones VARCHAR(60) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(id_cliente),
);

CREATE TABLE Mesero (
    id_mesero INT,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
	CONSTRAINT pk_mesero PRIMARY KEY(id_mesero)
);

CREATE TABLE platillo (
    id_platillo INT,
    nombre VARCHAR(30) NOT NULL,
    importe INT NOT NULL,
	CONSTRAINT pk_platillo PRIMARY KEY(id_platillo),
	CHECK (importe >= 0)
);

CREATE TABLE bebida (
    id_bebida INT,
    nombre VARCHAR(30) NOT NULL,
    importe INT NOT NULL,
	CONSTRAINT pk_bebida PRIMARY KEY(id_bebida),
	CHECK (importe >= 0),
);

CREATE TABLE mesa (
    id_mesa INT,
    num_comensales INT NOT NULL,
    ubicacion VARCHAR(45) NOT NULL,
	CONSTRAINT pk_mesa PRIMARY KEY(id_mesa),
	CHECK (num_comensales > 0)
);

CREATE TABLE factura (
    id_factura INT,
    fecha_factura DATE NOT NULL DEFAULT CURRENT_DATE,
    id_cliente INT NOT NULL,
    id_mesero INT NOT NULL,
    id_mesa INT NOT NULL,
    id_platillo INT,
    id_bebida INT NOT NULL,
	CONSTRAINT pk_factura PRIMARY KEY(id_factura),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (id_mesero) REFERENCES Mesero(id_mesero) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa) ON UPDATE CASCADE ON DELETE SET NULL,
 	FOREIGN KEY (id_platillo) REFERENCES Platillo(id_platillo) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (id_bebida) REFERENCES Bebida(id_bebida) ON UPDATE CASCADE ON DELETE SET NULL,
);
