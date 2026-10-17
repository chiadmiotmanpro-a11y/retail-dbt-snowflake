{{ config(materialized='view') }}

SELECT v.*
FROM {{ ref('int_variant_produit') }}   v
LEFT JOIN {{ ref('int_produit') }} p
    ON v.ID_PDT = p.ID_PDT
WHERE v.ID_PDT IS NULL
   OR p.ID_PDT IS NULL