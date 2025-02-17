-- Crea una tabla temporal con los datos originales (simulando la lectura desde el archivo CSV)
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports_raw AS
SELECT *
FROM `trabajofinal-ana.aeropuertos.aeropuertos_df`;

-- Elimina las columnas innecesarias
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports_step1 AS
SELECT 
    * EXCEPT(local_code, elevation_ft, gps_code)
FROM trabajofinal-ana.aeropuertos.airports_raw;

-- Elimina filas donde 'country' sea NULL
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports_step2 AS
SELECT *
FROM trabajofinal-ana.aeropuertos.airports_step1
WHERE country IS NOT NULL;

-- Reordena el contenido de 'country' si contiene una coma
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports_step3 AS
SELECT
    IF(
        INSTR(country, ',') > 0,
        CONCAT(SUBSTR(country, INSTR(country, ',') + 2), ' ', LEFT(country, INSTR(country, ',') - 1)),
        country
    ) AS country,
    * EXCEPT(country)
FROM trabajofinal-ana.aeropuertos.airports_step2;

-- Elimina filas donde 'municipality' sea NULL
CREATE OR REPLACE TABLE trabajofinal-ana.aeropuertos.airports_step4 AS
SELECT *
FROM trabajofinal-ana.aeropuertos.airports_step3
WHERE municipality IS NOT NULL;
