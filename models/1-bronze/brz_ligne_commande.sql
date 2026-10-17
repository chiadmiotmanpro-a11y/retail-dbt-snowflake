
SELECT *
FROM {{ source('ventes_raw', 'LIGNE_COMMANDE') }}