# 📊 Projet pédagogique – Data dans le Cloud avec GCP + DBT

## 🎯 Objectif du projet

Ce projet a pour objectif de construire un pipeline ELT complet dans le cloud à l’aide de :
- Google Cloud Platform (GCP)
- DBT Core (Data Build Tool)
- BigQuery + Cloud Storage
- Dataset Olist (e-commerce brésilien)

## 🧱 Architecture


## 📁 Dossiers

- `/data/` : fichiers CSV sources
- `/models/` : modèles SQL DBT (staging, silver, gold)
- `/scripts/` : scripts d’automatisation
- `/dashboards/` : exports Looker Studio ou Streamlit
- `README.md` : ce fichier

## 🚀 Étapes principales

1. Création du projet GCP + bucket + import CSV
2. Connexion DBT à BigQuery
3. Modélisation Bronze → Silver → Gold
4. Création de tests et documentation automatique
5. Dashboard avec KPIs dans Looker Studio

## 🧪 Stack utilisée

- Google Cloud Platform (GCP)
- DBT Core (local)
- Python 3.10+
- BigQuery
- Looker Studio

## 📦 Installation rapide

```bash
# Créer un environnement
python -m venv venv && source venv/bin/activate

# Installer les dépendances
pip install -r requirements.txt

```

## 📊 Dataset

Dataset Olist e-commerce :
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## 🙌 Auteurs

Projet réalisé dans le cadre de la formation Data dans le Cloud à MyDigitalSchool.


---

### ✅ `requirements.txt` minimal pour DBT + GCP

```txt
dbt-core>=1.7
dbt-bigquery>=1.7
google-cloud-storage>=2.12.0
pandas>=2.2.2
notebook
```

---