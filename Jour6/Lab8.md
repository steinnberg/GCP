# Lab 6 – Mini-projet d’orchestration ELT
## 🎯 Objectifs
    - Construire un pipeline complet avec Airflow pour orchestrer un processus ELT sur GCP :
    - Extraction d’un fichier CSV depuis une API.
    -Ingestion dans Cloud Storage.
    - Transformation avec Pandas.
    - Chargement dans BigQuery.

## 🔧 Prérequis

 - Airflow fonctionnel (cf. Lab 6).

 - Bucket GCP existant.

 - Dataset BigQuery créé.
---

## 📝 Étapes
### 1. Extraction d’un fichier depuis une API

    - Créer un opérateur Python qui télécharge un CSV (exemple : dataset public COVID depuis GitHub).
```bash
import requests

url = "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/latest/owid-covid-latest.csv"
r = requests.get(url)
open("/tmp/covid.csv", "wb").write(r.content)
```
---

2. Ingestion dans Cloud Storage
```bash
gsutil cp /tmp/covid.csv gs://<YOUR_BUCKET>/raw/covid.csv
```
---

3. Transformation avec Pandas

Nettoyer le CSV (garder location, date, new_cases).
```bash
import pandas as pd
df = pd.read_csv("/tmp/covid.csv")
df2 = df[["location","new_cases"]]
df2.to_csv("/tmp/covid_clean.csv", index=False)
```
---
4. Chargement dans BigQuery
```bash
bq load --autodetect --source_format=CSV my_dataset.covid_clean gs://<YOUR_BUCKET>/raw/covid_clean.csv
```
---

5. DAG final

Assembler les tâches dans un DAG Airflow (covid_pipeline.py) avec :

    extract → ingest → transform → load
---

6. Vérification

Vérifier le dataset dans BigQuery avec une requête SQL simple :
```bash
SELECT location, SUM(new_cases) as total_cases
FROM `my_dataset.covid_clean`
GROUP BY location
ORDER BY total_cases DESC
```
