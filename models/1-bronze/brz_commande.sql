SELECT *
FROM {{ source('ventes_raw', 'COMMANDE') }}