SELECT
    NULLIF(TRIM(ID_CMD), '')                   AS ID_CMD, 
    NULLIF(TRIM(NO_LIGNE), '')                 AS NO_LIGNE,  
    NULLIF(TRIM(ID_VARIANTE), '')              AS ID_VARIANTE,
    NULLIF(TRIM(QUANTITE), '')                 AS QUANTITE,  
    TRY_TO_DECIMAL(TRIM(PRIX_UNITAIRE), 10, 2) AS PRIX_UNITAIRE,
    NULLIF(TRIM(REMISE), '')                   AS REMISE

FROM {{ ref('brz_ligne_commande') }}


--  ID_CMD, NO_LIGNE, ID_VARIANTE, QUANTITE, PRIX_UNITAIRE, REMISE


