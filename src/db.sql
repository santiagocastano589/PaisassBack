CREATE DATABASE TorneosDB;
GO
USE TorneosDB;
GO

-- Tabla de árbitros
CREATE TABLE arbitro (
    id_arbitro INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(50) UNIQUE,
    telefono VARCHAR(20),
    sexo VARCHAR(20),
    deporte VARCHAR(30)
);
GO

-- Tabla de jugadores
CREATE TABLE jugador (
    id_jugador INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(50) UNIQUE,
    telefono VARCHAR(20),
    sexo VARCHAR(20)
);
GO

-- Tabla de torneos
CREATE TABLE torneo (
    id_torneo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    modalidad VARCHAR(50),
    disciplina VARCHAR(50),
    fecha_inicio DATE,
    fecha_final DATE,
    costo_inscripcion DECIMAL(10,2),
    ubicacion VARCHAR(100),
    estado VARCHAR(20) DEFAULT 'Programado',
    max_equipos INT,
    reglamento TEXT,
    organizador VARCHAR(100),
    premio DECIMAL(10,2)
);
GO

-- Tabla de equipos
CREATE TABLE equipo (
    id_equipo INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_torneo INT NOT NULL,
    FOREIGN KEY (id_torneo) REFERENCES torneo(id_torneo) ON DELETE CASCADE
);
GO

-- Relación entre jugadores y equipos
CREATE TABLE equipo_jugador (
    id_equipo INT NOT NULL,
    id_jugador INT NOT NULL,
    PRIMARY KEY (id_equipo, id_jugador),
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo) ON DELETE CASCADE,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador) ON DELETE CASCADE
);
GO

-- Relación entre árbitros y torneos
CREATE TABLE torneo_arbitro (
    id_torneo INT NOT NULL,
    id_arbitro INT NOT NULL,
    PRIMARY KEY (id_torneo, id_arbitro),
    FOREIGN KEY (id_torneo) REFERENCES torneo(id_torneo) ON DELETE CASCADE,
    FOREIGN KEY (id_arbitro) REFERENCES arbitro(id_arbitro) ON DELETE CASCADE
);
GO

-- Tabla de partidos
CREATE TABLE partido (
    id_partido INT IDENTITY(1,1) PRIMARY KEY,
    id_torneo INT NOT NULL,
    id_equipo1 INT NOT NULL,
    id_equipo2 INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_arbitro INT NULL,
    FOREIGN KEY (id_torneo) REFERENCES torneo(id_torneo) ON DELETE CASCADE,
    FOREIGN KEY (id_equipo1) REFERENCES equipo(id_equipo) ON DELETE CASCADE,
    FOREIGN KEY (id_equipo2) REFERENCES equipo(id_equipo) ON DELETE CASCADE,
    FOREIGN KEY (id_arbitro) REFERENCES arbitro(id_arbitro) ON DELETE SET NULL
);
GO

-- Tabla de resultados
CREATE TABLE resultado (
    id_resultado INT IDENTITY(1,1) PRIMARY KEY,
    id_partido INT NOT NULL,
    goles_equipo1 INT NOT NULL DEFAULT 0,
    goles_equipo2 INT NOT NULL DEFAULT 0,
    ganador INT NULL,
    FOREIGN KEY (id_partido) REFERENCES partido(id_partido) ON DELETE CASCADE,
    FOREIGN KEY (ganador) REFERENCES equipo(id_equipo) ON DELETE SET NULL
);
GO
