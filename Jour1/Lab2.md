# 📦 Cas Pratique 2 – API publique ➝ JSON ➝ CSV ➝ BigQuery

## 🎯 Objectif pédagogique

Apprendre à :
- Interroger une API publique (REST)
- Extraire des données au format JSON
- Convertir et structurer les données avec `pandas` en CSV
- Uploader le fichier dans BigQuery via l’interface GCP

---

## 🧰 Prérequis

- Un projet GCP actif avec BigQuery activé
- Un bucket Cloud Storage créé
- Un environnement Python local ou Google Colab
- Bibliothèques Python : `requests`, `pandas`, `google-cloud-bigquery`

---

## 🔎 API choisie : OpenFoodFacts

- Endpoint : `https://world.openfoodfacts.org/api/v0/product/[code].json`
- Documentation : [https://world.openfoodfacts.org/data](https://world.openfoodfacts.org/data)

Nous allons extraire des informations nutritionnelles pour une sélection de produits alimentaires.

---

## 🧭 Étapes

### 1. 🐍 Script Python pour requête API + conversion CSV
# 
# Exporter en CSV
- df = pd.DataFrame(produits)

- df.to_csv("openfoodfacts_sample.csv", index=False)

- print("✅ CSV exporté avec succès !")

---
### 2. ☁️ Uploader le CSV dans Cloud Storage

Vous pouvez réutiliser le bucket créé dans le cas pratique Lab1.md :
```
gsutil cp openfoodfacts_sample.csv gs://data-cloud-kadri/
```

### 3. 🧭 Importer le CSV dans BigQuery
- Accéder à BigQuery > Explorer
- Sélectionner votre dataset (ou en créer un)
- Cliquez sur Créer une table
- Source : Cloud Storage ou fichier local
- Format : CSV
- Détection automatique des types (ou schema manuel si souhaité)
- Nom de table : openfood_products
- Valider l’import

###  📌 Résultat attendu

Une table openfood_products dans BigQuery avec les colonnes :
- code
- product_name
- brands
- nutriscore_grade
- energy_100g
- fat_100g
- sugars_100g
- salt_100g

### 🧪 Livrables

✅ Fichier openfoodfacts_sample.csv
✅ Capture d’écran de la table dans BigQuery
✅ Script Python extract_openfood_api.py dans un dossier scripts/
✅ (optionnel) Lien du bucket contenant le fichier CSV
---

### Visualiser un fichier CSV depuis Cloud Storage dans BigQuery

1. Vérifie que ton fichier est bien dans le bucket

Aller sur https://console.cloud.google.com/storage/browser
Clique sur ton bucket (ex. data-cloud-kadri)
Tu verras openfoodfacts_sample.csv (ou autre)

2. Crée un dataset dans BigQuery

Va sur https://console.cloud.google.com/bigquery
Dans le panneau de gauche, clique sur ton projet
Clique sur + Créer un dataset
Nom : api_data ou openfood
Emplacement : europe-west1

3. Crée une table depuis Cloud Storage

Toujours dans BigQuery, clique sur + Créer une table
Source : Google Cloud Storage
Dans le champ URI, mets le chemin du fichier, par exemple :
```
gs://data-cloud-kadri/openfoodfacts_sample.csv
```
- Format de fichier : CSV


Dataset de destination : ton dataset créé (api_data)
Nom de la table : openfood_products
Détection automatique du schéma 
Clique sur Créer une table

### 👁️ 4. Visualiser les données comme une table

Une fois la table importée :

Tu peux cliquer dessus dans BigQuery
Aller dans l’onglet « Détails » et « Aperçu »
Ou écrire une requête SQL comme :
```
SELECT * FROM `data-cloud-kadri.api_data.openfood_products` LIMIT 10;
```

### 📌 Astuce

Il est possible d'automatiser cette étape avec DBT ou Python plus tard.



### 💬 À discuter

- Que se passe-t-il si le JSON est mal structuré ou incomplet ?
- Pourquoi BigQuery est mieux qu’un fichier Excel ?
- Quels autres champs pertinents pour une analyse nutritionnelle (labels, ingrédients, scores) ?

### 📚 Ressources utiles

- OpenFoodFacts API : https://world.openfoodfacts.org/data
- BigQuery : https://cloud.google.com/bigquery/docs/quickstarts
- Pandas : https://pandas.pydata.org