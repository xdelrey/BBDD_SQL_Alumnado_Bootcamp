-- Obtener la cantidad de alumnos que hay por campus

SELECT campus.nombre, COUNT(alumno.id_alumno) FROM alumno;
INNER JOIN clase ON alumno.clase_id = clase.id_clase
INNER JOIN campus ON clase.campus_id = campus.id_campus
GROUP BY campus.nombre


-- Obtener los alumnos que pertenecen a la promoción de septiembre

SELECT alumno.nombre, promocion.nombre FROM alumno
INNER JOIN clase ON alumno.clase_id = clase.id_clase
INNER JOIN promocion ON clase.promocion_id = promocion.id_promocion
WHERE promocion.nombre = 'Septiembre'


-- Obtener los alumnos que han aprobado la asignatura 'Proyecto_FrontEnd'

SELECT alumno.nombre, proyecto.nombre_proyecto, notas.calificacion 
CASE
WHEN notas.calificacion = 'Apto' THEN true
ELSE false
END
FROM notas
INNER JOIN alumno ON notas.alumno_id = alumno.id_alumno
INNER JOIN proyecto ON notas.proyecto_id = proyecto.id_proyecto
WHERE proyecto.nombre_proyecto = 'Proyecto_FrontEnd' AND notas.calificacion = 'Apto'

  
-- Obtener los profesores de Data Science de la promoción de septiembre

SELECT profesorado.nombre, vertical.bootcamp, promocion.nombre FROM cuadrante
INNER JOIN clase ON cuadrante.clase_id = clase.id_clase
INNER JOIN profesorado ON cuadrante.profesor_id = profesorado.id_profesor
INNER JOIN vertical ON clase.vertical_id = vertical.id_vertical
INNER JOIN promocion ON clase.promocion_id = promocion.id_promocion
WHERE vertical.bootcamp = 'DS' AND promocion.nombre = 'Septiembre'
