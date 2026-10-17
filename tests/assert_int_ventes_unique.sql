
SELECT
    ID_CMD,
    NO_LIGNE,
    COUNT(*) AS NB
FROM {{ ref('int_ventes') }}
GROUP BY ID_CMD, NO_LIGNE
HAVING ID_CMD IS NULL
    OR NO_LIGNE IS NULL
    OR COUNT(*) > 1
