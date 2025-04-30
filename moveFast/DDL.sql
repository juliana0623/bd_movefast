-- Tabla que almacena los datos de los clientes
CREATE TABLE cliente ( 
    cliente_id INT,  -- ID único (clave primaria)
    nombre VARCHAR(100) NOT NULL,  -- nombre obligatorio
    apellido VARCHAR(100) NOT NULL,  -- apellido obligatorio
    correo VARCHAR(100) NOT NULL UNIQUE,  -- El correo debe ser único y no nulo
    fecha_de_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- si no se ingresa, se asigna la actual
    CHECK (correo LIKE '%@%'),  -- Valida que el correo tenga al menos un '@'
    CONSTRAINT pk_cliente PRIMARY KEY (cliente_id)  -- Clave primaria de la tabla
);

-- Tabla que almacena las sucursales donde están ubicados los vehículos
CREATE TABLE sucursal (
    sucursal_id INT,  -- ID único 
    nombre VARCHAR(30) NOT NULL,  -- nombre obligatorio
    ciudad VARCHAR(100) NOT NULL,  -- ciudad obligatoria
    direccion VARCHAR(150) NOT NULL,  -- Dirección obligatoria
    CHECK (LENGTH(nombre) >= 3),  -- Se valida que el nombre tenga al menos 3 caracteres
    CHECK (LENGTH(ciudad) > 0),  -- La ciudad tiene más de 0 caracteres
    CHECK (LENGTH(direccion) > 0),  -- La dirección tiene más de 0 caracteres
    CONSTRAINT pk_sucursal PRIMARY KEY (sucursal_id)  -- Clave primaria de la tabla
);

-- Tabla que almacena los vehículos disponibles para alquilar
CREATE TABLE vehiculo (
    placa_vehiculo VARCHAR(10),  -- identificador único
    marca VARCHAR(50) NOT NULL,  -- Marca obligatorio
    modelo INT NOT NULL,  -- Año del modelo obligatorio (debe estar en rango)
    esta_disponible BOOLEAN NOT NULL DEFAULT TRUE,  -- Indica si el vehículo está disponible (valor por defecto: TRUE)
    sucursal_id INT,  -- Relación con la sucursal donde se encuentra el vehículo
    CHECK (modelo BETWEEN 2000 AND 2025),  -- Restricción de año permitido para el modelo
    CONSTRAINT pk_vehiculo PRIMARY KEY(placa_vehiculo),  -- Clave primaria
    CONSTRAINT fk_sucursal FOREIGN KEY(sucursal_id) 
        REFERENCES Sucursal(sucursal_id) 
        ON DELETE SET NULL  -- Si se elimina la sucursal, se pone NULL en el vehículo
        ON UPDATE CASCADE  -- Si cambia el ID de la sucursal, se actualiza en los vehículos relacionados
);

-- Tabla que almacena los alquileres realizados por los clientes
CREATE TABLE alquiler (
    alquiler_id INT,  -- ID único 
    fecha_inicio DATE NOT NULL DEFAULT CURRENT_DATE,  -- Fecha en la que inicia el alquiler (por defecto, fecha actual)
    fecha_fin DATE NOT NULL,  -- Fecha final del alquiler (obligatoria)
    esta_activo BOOLEAN NOT NULL DEFAULT TRUE,  -- Indica si el alquiler está activo (por defecto TRUE)
    cliente_id INT,  -- Relación con el cliente que realiza el alquiler
    placa_vehiculo VARCHAR(10),  -- Relación con el vehículo alquilado
    CONSTRAINT pk_alquiler PRIMARY KEY (alquiler_id),  -- Clave primaria
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) 
        REFERENCES Cliente(cliente_id) 
        ON UPDATE CASCADE  -- Si cambia el ID del cliente, se actualiza aquí
        ON DELETE CASCADE, -- Si se elimina el cliente, se eliminan sus alquileres
    CONSTRAINT fk_vehiculo FOREIGN KEY (placa_vehiculo) 
        REFERENCES Vehiculo(placa_vehiculo) 
        ON DELETE SET NULL  -- Si se elimina el vehículo, se deja el campo nulo
        ON UPDATE CASCADE  -- Si cambia la placa, se actualiza aquí
);

-- Tabla que registra los pagos hechos por cada alquiler
CREATE TABLE pago (
    pago_id INT,  -- ID único 
    cantidad_de_pago DECIMAL(10,2) NOT NULL CHECK (cantidad_de_pago > 0),  -- El monto debe ser positivo y no nulo
    fecha_pago DATE NOT NULL DEFAULT CURRENT_DATE,  -- Fecha del pago (por defecto, fecha actual)
    alquiler_id INT,  -- Relación con el alquiler que se está pagando
    CONSTRAINT pk_pago PRIMARY KEY (pago_id),  -- Clave primaria
    CONSTRAINT fk_alquiler FOREIGN KEY (alquiler_id) 
        REFERENCES Alquiler(alquiler_id) 
        ON DELETE SET NULL  -- Si se elimina el alquiler, el campo queda en NULL
        ON UPDATE CASCADE -- Si cambia el ID del alquiler, también se actualiza en esta tabla
);
