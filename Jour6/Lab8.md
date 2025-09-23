# 🧪 Lab 5 – Premier DAG Airflow sur GCP
## 🎯 Objectifs
    - Déployer Airflow via Docker sur une VM GCP.

    - Créer un DAG simple pour charger un fichier dans un bucket.

## 🔧 Prérequis

    - Une VM Linux (e2-medium, Ubuntu 22.04).
    - Docker installé sur la VM.
    - Un bucket de stockage GCP.

## 📝 Étapes
### 1. Installer Airflow via Docker
#### Sur la VM

```bash
sudo apt update && sudo apt install -y docker.io docker-compose
git clone https://github.com/apache/airflow.git
cd airflow
```
---

- Configurer docker-compose.yaml (version fournie par Airflow Quickstart).
- Lancer Airflow :

```bash
docker-compose up -d
```

### 2. Créer un DAG simple

Dans le dossier dags/, créer gcs_upload.py :
```bash
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG("upload_to_gcs",
         start_date=datetime(2025, 1, 1),
         schedule_interval="@daily",
         catchup=False) as dag:

    upload = BashOperator(
        task_id="upload_file",
        bash_command="gsutil cp /tmp/data.csv gs://<YOUR_BUCKET>/data.csv"
    )
```
---
### 3. Tester le DAG

    - Placer un fichier data.csv dans /tmp/.
    - Lancer le DAG depuis l’interface Airflow.
    - Vérifier que le fichier est bien dans ton bucket.