-- vw_alerta_posta
-- Vista central del sistema de alertas (tabla de hechos)
-- Cruza postas activas con incendios activos dentro de 50km
-- Niveles de alerta por distancia:
--   Crítica   < 5 km
--   Alta      < 15 km
--   Media     < 30 km
--   Preventiva 30-50 km
-- Incluye condiciones climáticas de la estación más cercana

CREATE OR REPLACE VIEW datos_emergencia.vw_alerta_posta AS
SELECT
  p.id_posta,
  p.nombre_posta,
  p.region                                                AS region_posta,
  p.comuna                                               AS comuna_posta,
  p.latitud                                              AS lat_posta,
  p.longitud                                             AS lon_posta,
  i.id_incendio,
  i.region                                               AS region_incendio,
  ROUND(ST_DISTANCE(p.geom, i.centroide) / 1000, 2)     AS distancia_km,
  CASE
    WHEN ST_DISTANCE(p.geom, i.centroide) / 1000 < 5   THEN 'Crítica'
    WHEN ST_DISTANCE(p.geom, i.centroide) / 1000 < 15  THEN 'Alta'
    WHEN ST_DISTANCE(p.geom, i.centroide) / 1000 < 30  THEN 'Media'
    ELSE 'Preventiva'
  END                                                    AS nivel_alerta,
  ic.tipo_suelo,
  ic.superficie_ha,
  ic.estacion_clima_cercana,
  ic.temperatura_c,
  ic.humedad_pct,
  ic.viento_kmh,
  ic.viento_fuerte,
  ic.riesgo_propagacion
FROM datos_emergencia.dim_posta p
JOIN datos_emergencia.dim_incendio i
  ON ST_DWITHIN(p.geom, i.centroide, 50000)
 AND i.es_activo    = TRUE
 AND p.esta_activa  = TRUE
LEFT JOIN datos_emergencia.vw_incendio_activo_clima ic
  ON ic.id_incendio = i.id_incendio;