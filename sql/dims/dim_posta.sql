-- dim_posta
-- Dimensión de postas rurales
-- Fuente: API Ministerio de Salud, cargada via Cloud Run batch

CREATE OR REPLACE TABLE datos_emergencia.dim_posta AS
SELECT
  EstablecimientoCodigo                             AS id_posta,
  EstablecimientoGlosa                              AS nombre_posta,
  RegionGlosa                                       AS region,
  ComunaGlosa                                       AS comuna,
  Latitud                                           AS latitud,
  Longitud                                          AS longitud,
  CASE
    WHEN Latitud IS NOT NULL AND Longitud IS NOT NULL
    THEN ST_GEOGPOINT(Longitud, Latitud)
  END                                               AS geom,
  EstadoFuncionamiento,
  FechaCierre,
  FechaIncorporacion,
  -- Regla de negocio: activa = sin fecha de cierre y no "Cerrado"
  (FechaCierre IS NULL AND EstadoFuncionamiento != 'Cerrado') AS esta_activa
FROM datos_emergencia.postas_rurales;