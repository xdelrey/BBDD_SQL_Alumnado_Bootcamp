
CREATE TABLE Vertical (
    id_vertical SERIAL PRIMARY KEY,
    bootcamp VARCHAR(60)
);

CREATE TABLE Promocion (
    id_promocion SERIAL PRIMARY KEY,
    nombre VARCHAR(120),
    fecha_comienzo DATE
);

CREATE TABLE Campus (
    id_campus SERIAL PRIMARY KEY,
    ubicacion VARCHAR(60)
);

CREATE TABLE Proyecto (
    id_proyecto SERIAL PRIMARY KEY,
    nombre_proyecto VARCHAR(40)
);

CREATE TABLE Profesorado (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(120),
    rol VARCHAR(10)
);

CREATE TABLE Clase (
    id_clase SERIAL PRIMARY KEY,
    campus_id INT,
    profesor_id INT,
    promocion_id INT,
    vertical_id INT,
    modalidad VARCHAR(60),
    FOREIGN KEY (campus_id) REFERENCES Campus(id_campus),
    FOREIGN KEY (profesor_id) REFERENCES Profesorado(id_profesor),
    FOREIGN KEY (promocion_id) REFERENCES Promocion(id_promocion),
    FOREIGN KEY (vertical_id) REFERENCES Vertical(id_vertical)
);

CREATE TABLE Cuadrante (
    id_cuadrante SERIAL PRIMARY KEY,
    profesor_id INT,
    clase_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesorado(id_profesor),
    FOREIGN KEY (clase_id) REFERENCES Clase(id_clase)
);

CREATE TABLE Alumno (
    id_alumno SERIAL PRIMARY KEY,
    clase_id INT,
    nombre VARCHAR(120),
    email VARCHAR(80),
    FOREIGN KEY (clase_id) REFERENCES Clase(id_clase)
);


CREATE TABLE Notas (
    id_nota SERIAL PRIMARY KEY,
    alumno_id INT,
    proyecto_id INT,
    calificacion BOOLEAN,
    FOREIGN KEY (alumno_id) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (proyecto_id) REFERENCES Proyecto(id_proyecto)
);
