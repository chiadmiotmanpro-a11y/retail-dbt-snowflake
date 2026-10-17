SELECT *
FROM {{ source('ventes_raw', 'VARIANTE_PRODUIT') }}
