SELECT
    NULLIF(TRIM(ID_PDT), '')           AS ID_PDT, 
    NULLIF(TRIM(NOM_PDT), '')          AS NOM_PDT,  
    NULLIF(TRIM(DESCRIPTION), '')      AS DESCRIPTION,
    NULLIF(TRIM(TAILLE), '')           AS TAILLE, 
    TRY_TO_DECIMAL(TRIM(PRIX), 10, 2)  AS PRIX,
    NULLIF(TRIM(ID_FP), '')            AS ID_FP

FROM {{ ref('brz_produit') }}


--  ID_PDT, NOM_PDT, DESCRIPTION, TAILLE, PRIX, ID_FP
