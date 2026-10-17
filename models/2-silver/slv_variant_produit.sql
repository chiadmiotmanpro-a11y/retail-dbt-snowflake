SELECT
    NULLIF(TRIM(ID_VARIANTE), '')         AS ID_VARIANTE, 
    NULLIF(TRIM(ID_PDT), '')              AS ID_PDT,  
    NULLIF(TRIM(TAILLE), '')              AS TAILLE,
    NULLIF(TRIM(COULEUR), '')             AS COULEUR,  
    NULLIF(TRIM(REFERENCE_SKU), '')       AS REFERENCE_SKU,
    TRY_TO_DECIMAL(TRIM(PRIX), 10, 2)     AS PRIX

FROM {{ ref('brz_variant_produit') }}


--  ID_VARIANTE, ID_PDT, TAILLE, COULEUR, REFERENCE_SKU, PRIX