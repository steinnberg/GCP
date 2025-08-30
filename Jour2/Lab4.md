# 🧪 Lab 4 – Installation et Première Modélisation DBT Core + BigQuery

## 🎯 Objectif du lab

- Installer **DBT Core** sur sa machine locale (ou dans un venv Python)
- Initialiser un projet DBT avec la bonne structure
- Se connecter à BigQuery via un **service account JSON**
- Créer un **modèle SQL de test** : `SELECT * FROM clients`
- Lancer sa première commande `dbt run`

---

## 🧰 Prérequis

- Un environnement Python ≥ 3.8 installé (idéalement dans un `venv`)
- Un projet GCP avec BigQuery activé
- Un **dataset BigQuery** contenant une table `clients` ou `customers`
- Une **clé JSON de service account avec rôle BigQuery Admin**
- VS Code ou Terminal prêt à être utilisé

---

## 🧭 Étapes détaillées

### 🧱 Étape 1 – Créer un environnement Python propre (optionnel mais recommandé)

```bash
python -m venv venv
source venv/bin/activate  # sous Linux/Mac
venv\Scripts\activate     # sous Windows
```

## 📦 Étape 2 – Installer DBT Core + BigQuery adapter
```
pip install dbt-bigquery
```

### Vérifier l’installation :
```
dbt --version
```

## 📁 Étape 3 – Initialiser le projet DBT
```
dbt init my_dbt_project
cd my_dbt_project
```


Cela crée une arborescence avec :

my_dbt_project/
├── dbt_project.yml
├── models/
│   └── example/
├── profiles.yml  (sera configuré plus bas)

## 🔐 Étape 4 – Créer une clé de Service Account JSON

 - Aller sur https://console.cloud.google.com/iam-admin/serviceaccounts

 - Créer un compte de service (nom : dbt-user)

 - Lui attribuer le rôle BigQuery Admin

 - Générer une clé JSON

 - Télécharger et enregistrer ce fichier dans un dossier sécurisé

## 🧩 Étape 5 – Configurer le fichier profiles.yml

 - DBT utilise un fichier global ~/.dbt/profiles.yml. Crée-le ou édite-le :
 
 - 📄 Exemple de profiles.yml :
```
my_dbt_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: your-gcp-project-id
      dataset: your_bq_dataset
      threads: 1
      timeout_seconds: 300
      keyfile: /chemin/vers/la/clé/dbt-user.json

```
### ⚠️ Remplace :
```
your-gcp-project-id par ton ID de projet

your_bq_dataset par le nom de ton dataset BigQuery (ex : api_data)

keyfile : chemin absolu vers le fichier .json
```

## 🧪 Étape 6 – Créer ton premier modèle

 - Dans le dossier /models/, crée un fichier :

    📄 clients.sql
```
SELECT * FROM `your-gcp-project-id.api_data.clients`
```


### Optionnel : ajouter un schema.yml pour documenter le modèle.

## ▶️ Étape 7 – Lancer le projet DBT
Compilation du modèle :
```
dbt compile
```
Exécution du modèle :
```
dbt run
```

Aperçu de la documentation :
```
dbt docs generate
dbt docs serve
```
## 📎 Bonus : Vérification
```
dbt debug
```

→ Cela vérifie ta connexion à BigQuery et la validité du fichier profiles.yml.

## 📚 Ressources

Docs officielles : https://docs.getdbt.com/reference/warehouse-profiles/bigquery-profile

Exemples DBT : https://github.com/dbt-labs/jaffle_shop

Vidéo rapide : Intro DBT + BigQuery (FR)

## 🏁 Livrables pour validation

✅ Screenshot de la commande dbt run réussie

✅ Fichier clients.sql

✅ profiles.yml (extrait sans clé)

✅ Capture de la table créée dans BigQuery