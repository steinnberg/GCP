# Lab 2.1 — Automatiser le chargement d’un CSV dans BigQuery via Cloud Function + Scheduler

## 🌟 Objectif
Déployer une **Cloud Function** qui :
- Se connecte à un fichier `.csv` dans un bucket GCS
- Le charge dans une **table BigQuery**
- Est planifiée automatiquement via **Cloud Scheduler** (ex : chaque jour à 9h)

---

## 📚 Prérequis
- Projet GCP activé (`my-project-id`)
- Fichier CSV dans un bucket GCS (`gs://my-bucket/olist_sample.csv`)
- Table BigQuery cible (`dataset.olist_table`)
- API activées :
  - Cloud Functions
  - Cloud Scheduler
  - BigQuery
  - Cloud Storage

---

## ✍️ Etape 1 : Créer le bucket et uploader le CSV
```bash
# Création du bucket
gsutil mb -l europe-west1 gs://my-bucket

# Upload du fichier CSV
gsutil cp olist_sample.csv gs://my-bucket/
```

---

## 🧠 Etape 2 : Créer la Cloud Function

### Structure du dossier
```
cloud_function/
├── main.py
└── requirements.txt
```

### Contenu de `main.py`
```python
import functions_framework
from google.cloud import bigquery

@functions_framework.http
def upload_csv_to_bq(request):
    client = bigquery.Client()

    uri = "gs://my-bucket/olist_sample.csv"
    table_id = "my-project-id.dataset.olist_table"

    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True,
        write_disposition=bigquery.WriteDisposition.WRITE_APPEND,
    )

    load_job = client.load_table_from_uri(
        uri, table_id, job_config=job_config
    )

    load_job.result()

    return f"✅ CSV uploaded to {table_id}."
```

### Contenu de `requirements.txt`
```
functions-framework==3.5.0
google-cloud-bigquery==3.14.1
```

---

## 🚀 Etape 3 : Déploiement de la Cloud Function
```bash
gcloud functions deploy upload_csv_to_bq \
  --runtime python310 \
  --trigger-http \
  --allow-unauthenticated \
  --entry-point upload_csv_to_bq \
  --source=./cloud_function \
  --region=europe-west1
```

---

## ⏰ Etape 4 : Création du Cloud Scheduler
```bash
gcloud scheduler jobs create http call-upload-csv-job \
  --schedule="0 9 * * *" \
  --uri="https://REGION-PROJECT_ID.cloudfunctions.net/upload_csv_to_bq" \
  --http-method=GET \
  --time-zone="Europe/Paris"
```
Remplace `REGION-PROJECT_ID` avec l’URL réelle de ta Cloud Function.

---

## 🎓 Etape 5 : Test Final
- Vérifier le fichier dans `gs://my-bucket/olist_sample.csv`
- Lancer le Scheduler manuellement via l'interface GCP
- Contrôler les données dans BigQuery : `dataset.olist_table`

---

## 🔹 Résultat attendu
Une pipeline entièrement automatisée : CSV ➔ GCS ➔ Cloud Function ➔ BigQuery, exécutée chaque jour par Cloud Scheduler.
