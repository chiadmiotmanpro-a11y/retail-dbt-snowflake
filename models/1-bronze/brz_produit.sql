SELECT *
FROM {{ source('ventes_raw', 'PRODUIT') }}