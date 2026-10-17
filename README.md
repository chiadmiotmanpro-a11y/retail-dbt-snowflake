# Retail Data Warehouse & Data Quality avec dbt et Snowflake

## 1. Présentation du projet

Ce projet consiste à construire un pipeline de transformation et de contrôle qualité des données d'un environnement retail à l'aide de **dbt et Snowflake**.

L'objectif est de transformer des données brutes de clients, commandes et produits en modèles analytiques fiables, tout en détectant les anomalies et en appliquant des règles de qualité des données.
## Architecture du projet
![Architecture du projet Retail dbt et Snowflake](https://github.com/chiadmiotmanpro-a11y/retail-dbt-snowflake/blob/a5c558df55749b64b2d0aa938c8a0b5e5ccaa16c/Architecture%20Projet.png)

## 2. Technologies utilisées

- **Snowflake** : stockage et entrepôt de données.
- **dbt Fusion 2.0.8** : transformation SQL, orchestration des modèles et tests de données.
- **SQL** : nettoyage, jointures, transformations et agrégations.
- **Git / GitHub** : versionnement du projet.

## 3. Architecture des données

Le projet suit une architecture en couches :

- **Bronze / RAW** : données sources conservées pour servir de référence.
- **Silver** : nettoyage, normalisation et préparation des données.
- **Intermediate** : règles métier, jointures, contrôles de cohérence et détection des anomalies.
- **Gold** : modèles analytiques destinés au reporting et à la BI.

## 4. Sources de données

Le projet utilise six tables sources :

- `CLIENT`
- `COMMANDE`
- `FAMILLE_PRODUIT`
- `PRODUIT`
- `VARIANTE_PRODUIT`
- `LIGNE_COMMANDE`

Les données contiennent volontairement des anomalies afin de tester les mécanismes de contrôle et de fiabilisation.

## 5. Modèles de transformation

### Silver
Les modèles `slv_*` préparent les données sources pour les transformations suivantes.

### Intermediate
Les modèles `int_*` centralisent les règles métier, les jointures et les contrôles de cohérence.

Exemples :
- `int_ventes`                      : préparation des lignes de vente valides.
- `int_anomalies_commande`          : détection d'anomalies sur les commandes.
- `int_anomalies_ligne_commande`    : contrôle des lignes de commande.
- `int_anomalies_variante`          : détection d'anomalies sur les variantes.
- `int_lignes_commande_invalides`   : identification des lignes invalides.

### Gold
Les modèles analytiques comprennent :

- `fct_ventes`              : table de faits des ventes.
- `agg_ventes_par_produit`  : indicateurs de vente par produit.
- `agg_ventes_par_famille`  : indicateurs de vente par famille de produits.

Le chiffre d'affaires réalisé est calculé uniquement sur les commandes dont le statut est `LIVREE`, conformément à la règle métier retenue pour ce projet.

## 6. Qualité des données

Les contrôles mis en place couvrent notamment :

- la détection des clés dupliquées ;
- le contrôle des clés étrangères orphelines ;
- la gestion des valeurs NULL ;
- le filtrage des quantités invalides ;
- le contrôle de l'unicité des lignes de vente ;
- la validation des montants et des indicateurs agrégés.

Des tests SQL personnalisés et des tests dbt sont utilisés pour vérifier les règles définies.

### Validation des contrôles

Le pipeline a été exécuté avec succès via `dbt build`, sans erreur. Les tests personnalisés vérifient notamment l'unicité des lignes de vente, la validité des quantités et des remises, ainsi que la cohérence des agrégations par produit et par famille.

## 7. Documentation et traçabilité

La documentation dbt est générée avec :

```bash
dbt docs generate
```

Les dépendances entre les modèles sont déclarées avec `ref()`, ce qui permet à dbt de construire le graphe de dépendances du projet.

## 8. Commandes principales

Exécuter les transformations :

```bash
dbt run
```

Exécuter les tests :

```bash
dbt test
```

Exécuter un modèle spécifique :

```bash
dbt run --select int_ventes
```

Tester les modèles Gold :

```bash
dbt test --select agg_ventes_par_produit agg_ventes_par_famille fct_ventes
```

Générer la documentation :

```bash
dbt docs generate
```
## 9. Points clés du projet

- Architecture ELT structurée en couches Bronze, Silver, Intermediate et Gold.
- Détection et isolation des anomalies dans les données sources.
- Tests SQL personnalisés pour automatiser les contrôles de qualité.
- Modélisation des ventes et calcul du chiffre d'affaires réalisé selon le statut des commandes.
- Documentation des modèles et gestion du code avec GitHub.


## 10. Résultat attendu

Le projet fournit une chaîne de transformation structurée, des contrôles de qualité reproductibles, des modèles analytiques et des indicateurs de vente exploitables pour le reporting.

Il permet de démontrer la maîtrise des transformations SQL avec dbt, de l'intégration avec Snowflake, de la gestion des anomalies et de la préparation de données fiables pour la Business Intelligence.

## 11. Exemple Lineage Graph pourla table ventes_raw.CLIENT
![Lineage Graph.png](https://github.com/chiadmiotmanpro-a11y/retail-dbt-snowflake/blob/120db8e8aa0fa49a67940f61b5afb9c9820c3018/Lineage%20Graph.png)

