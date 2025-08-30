# 🧪 Lab 3 – Modélisation du schéma Médaillon (Bronze / Silver / Gold)

## 🎯 Objectif du lab

Modéliser une architecture **Médaillon** adaptée au dataset **Olist (e-commerce brésilien)** :

- Identifier les entités pertinentes (clients, commandes, produits…)
- Répartir les tables selon les 3 couches : **Bronze**, **Silver**, **Gold**
- Visualiser la structure sous forme de schéma (papier, tableau ou diagramme Draw.io)

---

## 🧰 Prérequis

- Connaissance du dataset Olist (disponible sur Kaggle : [lien](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce))
- Avoir une vue générale sur les fichiers :
  - `olist_customers_dataset.csv`
  - `olist_orders_dataset.csv`
  - `olist_order_items_dataset.csv`
  - `olist_products_dataset.csv`
  - `olist_sellers_dataset.csv`
  - `olist_order_reviews_dataset.csv`

---

## 🧭 Étapes

### 🟫 Étape 1 : Identifier les entités du dataset Olist

Liste les **entités principales** et leur rôle :
| Fichier CSV                  | Description                         |
|-----------------------------|-------------------------------------|
| `olist_customers_dataset`   | Informations clients                |
| `olist_orders_dataset`      | Détails de commande (date, client)  |
| `olist_order_items_dataset` | Articles d’une commande             |
| `olist_products_dataset`    | Informations sur les produits       |
| `olist_sellers_dataset`     | Vendeurs                            |
| `olist_order_reviews_dataset` | Notes et commentaires clients     |

---

### 🪵 Étape 2 : Répartition des tables par couche

| Couche        | Tables                                               |
|---------------|------------------------------------------------------|
| **Bronze**    | `bronze_customers`, `bronze_orders`, `bronze_order_items` |
|               | Données **brutes** telles qu’ingérées (CSV ou API)  |
| **Silver**    | `silver_orders_flat`, `silver_customers_clean`, `silver_products_clean` |
|               | Données nettoyées, jointes, typées                  |
| **Gold**      | `gold_sales_per_category`, `gold_customer_segmentation`, `gold_kpi_daily` |
|               | Données agrégées et prêtes pour l’analyse métier    |

---

### 📝 Étape 3 : Créer un schéma visuel

#### Option 1 – Papier
- Dessiner les couches et relier les entités par des flèches (du brut vers l'agrégé)
- Noter le nom des fichiers CSV d’origine
- Expliquer (brièvement) chaque couche

#### Option 2 – Draw.io
- Ouvrir [https://draw.io](https://draw.io)
- Représenter chaque table sous forme de boîte (Bronze, Silver, Gold)
- Ajouter des flèches entre les couches
- Exporter en `.drawio`, `.png`, ou `.pdf`

📥 Exemple de structure :

               Bronze Layer
 ┌────────────┬────────────┬────────────┐
 │ customers  │  orders    │  products  │ ...
 └────────────┴────────────┴────────────┘
         ↓ ingestion
               Silver Layer
 ┌─────────────────────────────┐
 │   silver_orders_flat        │
 │   silver_customers_clean    │
 └─────────────────────────────┘
         ↓ transformation
               Gold Layer
 ┌─────────────────────────────┐
 │ gold_sales_per_category     │
 │ gold_kpi_daily              │
 └─────────────────────────────┘



---

## 📎 Livrables

- ✅ Schéma finalisé (papier scanné, fichier `.drawio`, `.png`, ou `.pdf`)
- ✅ Un tableau ou fichier Markdown récapitulatif des couches
- ✅ Justification pour le placement de chaque entité (1 à 2 phrases/table)

---

## 💬 Questions de réflexion

1. Pourquoi faut-il séparer les couches ? Avantages ?
2. Quelles sont les règles de transformation typiques entre Bronze → Silver → Gold ?
3. Que faire si une table contient à la fois des données techniques et fonctionnelles ?

---

## 📚 Ressources

- Présentation de l’architecture Médaillon (Databricks)  
  https://www.databricks.com/glossary/medallion-architecture  
- Dataset Olist sur Kaggle  
  https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## 🧠 À retenir

> La couche Bronze capture le **chaos brut**.  
> La couche Silver apporte **structure et cohérence**.  
> La couche Gold livre la **valeur métier**.

