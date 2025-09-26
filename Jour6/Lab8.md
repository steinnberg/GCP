# 🧪 Lab 8 – Premier DAG Airflow sur GCP
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


#### 1.1 ⚙️ Erratum Étape – Configurer et lancer Airflow avec Docker Compose
1. Créer un dossier de travail

Sur ta VM Linux (GCP, Ubuntu par ex.) :
```bash
mkdir ~/airflow
cd ~/airflow
```

2. Télécharger le fichier docker-compose.yaml officiel

Airflow fournit un fichier prêt-à-l’emploi. Récupère-le depuis GitHub :
```bash
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.9.1/docker-compose.yaml'
```

👉 Ici est la version 2.9.1 (la plus récente au moment de rédaction).
Possible changer selon la version souhaitée.

3. Créer les dossiers nécessaires

Airflow utilise des volumes Docker pour stocker logs, dags, plugins…
```bash
mkdir -p ./dags ./logs ./plugins
```

4. Initialiser la base de données Airflow

Toujours dans le dossier ~/airflow :
```bash
docker compose up airflow-init
```

Cela crée les tables nécessaires dans la base interne (Postgres par défaut).

À la fin,  avoir un message **initdb complete**.

5. Lancer Airflow
```bash
docker compose up -d
```

-d = mode détaché (en arrière-plan).

Les services (webserver, scheduler, worker, postgres, etc.) se lancent.

6. Vérifier que tout est bien lancé
```bash
docker ps
```

Tu dois voir plusieurs conteneurs :
    airflow-webserver

    airflow-scheduler

    airflow-worker

    postgres

    redis

7. Accéder à l’interface Airflow

Airflow Webserver écoute sur le port 8080.

Dans ton navigateur, ouvre :
```bash
http://<IP_PUBLIQUE_VM>:8080
```

Identifiants par défaut (dans le YAML) :
```bash
login : airflow

password : airflow
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