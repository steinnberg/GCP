# 🧪 Lab 1 – Comparer AWS, Azure et GCP pour une startup e-commerce

## 🎯 Objectifs
- Découvrir les **différences stratégiques** entre les 3 grands fournisseurs Cloud.  
- Évaluer leurs offres en fonction des **besoins réels d’une startup** (taille réduite, budget limité, scalabilité).  
- Développer une **capacité critique** de choix technologique.  

---

## 👩‍💻 Contexte
Vous conseillez une **startup de 3 personnes** qui lance une boutique de vente en ligne.  
Le site doit être :  
- Disponible 24/7 (pas de coupures).  
- Capable de **gérer un trafic variable** (pics de ventes à Noël, Black Friday…).  
- Sécurisé (paiements en ligne, RGPD).  
- Peu coûteux au démarrage (budget < 100 €/mois).  

Ils hésitent entre **AWS, Azure, GCP**.

---

## 🔧 Prérequis
- Accès aux sites officiels :  
  - [AWS Pricing Calculator](https://calculator.aws/#/)  
  - [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)  
  - [GCP Pricing Calculator](https://cloud.google.com/products/calculator)  
- Tableur (Google Sheets, Excel, LibreOffice) pour comparer.

---

## 📝 Étapes

### 1. Identifier les besoins de la startup
- **Hébergement web** → une VM Linux ou un service managé type App Service / App Engine.  
- **Base de données** → SQL (PostgreSQL/MySQL).  
- **Stockage d’objets** → pour images/produits (bucket type S3/Blob/GCS).  

### 2. Rechercher l’offre adaptée chez chaque fournisseur
- **AWS** : EC2 (VM), RDS (Postgres), S3 (images).  
- **Azure** : Virtual Machine Linux, Azure Database for PostgreSQL, Blob Storage.  
- **GCP** : Compute Engine (VM), Cloud SQL (Postgres), Cloud Storage.  

### 3. Estimer les coûts (simulateurs)
- Configuration type :  
  - VM **2 vCPU / 8 Go RAM**, disque 50 Go.  
  - Base de données managée **Postgres 10 Go**.  
  - Stockage d’objets **100 Go**.  
- Saisir ces valeurs dans les 3 simulateurs.  
- Exporter les estimations (PDF ou capture d’écran).

### 4. Comparer dans un tableau
| Critère                | AWS                      | Azure                    | GCP                    |
|------------------------|--------------------------|--------------------------|------------------------|
| Facilité d’utilisation |                          |                          |                        |
| Coût estimé (€/mois)   |                          |                          |                        |
| Crédits gratuits       | 12 mois Free Tier        | 200$ sur 30 jours        | 300$ sur 90 jours      |
| Services inclus        |                          |                          |                        |
| Points forts           |                          |                          |                        |
| Points faibles         |                          |                          |                        |

Remplir le tableau en groupe.

### 5. Recommandation finale
- Chaque groupe écrit en 5 lignes une **recommandation** (quel fournisseur choisir + pourquoi).  
- Restitution orale rapide (2 min/groupe).

---

## ✅ Résultats attendus
- Tableau comparatif rempli avec chiffres réels.  
- Discussion sur avantages/inconvénients.  
- Une recommandation finale argumentée pour la startup.  

---

## 📚 Ressources utiles
- [AWS vs Azure vs GCP Market Share](https://www.statista.com/statistics/967365/worldwide-public-cloud-provider-market-share/)  
- [AWS Pricing Calculator](https://calculator.aws/#/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)  
- [GCP Pricing Calculator](https://cloud.google.com/products/calculator)  
