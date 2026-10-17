
SELECT
    ID_PDT,
    NOM_PDT,
    ID_FP,
    NOM_FP,

    SUM(CA_REALISE) AS CA_REALISE,
    SUM(QUANTITE_LIVREE) AS QUANTITE_LIVREE,

    COUNT(
        DISTINCT CASE
            WHEN STATUT_CMD = 'LIVREE' THEN ID_CMD
        END
    ) AS NB_COMMANDES_LIVREES,

    COUNT(
        CASE
            WHEN STATUT_CMD = 'LIVREE' THEN 1
        END
    ) AS NB_LIGNES_LIVREES

FROM {{ ref('fct_ventes') }}

GROUP BY
    ID_PDT,
    NOM_PDT,
    ID_FP,
    NOM_FP
