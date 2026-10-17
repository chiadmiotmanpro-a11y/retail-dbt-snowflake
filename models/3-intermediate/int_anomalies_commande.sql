
{{ config(materialized='view') }}

SELECT
    c.*,
    CASE
        WHEN c.ID_CLT IS NULL THEN 'CLIENT_ID_NULL'
        WHEN cl.ID_CLT IS NULL THEN 'CLIENT_INEXISTANT'
    END AS MOTIF_ANOMALIE
FROM {{ ref('int_commande') }} c
LEFT JOIN {{ ref('int_client') }} cl
    ON c.ID_CLT = cl.ID_CLT
WHERE c.ID_CLT IS NULL
   OR cl.ID_CLT IS NULL
