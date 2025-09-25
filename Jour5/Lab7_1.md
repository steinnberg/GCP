# 🧪 Lab7_1 – Simulation de coût avec le GCP Pricing Calculator

## 🎯 Objectifs
- Utiliser le **Pricing Calculator de GCP** pour estimer le coût d’une infrastructure simple.  
- Comparer plusieurs scénarios (VM, stockage, base de données).  

---

## 🔧 Prérequis
- Navigateur web.  
- Accès au **GCP Pricing Calculator** : [https://cloud.google.com/products/calculator](https://cloud.google.com/products/calculator).  

---

## 📝 Étapes

### 1. Simuler une machine virtuelle
1. Ouvrir le **Pricing Calculator**.  
2. Choisir **Compute Engine**.  
3. Configurer :  
   - Machine : `e2-medium` (2 vCPU, 4 Go RAM).  
   - Région : `europe-west1 (Belgium)`.  
   - Utilisation : `24h/24 - 30 jours`.  
4. Noter le coût estimé.  

---

### 2. Ajouter du stockage Cloud
1. Dans le simulateur, cliquer sur **+ Add to Estimate** > **Cloud Storage**.  
2. Configurer :  
   - Classe : `Standard`.  
   - Volume : `100 Go`.  
   - Région : `europe-west1`.  
3. Noter le coût estimé.  

---

### 3. Ajouter une base de données Cloud SQL
1. Ajouter un service **Cloud SQL**.  
2. Configurer :  
   - Type : PostgreSQL.  
   - Instance : `db-f1-micro`.  
   - Stockage : 10 Go.  
3. Noter le coût estimé.  

---

### 4. Comparer les scénarios
- **Scénario A** : seulement Compute Engine.  
- **Scénario B** : Compute Engine + Storage.  
- **Scénario C** : Compute Engine + Storage + Cloud SQL.  

Renseigner les résultats dans un tableau :  

| Scénario | Services inclus               | Coût estimé (€/mois) |
|----------|-------------------------------|----------------------|
| A        | VM uniquement                 | xx €                 |
| B        | VM + Storage                  | xx €                 |
| C        | VM + Storage + SQL Database   | xx €                 |

---

## ✅ Résultats attendus
- Trois estimations de coût (A, B, C) en €/mois.  
- Un tableau comparatif rempli par l’étudiant.  
- Une réflexion écrite (3–4 lignes) : *Quel scénario est le plus adapté à une startup de 3 personnes en e-commerce, et pourquoi ?*  

---

## 📚 Ressources utiles
- [Pricing Calculator GCP](https://cloud.google.com/products/calculator)  
- [Documentation Billing](https://cloud.google.com/billing/docs)  
- [Optimiser ses coûts GCP](https://cloud.google.com/recommender/docs/optimize-costs)  

---
