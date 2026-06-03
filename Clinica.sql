CREATE DATABASE clinica;

CREATE TABLE pacientes (
    idpaciente      VARCHAR(10)     NOT NULL PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    direccion       VARCHAR(150),
    telefono        VARCHAR(15),
    email           VARCHAR(100),
    fecha_nacimiento DATE,
    tipo_paciente   VARCHAR(20)     NOT NULL  -- 'PARTICULAR', 'ASEGURADO', 'CONVENIO'
);

CREATE TABLE medicos (
    idmedico        VARCHAR(10)     NOT NULL PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    direccion       VARCHAR(150),
    telefono        VARCHAR(15),
    email           VARCHAR(100),
    cmp             VARCHAR(20)     NOT NULL,  -- Código del Colegio Médico del Perú
    idespecialidad  VARCHAR(10)     NOT NULL,
    CONSTRAINT fk_medico_especialidad FOREIGN KEY (idespecialidad)
        REFERENCES especialidades(idespecialidad)
);

CREATE TABLE sedes (
    idsede      VARCHAR(10)     NOT NULL PRIMARY KEY,
    nombre      VARCHAR(100)    NOT NULL,
    direccion   VARCHAR(150)    NOT NULL,
    telefono    VARCHAR(15),
    email       VARCHAR(100),
    distrito    VARCHAR(80),
    ciudad      VARCHAR(80)
);

CREATE TABLE especialidades (
    idespecialidad  VARCHAR(10)     NOT NULL PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    descripcion     VARCHAR(250),
    area            VARCHAR(80)     -- 'CLINICA', 'QUIRURGICA', 'DIAGNOSTICO'
);

-- 1. Crear el login a nivel de servidor
CREATE LOGIN sa1 WITH PASSWORD = '12345678';

-- 3. Usar la base de datos
USE clinica;

-- 4. Crear el usuario dentro de la base de datos
CREATE USER sa1 FOR LOGIN sa1;

-- 5. Darle permisos completos
ALTER ROLE db_owner ADD MEMBER sa1;