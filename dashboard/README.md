# Dashboard — Looker Studio

El dashboard interactivo del proyecto está disponible en Looker Studio.

## Acceso
[Ver Dashboard en Looker Studio](https://datastudio.google.com/u/0/reporting/177e33ad-6890-4842-a89d-2769f8ed4655/page/8ab2F) 

## Contenido del dashboard

### KPIs generales
- N° de postas en riesgo
- N° de incendios activos
- Superficie afectada (ha)

### KPIs meteorológicos
- Temperatura promedio actual (°C)
- Humedad promedio actual (%)
- Viento promedio actual (km/h)

### Visualizaciones
- Mapa de burbujas: postas e incendios activos coloreados por nivel de alerta
- Barras: alertas por región y nivel de riesgo
- Barras: temperatura por estación de monitoreo
- Barras: humedad por estación
- Dispersión: Temperatura vs Humedad vs Viento (explicación del nivel de riesgo)
- Tabla: condiciones climáticas actuales por estación
- Tabla: postas en alerta crítica con condiciones climáticas asociadas

## Niveles de alerta
| Nivel | Distancia al incendio |
|---|---|
| Crítica | < 5 km |
| Alta | < 15 km |
| Media | < 30 km |
| Preventiva | 30 – 50 km |

## Riesgo de propagación
| Nivel | Condición |
|---|---|
| Extremo | T° ≥ 30°C + Humedad ≤ 20% + Viento ≥ 30 km/h |
| Alto | T° ≥ 25°C + Humedad ≤ 35% + Viento ≥ 20 km/h |
| Moderado | T° ≥ 20°C + Humedad ≤ 50% |
| Bajo | Resto de condiciones |
