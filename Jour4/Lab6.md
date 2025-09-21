# 🧪 Lab 4 – Sécurité et gestion des coûts (IAM + Billing) sur GCP

## 🎯 Objectifs
- Comprendre la gestion des accès via **Identity & Access Management (IAM)**.  
- Créer et tester des rôles différents pour des utilisateurs.  
- Explorer les outils GCP pour estimer et contrôler les coûts.  

---

## 🔧 Prérequis
- Un projet GCP déjà créé.  
- Un bucket de stockage (créé lors des Labs précédents).  
- Accès à la console GCP + Cloud Shell.  

---

## 📝 Étapes

### 1. Créer des comptes utilisateurs IAM
1. Ouvrir la console GCP → **IAM & Admin > IAM**.  
2. Cliquer sur **+ Ajouter** pour créer deux comptes :  
   - **Analyst** → rôle `Storage Object Viewer` (lecture seule).  
   - **Engineer** → rôle `Storage Admin` (lecture + écriture).  

---

### 2. Vérifier les accès
- Connectez-vous avec le compte **Analyst** :  
  - Tester l’accès au bucket → vous devez pouvoir **lire**, mais pas écrire.  
- Connectez-vous avec le compte **Engineer** :  
  - Tester l’accès au bucket → vous devez pouvoir **lire et écrire** (upload d’un fichier via console ou `gsutil`).  

---

### 3. Simuler et suivre les coûts
1. Aller dans **Billing > Reports** pour visualiser la consommation actuelle.  
2. Ouvrir le **Pricing Calculator** : [https://cloud.google.com/products/calculator](https://cloud.google.com/products/calculator).  
   - Estimer le coût d’une VM **e2-micro** sur 1 mois.  
   - Estimer le coût de stockage d’**1 To de données** en classe **Standard** sur Cloud Storage.  
3. Mettre en place une **alerte budgétaire** :  
   - **Billing > Budgets & Alerts** → Créer un budget de 10€ avec alerte à 80%.  

---

## ✅ Résultats attendus
- Deux comptes créés avec des permissions différentes (lecture seule vs admin).  
- Simulation de coûts pour VM et stockage.  
- Une alerte budgétaire configurée pour éviter les mauvaises surprises.  

---

## 📚 Ressources utiles
- [IAM GCP Documentation](https://cloud.google.com/iam/docs)  
- [Pricing Calculator](https://cloud.google.com/products/calculator)  
- [Budgets and alerts](https://cloud.google.com/billing/docs/how-to/budgets)  

---
