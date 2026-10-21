# Wormie

<p align="left">
  <img src="https://img.shields.io/badge/Plataforma-Escritorio_%7C_Móvil-blue?style=flat-square" alt="Plataforma" />
  <img src="https://img.shields.io/badge/Base_de_Datos-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Proyecto-2º_CFGS_DAM-darkgreen?style=flat-square" alt="DAM" />
</p>

Plataforma de gestión bibliotecaria orientada al control automatizado de préstamos, reservas, inventario de ejemplares y sanciones por retraso en devoluciones.

---

### <img src="https://api.iconify.design/lucide:layout-grid.svg" width="18" height="18" /> Arquitectura del Sistema

El ecosistema se divide en dos aplicaciones conectadas a una base de datos central:

* **Aplicación de Escritorio (Gestión / Empleados):** Panel de control para tramitar préstamos, validar reservas entrantes, consultar disponibilidad de libros físicos y registrar sanciones a socios.
* **Aplicación Móvil (Socios / Lectores):** Catálogo digital con búsqueda por ISBN o autor, solicitud de reservas en tiempo real y seguimiento del estado de préstamos y penalizaciones.

---

### <img src="https://api.iconify.design/lucide:check-circle-2.svg" width="18" height="18" /> Reglas de Negocio Clave

* **Ciclo de Préstamos:** Concesión de préstamos con margen de devolución previsto de 7 a 14 días.
* **Sistema de Sanciones:** Superar la fecha límite genera penalizaciones automáticas e importes asociados según la gravedad del retraso.
* **Resolución de Reservas:** Ante alta demanda de un mismo ejemplar, el sistema prioriza por orden de reserva y, en caso de empate, por menor historial de sanciones.
---

### <img src="https://api.iconify.design/lucide:users.svg" width="18" height="18" /> Autores

* Pablo Camilo Ambrosio Rodrigues
* Andrés Felipe Jauregui Urrego
* Alejandro Ojeda Rojas
  
### Link al Trello

* https://trello.com/invite/b/6990b2f5de37ea4079972ab8/ATTI00ab6d3864c5e56aa1e30f102a241708CE247EE5/wormie
