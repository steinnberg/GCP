# Lab6.md — Modèles analytiques avec jointures et indicateurs dans DBT

## 🎯 Objectif

Créer un modèle analytique nommé `int_commandes_clients` à partir des modèles de staging (`stg_clients`, `stg_commandes`, `stg_produits`). Ce modèle vise à produire une vue enrichie des commandes clients, incluant :

- Le nom du client
- Le montant total de la commande
- La date
- Des KPIs simples comme la somme, le nombre de commandes

On ajoutera également :
- Des **tests de qualité** (`not_null`, `accepted_values`) sur certains champs
- Une **description** des colonnes dans le fichier `schema.yml`

---

## 🗂️ Structure attendue

my_dbt_project/

│
├── models/
│ ├── staging/
│ │ └── ... (déjà créé dans Lab5)
│ ├── marts/
│ │ └── int_commandes_clients.sql
│ └── schema.yml (marts)

---

## 🔹 Étape 1 : Création du modèle analytique `int_commandes_clients.sql`

📄 `models/marts/int_commandes_clients.sql`

```
sql
{{ config(materialized='table') }}

with commandes as (
    select * from {{ ref('stg_commandes') }}
),

clients as (
    select * from {{ ref('stg_clients') }}
)

select
    commandes.commande_id,
    commandes.client_id,
    clients.nom,
    clients.prenom,
    commandes.date_commande,
    commandes.montant_total
from commandes
left join clients on commandes.client_id = clients.client_id

```
---
## 🔹 Étape 2 : Ajout des descriptions et des tests dans schema.yml

### 📄 models/marts/schema.yml

version: 2
```
models:
  - name: int_commandes_clients
    description: "Vue analytique des commandes enrichies avec les clients"
    columns:
      - name: commande_id
        description: "Identifiant unique de la commande"
        tests:
          - not_null
          - unique

      - name: client_id
        description: "Identifiant du client"
        tests:
          - not_null

      - name: nom
        description: "Nom du client"

      - name: prenom
        description: "Prénom du client"

      - name: date_commande
        description: "Date de la commande"

      - name: montant_total
        description: "Montant total de la commande"
        tests:
          - not_null
```

## 🔹 Étape 3 : Compilation, exécution et tests

Dans le terminal avec ton venv activé :

### Compiler les modèles
```
dbt compile
```

### Exécuter le modèle analytique
```
dbt run --select int_commandes_clients
```

### Lancer les tests définis dans le schema.yml
```
dbt test --select int_commandes_clients
```

## 🔹 Étape 4 (optionnelle) : KPIs globaux via analyses/commandes_summary.sql

### 📄 analyses/commandes_summary.sql

-- KPIs globaux sur les commandes
```
select
    count(distinct commande_id) as nb_commandes,
    count(distinct client_id) as nb_clients,
    round(avg(montant_total), 2) as montant_moyen,
    max(montant_total) as commande_max
from {{ ref('int_commandes_clients') }}

```

Exécute manuellement dans BigQuery ou via :
```
dbt compile --select analyses/commandes_summary.sql
```

## ✅ Résumé des livrables

Fichier	Description
int_commandes_clients.sql	Jointure entre commandes et clients
schema.yml	Tests : not_null, unique, description des colonnes
commandes_summary.sql	KPIs optionnels sur les commandes
dbt run	Exécution du modèle
dbt test	Vérification de la qualité des données
















