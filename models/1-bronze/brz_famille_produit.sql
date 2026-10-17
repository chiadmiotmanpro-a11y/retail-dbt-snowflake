SELECT *
FROM {{ source('ventes_raw', 'FAMILLE_PRODUIT') }}