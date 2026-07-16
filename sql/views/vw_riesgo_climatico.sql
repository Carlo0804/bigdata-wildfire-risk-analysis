-- vw_riesgo_climatico
-- Clasifica el riesgo de propagación según condiciones
-- meteorológicas actuales de cada estación de monitoreo
-- Reglas: T°>=30 + Humedad<=20 + Viento>=30 → Extremo
--         T°>=25 + Humedad<=35 + Viento>=20 → Alto
--         T°>=20 + Humedad<=50             → Moderado
--         resto                            → Bajo

CREATE OR REPLACE VIEW datos_emergencia.vw_riesgo_climatico AS
SELECT
  *,
  (viento_kmh >= 30) AS viento_fuerte,
  CASE
    WHEN temperatura_c >= 30 AND humedad_pct <= 20 AND viento_kmh >= 30 THEN 'Extremo'
    WHEN temperatura_c >= 25 AND humedad_pct <= 35 AND viento_kmh >= 20 THEN 'Alto'
    WHEN temperatura_c >= 20 AND humedad_pct <= 50                      THEN 'Moderado'
    ELSE 'Bajo'
  END AS riesgo_propagacion
FROM datos_emergencia.fact_clima;