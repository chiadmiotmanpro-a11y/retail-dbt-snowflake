{{ config(materialized='view') }}

SELECT
    lc.*,
    CASE
        WHEN lc.ID_CMD IS NULL
            THEN 'COMMANDE_ID_NULL'
        WHEN c.ID_CMD IS NULL
            THEN 'COMMANDE_INEXISTANTE'
        WHEN lc.ID_VARIANTE IS NULL
            THEN 'VARIANTE_ID_NULL'
        WHEN v.ID_VARIANTE IS NULL
            THEN 'VARIANTE_INEXISTANTE'
        ELSE 'OK'
    END AS MOTIF_ANOMALIE

FROM {{ ref('int_ligne_commande') }} lc

LEFT JOIN {{ ref('int_commande') }} c
    ON lc.ID_CMD = c.ID_CMD

LEFT JOIN {{ ref('int_variant_produit') }} v
    ON lc.ID_VARIANTE = v.ID_VARIANTE

WHERE c.ID_CMD IS NULL
   OR lc.ID_VARIANTE IS NULL
   OR v.ID_VARIANTE IS NULL