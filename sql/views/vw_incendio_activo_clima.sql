-- vw_incendio_activo_clima
-- Cruza cada incendio activo con la estación de clima
-- más cercana dentro de 50km (match geoespacial real)
-- QUALIFY asegura solo 1 fila por incendio (la más cercana
-- y con la lectura más reciente en caso de empate)

CREATE OR REPLACE VIEW datos_emergencia.vw_incendio_activo_clima AS
SELECT
  i.id_incendio,
  i.region         AS region_incendio,
  i.fecha_inicio,
  i.tipo_suelo,
  i.superficie_ha,
  c.estacion       AS estacion_clima_cercana,
  ROUND(ST_DISTANCE(i.centroide, c.geom) / 1000, 2) AS distancia_estacion_km,
  c.temperatura_c,
  c.humedad_pct,
  c.viento_kmh,
  c.viento_fuerte,
  c.riesgo_propagacion
FROM datos_emergencia.dim_incendio i
JOIN datos_emergencia.vw_riesgo_climatico c
  ON ST_DWITHIN(i.centroide, c.geom, 50000)
WHERE i.es_activo = TRUE
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY i.id_incendio
  ORDER BY ST_DISTANCE(i.centroide, c.geom) ASC,
           c.fecha_hora_api DESC
) = 1;