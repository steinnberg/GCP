# 🧪 Lab7_2 – Créer un budget et une alerte de coûts sur GCP

## 🎯 Objectifs
- Configurer un **budget mensuel** sur Google Cloud.  
- Définir des **seuils d’alerte** pour anticiper les dépassements.  
- Comprendre comment surveiller la consommation réelle.  

---

## 🔧 Prérequis
- Projet GCP actif avec facturation activée.  
- Accès à la console GCP avec rôle **Billing Account Administrator** ou **Billing Account Viewer + Budget Creator**.  

---

## 📝 Étapes

### 1. Accéder à la gestion des budgets
1. Ouvrir la **console GCP**.  
2. Menu principal → **Billing**.  
3. Dans le menu latéral, cliquer sur **Budgets & alerts**.  
4. Cliquer sur **+ CREATE BUDGET**.  

---

### 2. Définir le périmètre
- Choisir le **compte de facturation** associé à votre projet.  
- Sélectionner :  
  - **All projects** (si vous en avez plusieurs)  
  - ou uniquement le projet de votre cours (ex: `data-cloud-kadri`).  

---

### 3. Définir le budget
- **Nom du budget** : `Budget-Formation-Cloud`.  
- **Période** : `Monthly`.  
- **Montant** : `20 €` (à adapter selon votre usage).  

---

### 4. Configurer les seuils d’alerte
- Ajouter trois seuils typiques :  
  - **50% du budget** (10 €) → alerte précoce.  
  - **80% du budget** (16 €) → attention.  
  - **100% du budget** (20 €) → limite atteinte.  

- Chaque seuil enverra un email à l’**Owner du compte** et aux utilisateurs désignés.  

---

### 5. Vérifier le suivi
1. Retourner dans **Billing > Reports**.  
2. Observer les graphiques de consommation par service (Compute, Storage, BigQuery…).  
3. Simuler un coût (en créant une petite VM) puis arrêter la ressource → les coûts devraient apparaître sous 24h.  

---

## ✅ Résultats attendus
- Un budget **20 €/mois** créé.  
- Trois alertes configurées (50%, 80%, 100%).  
- Capture d’écran de la page **Budgets & alerts** validant la configuration.  

---

## 📚 Ressources utiles
- [Créer et gérer des budgets](https://cloud.google.com/billing/docs/how-to/budgets)  
- [Surveiller vos coûts et votre utilisation](https://cloud.google.com/billing/docs/reports)  
- [Alertes de facturation GCP](https://cloud.google.com/billing/docs/how-to/budgets-programmatic-notifications)  

---
