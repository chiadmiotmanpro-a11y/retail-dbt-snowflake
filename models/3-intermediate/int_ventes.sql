
{{ config(materialized='view') }}

WITH lignes_valides AS (

    SELECT
        lc.ID_CMD,
        lc.NO_LIGNE,
        lc.ID_VARIANTE,
        lc.QUANTITE,
        lc.PRIX_UNITAIRE,
        lc.REMISE
    FROM {{ ref('int_ligne_commande') }} lc

    INNER JOIN {{ ref('int_commande') }} c
        ON lc.ID_CMD = c.ID_CMD

    INNER JOIN {{ ref('int_client') }} cl
        ON c.ID_CLT = cl.ID_CLT

    INNER JOIN {{ ref('int_variant_produit') }} v
        ON lc.ID_VARIANTE = v.ID_VARIANTE

    INNER JOIN {{ ref('int_produit') }} p
        ON v.ID_PDT = p.ID_PDT

    INNER JOIN {{ ref('int_famille_produit') }} fp
        ON p.ID_FP = fp.ID_FP

    WHERE lc.ID_CMD IS NOT NULL
      AND lc.ID_VARIANTE IS NOT NULL
      AND lc.QUANTITE > 0
      AND lc.PRIX_UNITAIRE >= 0
      AND (lc.REMISE IS NULL OR lc.REMISE BETWEEN 0 AND 100)

)

SELECT
    lc.ID_CMD,
    lc.NO_LIGNE,
    c.DATE_CMD,
    c.STATUT_CMD,
    c.MODE_PAIEMENT,

    cl.ID_CLT,
    cl.NOM,
    cl.PRENOM,

    lc.ID_VARIANTE,
    v.REFERENCE_SKU,
    v.TAILLE,
    v.COULEUR,

    p.ID_PDT,
    p.NOM_PDT,
    fp.ID_FP,
    fp.NOM_FP,

    lc.QUANTITE,
    lc.PRIX_UNITAIRE,
    lc.REMISE,

    lc.QUANTITE * lc.PRIX_UNITAIRE
        AS MONTANT_BRUT,

    lc.QUANTITE * lc.PRIX_UNITAIRE
        * (1 - COALESCE(lc.REMISE, 0) / 100.0)
        AS MONTANT_NET

FROM lignes_valides lc

INNER JOIN {{ ref('int_commande') }} c
    ON lc.ID_CMD = c.ID_CMD

INNER JOIN {{ ref('int_client') }} cl
    ON c.ID_CLT = cl.ID_CLT

INNER JOIN {{ ref('int_variant_produit') }} v
    ON lc.ID_VARIANTE = v.ID_VARIANTE

INNER JOIN {{ ref('int_produit') }} p
    ON v.ID_PDT = p.ID_PDT

INNER JOIN {{ ref('int_famille_produit') }} fp
    ON p.ID_FP = fp.ID_FP
WHERE 1=1
AND lc.NO_LIGNE IS NOT NULL
AND lc.QUANTITE IS NOT NULL
AND lc.QUANTITE BETWEEN 1 AND 100