-- Crea la tabla final "airports2" y asigna valores a 'continent'
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports2 AS
SELECT
    *,
    CASE 
        WHEN country IN (
            'Canada', 'United States', 'Greenland', 'Bahamas', 'Panama', 'Puerto Rico',
            'Honduras', 'British Virgin Islands', 'Cuba', 'Dominican Republic',
            'Guadeloupe', 'Saint Kitts and Nevis', 'Belize', 'Saint Vincent and the Grenadines',
            'Nicaragua', 'Costa Rica', 'Barbados', 'Dominica', 'Haiti', 'Guatemala', 'Grenada',
            'Saint Lucia', 'Cayman Islands', 'U.S. Virgin Islands', 'Turks and Caicos Islands',
            'Antigua and Barbuda', 'Martinique', 'Montserrat', 'Saint Martin'
        ) THEN 'North America'
        WHEN country IN ('France', 'Germany', 'Italy', 'Spain', 'United Kingdom') THEN 'Europe'
        ELSE NULL -- Si no coincide, coloca NULL
    END AS continent
FROM (
    SELECT * EXCEPT(continent) -- Elimina la columna original 'continent' para evitar duplicación
    FROM trabajofinal-ana.aeropuertos.airports_step4
);
