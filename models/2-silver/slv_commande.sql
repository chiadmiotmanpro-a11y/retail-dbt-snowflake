SELECT
    NULLIF(TRIM(ID_CMD), '')                                                       AS ID_CMD,
    TRY_TO_TIMESTAMP(    NULLIF(TRIM(DATE_CMD), ''),    'YYYY-MM-DD HH24:MI:SS')   AS DATE_CMD,
    NULLIF(TRIM(ID_CLT), '')                                                       AS ID_CLT,
    NULLIF(TRIM(STATUT_CMD), '')                                                   AS STATUT_CMD, 
    NULLIF(TRIM(MODE_PAIEMENT), '')                                                AS MODE_PAIEMENT
FROM {{ ref('brz_commande') }}


 