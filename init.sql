-- Crear la base de datos del SOC
CREATE DATABASE IF NOT EXISTS cibersystems_soc;
USE cibersystems_soc;

-- Tabla de Operadores (Empleados)
CREATE TABLE operadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    estado VARCHAR(20) DEFAULT 'ACTIVO'
);

-- Tabla de Tickets / Mensajes Internos
CREATE TABLE tickets_internos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    de_usuario VARCHAR(50),
    para_usuario VARCHAR(50),
    mensaje TEXT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla oculta con la Flag
CREATE TABLE flags_auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flag_code VARCHAR(100),
    descripcion VARCHAR(255)
);

-- Insertar datos de los empleados
INSERT INTO operadores (usuario, nombre, rol, estado) VALUES 
('m.vidal', 'Marta Vidal', 'CEO', 'ACTIVO'),
('c.ruiz', 'Carlos Ruiz', 'Lead SysAdmin', 'ACTIVO'),
('j.garcia', 'Javier Garcia', 'Director SOC', 'BAJA_PENDIENTE');

-- Insertar la trampa (Las credenciales SSH en texto plano)
INSERT INTO tickets_internos (de_usuario, para_usuario, mensaje) VALUES 
('m.vidal', 'c.ruiz', 'Carlos, revisa las alertas del firewall del Nivel 4, tenemos mucho ruido hoy.'),
('c.ruiz', 'j.garcia', 'Javi, te he reseteado la contraseña del servidor Linux para que puedas sacar tus scripts personales antes de irte. Tu nueva clave temporal es: MaverickSOC2025. Borra este mensaje cuando la leas.'),
('j.garcia', 'c.ruiz', 'Recibido. Me descargo mis cosas y cierro sesión. ¡Nos vemos en el Airsoft!');

-- Insertar la primera Flag del CTF (User Flag de Base de Datos)
INSERT INTO flags_auditoria (flag_code, descripcion) VALUES 
('FLAG{DB_EXPOSED_SOC_9942}', 'Felicidades Red Team. Has vulnerado el perímetro de datos.');