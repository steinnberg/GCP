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
df = pd.DataFrame(produits)
df.to_csv("openfoodfacts_sample.csv", index=False)
print("✅ CSV exporté avec succès !")

---
### 2. ☁️ Uploader le CSV dans Cloud Storage (si vous le souhaitez)

Vous pouvez réutiliser le bucket créé dans le cas pratique 1 :
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

### 💬 À discuter

- Que se passe-t-il si le JSON est mal structuré ou incomplet ?
- Pourquoi BigQuery est mieux qu’un fichier Excel ?
- Quels autres champs pertinents pour une analyse nutritionnelle (labels, ingrédients, scores) ?

### 📚 Ressources utiles

- OpenFoodFacts API : https://world.openfoodfacts.org/data
- BigQuery : https://cloud.google.com/bigquery/docs/quickstarts
- Pandas : https://pandas.pydata.org