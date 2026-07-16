# 🔥 Big Data Wildfire Risk Analysis

Big Data solution for wildfire risk monitoring on critical healthcare infrastructure in Chile — GCP, BigQuery, Cloud Run, Looker Studio + RBAC.

## Descripción

Este proyecto desarrolla una solución Big Data para monitorear el impacto de incendios forestales sobre infraestructura crítica de salud en Chile, específicamente **postas rurales**.

La solución integra tres fuentes de datos, implementa procesos ELT automatizados, construye un modelo dimensional en BigQuery y genera alertas geoespaciales cruzando incendios activos con postas rurales cercanas, apoyadas por condiciones meteorológicas en tiempo real.

---

## Problema

Chile enfrenta cada año incendios forestales que pueden afectar la infraestructura crítica de salud rural. Sin embargo, la información está distribuida entre múltiples fuentes, dificultando el monitoreo oportuno del riesgo para el personal sanitario en zonas apartadas.

---

## Solución

Se diseñó una arquitectura Big Data basada en Google Cloud Platform que permite:

- Ingestar datos de 3 fuentes distintas (batch + streaming)
- Procesar y transformar datos mediante ELT en BigQuery
- Calcular distancias geoespaciales reales entre incendios y postas
- Generar alertas por nivel de proximidad y riesgo climático
- Visualizar el sistema en un dashboard interactivo en Looker Studio
- Implementar Control de Acceso Basado en Roles (RBAC) sobre el Data Warehouse

---

## Arquitectura

![Arquitectura](architecture/arquitectura_general.png)

---

## Fuentes de datos

| Fuente | Tipo de ingesta | Registros |
|---|---|---|
| Incendios forestales 2024-2025 (CSV) | Batch — Cloud Run + Scheduler | 500 incendios |
| Postas rurales — API Minsal | Batch — Cloud Run + Scheduler | 1.184 postas |
| Clima — API Open-Meteo | Streaming — Cloud Run + Scheduler | 416 lecturas / 16 estaciones |

---

## Modelo dimensional (esquema estrella)