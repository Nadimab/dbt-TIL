WITH source AS (
    SELECT * FROM {{ source('les_velos_de_didier_dwh', 'customers') }}
)

SELECT
    customer_id,
    INITCAP(first_name) AS first_name,   -- Capitalize first letter
    INITCAP(last_name) AS last_name,
    phone,
    LOWER(email) AS email,               -- Standardize email to lowercase
    TRIM(street) AS street,
    INITCAP(city) AS city,
    UPPER(state) AS state,               -- State code in uppercase
    zip_code
FROM 
    source
