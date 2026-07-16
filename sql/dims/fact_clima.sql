-- fact_clima (dim_meteorologia)
-- Datos climáticos por estación de monitoreo
-- Fuente: API Open-Meteo, cargada via Cloud Run streaming

CREATE OR REPLACE TABLE datos_emergencia.fact_clima AS
SELECT
  comuna        AS estacion,
  fecha_hora_api,
  latitud,
  longitud,
  ST_GEOGPOINT(longitud, latitud) AS geom,
  temperatura_c,
  precipitacion_mm,
  viento_kmh,
  humedad_pct,
  codigo_clima
FROM datos_emergencia.clima;