# 💡 Cas Pratique 1 – Création d’un Bucket GCP et Import de CSV

## 🎯 Objectif pédagogique

Mettre en place les briques fondamentales d’un projet Data Cloud sur Google Cloud Platform :
- Créer un compte GCP (ou projet si compte déjà existant)
- Créer un bucket de stockage (Cloud Storage)
- Uploader un fichier CSV (dataset clients de Olist)
- Préparer les fichiers pour ingestion future dans BigQuery

---

## 🧰 Prérequis

- Une adresse Gmail personnelle
- Une carte bancaire (pour activer le crédit gratuit GCP)
- Navigateur Chrome recommandé
- CSV exemple : `olist_customers_dataset.csv` ([source Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce))

---

## 🧭 Étapes détaillées

### 1. ✅ Créer un compte GCP avec crédit gratuit

1. Rendez-vous sur [https://cloud.google.com/](https://cloud.google.com/)
2. Cliquez sur **"Get started for free"**
3. Connectez-vous avec un compte Gmail
4. Activez votre période d’essai gratuite (300 $ pendant 90 jours)

---

### 2. 🛠️ Créer un nouveau projet GCP

1. Dans le tableau de bord GCP, cliquez en haut sur le **sélecteur de projet**
2. Cliquez sur **« Nouveau projet »**
3. Donnez-lui un nom (ex : `data-cloud-mydigitalschool`)
4. Cliquez sur **Créer**

---

### 3. ☁️ Activer le service Cloud Storage

1. Dans la barre de recherche GCP, tapez **Cloud Storage** et cliquez sur le service
2. Cliquez sur **Créer un bucket**
3. Configurez comme suit :
   - **Nom du bucket** : `data-cloud-<votre-prénom>` (doit être unique globalement)
   - **Région** : `europe-west1 (Belgique)`
   - **Classe de stockage** : `Standard`
   - **Contrôle d’accès** : `Uniforme`
4. Cliquez sur **Créer**

---

### 4. 📤 Uploader un fichier CSV

1. Dans le menu de votre bucket > cliquez sur **« Importer des fichiers »**
2. Choisissez le fichier `olist_customers_dataset.csv`
3. Validez l’upload

⚠️ Vous pouvez maintenant cliquer sur le fichier > copier le lien public (pour l’utiliser plus tard dans un script DBT ou un pipeline ETL).

---

## 📎 Bonus : Tester avec gsutil

Si vous avez le SDK Google Cloud installé, vous pouvez aussi uploader en ligne de commande :

```bash
gsutil cp olist_customers_dataset.csv gs://data-cloud-votre-prenom/
