# 🧪 Lab5.md — Modèles de staging et tests dans DBT

## 🎯 Objectif

Créer des modèles de **staging** dans DBT pour les tables suivantes :

- `clients`
- `commandes`
- `produits`

Et y associer des **tests de qualité** (`not null`, `unique`) sur les identifiants (`id`).  
Les données sources sont stockées dans BigQuery, dans un dataset nommé `raw_data`.

---

## 🗂️ Structure attendue du projet
```
my_dbt_project/
│
├── models/
│ ├── staging/
│ │ ├── stg_clients.sql
│ │ ├── stg_commandes.sql
│ │ ├── stg_produits.sql
│ │ └── schema.yml
│
├── dbt_project.yml
├── profiles.yml
└── ...
```
---


## 🔹 Étape 1 : Déclaration des sources dans `schema.yml`

```
yaml
version: 2

sources:
  - name: raw_data
    database: your_database_name  # remplace par ton projet BigQuery
    schema: raw_data              # dataset BigQuery
    tables:
      - name: clients
      - name: commandes
      - name: produits
```

## 🔹 Étape 2 : Création des modèles de staging

### 📄 models/staging/stg_clients.sql
```
sql
Copier le code
{{ config(materialized='view') }}

select
    cast(id as string) as client_id,
    nom,
    prenom,
    email
from {{ source('raw_data', 'clients') }}
```

### 📄 models/staging/stg_commandes.sql
```
sql
Copier le code
{{ config(materialized='view') }}

select
    cast(id as string) as commande_id,
    cast(client_id as string) as client_id,
    date_commande,
    montant_total
from {{ source('raw_data', 'commandes') }}
```

## 📄 models/staging/stg_produits.sql
```
sql
Copier le code
{{ config(materialized='view') }}

select
    cast(id as string) as produit_id,
    nom_produit,
    categorie,
    prix
from {{ source('raw_data', 'produits') }}
```
## 🔹 Étape 3 : Tests de qualité dans schema.yml
Complète ton fichier models/staging/schema.yml :

yaml
Copier le code
```
models:
  - name: stg_clients
    description: "Staging des clients"
    columns:
      - name: client_id
        description: "ID unique du client"
        tests:
          - not_null
          - unique

  - name: stg_commandes
    description: "Staging des commandes"
    columns:
      - name: commande_id
        description: "ID unique de la commande"
        tests:
          - not_null
          - unique
      - name: client_id
        description: "Référence vers le client"

  - name: stg_produits
    description: "Staging des produits"
    columns:
      - name: produit_id
        description: "ID unique du produit"
        tests:
          - not_null
          - unique
```
---

## 🔹 Étape 4 : Compilation, exécution et tests
Dans le terminal (avec le bon venv activé) :


### Compiler les modèles
```
dbt compile
```

### Exécuter les modèles de staging
```
dbt run --select staging
```

### Lancer les tests sur les IDs
```
dbt test --select staging
```

#### ✅ Résumé

 - Élément	Description
  sources	Connexion aux données brutes dans BigQuery
  models	Vue de staging avec alias, typage et nettoyage
  schema.yml	Tests not_null et unique sur les ID
  materialized	view pour les modèles intermédiaires
  tests	Intégrés automatiquement par DBT

---


