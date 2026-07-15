# GCP BigQuery Batch Pipeline

## Présentation

Ce mini-projet met en œuvre un pipeline de données batch sur Google Cloud Platform afin d’ingérer, nettoyer, transformer et optimiser un jeu de données de commandes.

Le pipeline suit le parcours suivant :

```text
Google Cloud Storage
        ↓
BigQuery External Table
        ↓
BigQuery Native Table
        ↓
Data Cleaning and Transformation
        ↓
Partitioned Table
        ↓
Performance Benchmark
```

## Objectifs

- Ingérer un fichier CSV stocké dans Google Cloud Storage
- Créer une table externe dans BigQuery
- Charger les données dans une table native
- Nettoyer et standardiser les données avec SQL
- Contrôler la qualité des données
- Créer une table partitionnée
- Comparer les performances des tables partitionnée et non partitionnée
- Comprendre l’impact du partitionnement sur les coûts BigQuery

## Technologies utilisées

- Google Cloud Platform
- Google Cloud Storage
- BigQuery
- SQL

## Transformations réalisées

Les données brutes sont nettoyées et standardisées avec différentes opérations SQL :

- conversion des types avec `CAST`
- suppression des espaces avec `TRIM`
- uniformisation des statuts avec `UPPER`
- traitement des valeurs nulles
- vérification des doublons
- validation des formats
- partitionnement par date de commande

## Résultat du benchmark

Pour une même requête analytique portant sur les ventes du 1er au 15 juillet 2024 :

- Table non partitionnée : environ **30,67 MB** de données analysées
- Table partitionnée : environ **1,27 MB** de données analysées

Le partitionnement a permis de lire environ **24 fois moins de données**, améliorant ainsi les performances et réduisant les coûts d’exécution dans BigQuery.

## Structure du dépôt

```text
gcp-bigquery-batch-pipeline/
│
├── sql/
│   ├── 01_create_datasets.sql
│   ├── 02_create_external_table.sql
│   ├── 03_load_native_table.sql
│   ├── 04_data_quality_checks.sql
│   ├── 05_clean_orders.sql
│   ├── 06_create_partitioned_table.sql
│   └── 07_performance_benchmark.sql
│
└── README.md
```


## Améliorations possibles

- Automatiser l’exécution du pipeline
- Ajouter une orchestration avec Apache Airflow
- Mettre en place des tests de qualité supplémentaires
- Déployer l’infrastructure avec Terraform
- Ajouter une couche de transformation avec dbt
