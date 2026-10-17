/*
select distinct * 
from  --RETAIL.BRONZE.BRZ_client
{{ ref('brz_client')}}
*/


SELECT
    NULLIF(TRIM(ID_CLT), '') AS ID_CLT,
    NULLIF(TRIM(NOM), '') AS NOM,
    NULLIF(TRIM(PRENOM), '') AS PRENOM,
    NULLIF(TRIM(ADRESSE), '') AS ADRESSE,
    NULLIF(TRIM(TELEPHONE), '') AS TELEPHONE,
    NULLIF(TRIM(EMAIL), '') AS EMAIL
FROM {{ ref('brz_client') }}


/* 

ID_CLT, NOM, PRENOM, ADRESSE, TELEPHONE, EMAIL


supprime les espaces inutiles ;

transforme les chaînes vides en NULL ;

conserve les identifiants et les dates au format texte pour l'instant ;

lit le modèle Bronze via ref(), ce qui crée automatiquement la dépendance dans le lineage dbt.

*/