SELECT
    NULLIF(TRIM(ID_FP), '')           AS ID_FP, 
    NULLIF(TRIM(NOM_FP), '')          AS NOM_FP,  
    NULLIF(TRIM(DESCRIPTION), '')     AS DESCRIPTION
FROM {{ ref('brz_famille_produit') }}


--  ID_FP, NOM_FP, DESCRIPTION