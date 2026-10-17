
SELECT *
FROM {{ ref('int_ventes') }}
WHERE QUANTITE < 1
   OR QUANTITE > 100
   OR REMISE < 0
   OR REMISE > 100
