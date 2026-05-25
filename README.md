# Proyecto de Análisis SQL: Alquiler de Películas

## Descripción

Proyecto de SQL basado en la base de datos Shakila, de un negocio de alquiler de películas. El trabajo consiste en el desarrollo de consultas para la extracción, análisis y manipulación de datos, aplicando filtros, agregaciones, joins y otras técnicas SQL para obtener información de negocio.
El objetivo fue responder a distintas preguntas de negocio sobre el comportamiento de los clientes, el rendimiento del catálogo de películas, los ingresos y la actividad de las tiendas, transformando los datos en conclusiones útiles para la toma de decisiones.

## Estructura del proyecto

- BBDD_Proyecto_shakila_sinuser.sql # Script con todas las consultas resueltas
- esquema_bbdd.png # Esquema de la base de datos proporcionada
- README.md # Esta documentación

Cada consulta del script está identificada con su número y su enunciado como comentario.

## Herramientas

- PostgreSQL
- DBeaver
- Consultas SQL (SELECT, WHERE, GROUP BY, ORDER BY)
- JOINs (INNER, LEFT, CROSS)
- Funciones de agregación (COUNT, SUM, AVG, MIN, MAX)
- Subconsultas
- Filtros y ordenación de datos

## Resultados y Conclusiones

- Por cliente: un grupo reducido de clientes concentra la mayor parte de los alquileres. Los clientes más activos superan los 40 alquileres cada uno.
- Por categoría: algunas categorías de películas reúnen muchos más estrenos y alquileres que otras, mostrando dónde se concentra la demanda.
- Por tienda: existen diferencias en la actividad y en la plantilla asignada a cada tienda.
- Catálogo: el análisis del catálogo permite identificar las películas y categorías con mayor y menor rotación.

## Recomendaciones

- Reforzar el catálogo de las categorías más demandadas y revisar las de menor rotación.
- Diseñar campañas de fidelización dirigidas a los clientes más activos.
- Equilibrar el rendimiento entre tiendas, apoyando a las de menor volumen.
- Renovar o reducir el inventario de películas con baja demanda.

## Próximos pasos

- Añadir más KPIs y métricas de negocio.
- Crear vistas y procedimientos almacenados para automatizar consultas frecuentes.
- Visualizar los resultados con una herramienta de BI.

## Contribuciones

Las contribuciones son bienvenidas

## Autor

Daniel Gutman
