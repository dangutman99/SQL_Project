# Proyecto de Análisis SQL: Alquiler de Películas

## Descripción

Proyecto de SQL basado en una base de datos de alquiler de películas. El trabajo consiste en el desarrollo de consultas para la extracción, análisis y manipulación de datos, aplicando filtros, agregaciones, joins y otras técnicas SQL para obtener información de negocio.
El objetivo fue responder a distintas preguntas de negocio sobre el comportamiento de los clientes, el rendimiento del catálogo de películas, los ingresos y la actividad de las tiendas, transformando los datos en conclusiones útiles para la toma de decisiones.

## Estructura del proyecto

- consultas.sql # Archivo SQL con todas las consultas resueltas
- esquema_bbdd.png # Esquema de la base de datos proporcionada
- README.md # Esta documentación

Cada consulta del archivo consultas.sql está identificada con su número y su enunciado como comentario.

## Herramientas

- MySQL
- Consultas SQL (SELECT, WHERE, GROUP BY, ORDER BY)
- JOINs (INNER, LEFT)
- Funciones de agregación (COUNT, SUM, AVG, MIN, MAX)
- Subconsultas
- Filtros y ordenación de datos

## Resultados y Conclusiones

- Por categoría: algunas categorías de películas concentran la mayor parte de los alquileres e ingresos, mientras que otras tienen una demanda muy baja.
- Por cliente: un grupo reducido de clientes genera una parte significativa de los alquileres y del gasto total.
- Por tienda: existen diferencias claras en el volumen de alquileres e ingresos entre las distintas tiendas.
- Catálogo: hay películas que apenas se alquilan o que nunca se han alquilado, lo que indica margen para ajustar el inventario.

## Recomendaciones

- Reforzar el catálogo de las categorías más rentables y revisar las de menor demanda.
- Diseñar campañas y promociones dirigidas a los clientes más activos para fidelizarlos.
- Equilibrar el rendimiento entre tiendas, apoyando a las de menor volumen.
- Reducir o renovar el inventario de películas con baja rotación.

## Próximos pasos

- Añadir más KPIs y métricas de negocio.
- Crear vistas y procedimientos almacenados para automatizar consultas frecuentes.
- Visualizar los resultados con una herramienta de BI.

## Contribuciones

Las contribuciones son bienvenidas

## Autor

Daniel Gutman
