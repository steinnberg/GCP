# 🧪 Lab 7 — Déployer une VM GCP, installer Docker et lancer Nginx

## 🎯 Objectifs
- Créer et configurer une **VM Linux** sur **Google Cloud Platform** (GCP).
- Installer **Docker** sur la VM.
- Lancer un conteneur **Nginx** exposé sur le port **80** et le rendre accessible depuis Internet.

---

## 🔧 Prérequis
- Un **projet GCP** actif avec la facturation configurée.
- Accès à la **Console GCP** et/ou **Cloud Shell**.
- Rôles suffisants (Project Editor / Compute Admin).
- Un **réseau VPC** par défaut (ou savoir adapter les noms si personnalisé).

> Remplace les variables entre chevrons `<>` par tes valeurs :
> - `PROJECT_ID`, `ZONE` (ex: `europe-west1-b`), `VM_NAME` (ex: `vm-nginx`), `FIREWALL_NAME` (ex: `allow-http`)

---

## 🗺️ Vue d’ensemble
1) Création VM (Ubuntu) ➜ 2) Ouverture du port 80 ➜ 3) Installation Docker ➜ 4) Run `nginx` ➜ 5) Test & validation

---

## 🥾 Étape 0 — Configurer le projet et la zone (CLI)
Si tu utilises **Cloud Shell** ou ton poste avec le SDK gcloud :

```bash
gcloud config set project <PROJECT_ID>
gcloud config set compute/zone <ZONE>
```
---


## ☁️ Étape 1 — Créer la VM Linux
Option A — Via Console GCP

Console ➜ Compute Engine ➜ VM instances ➜ Create instance

Name : vm-nginx (ou ton VM_NAME)

    - Region/Zone : ta zone (ex: europe-west1-b)
    - Machine type : e2-micro (suffisant pour ce lab)
    - Boot disk : Ubuntu 22.04 LTS
    - Firewall : cocher Allow HTTP traffic
    - C
    reate
```    
Cocher “Allow HTTP traffic” crée (ou utilise) une règle réseau permettant le trafic TCP:80 vers les VMs taguées.
```
 Option B — Via gcloud

```bash
gcloud compute instances create <VM_NAME> \
  --machine-type=e2-micro \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud \
  --boot-disk-size=20GB \
  --tags=http-server
```
---
```
Le tag http-server servira à cibler la règle firewall pour le port 80.
```
---

## 🔓 Étape 2 — Ouvrir le port 80 (si nécessaire)

Si tu n’as pas coché “Allow HTTP traffic” à la création, crée la règle firewall :

```bash
gcloud compute firewall-rules create <FIREWALL_NAME> \
  --allow=tcp:80 \
  --direction=INGRESS \
  --target-tags=http-server \
  --source-ranges=0.0.0.0/0 \
  --network=default

```
---
## 🔑 Étape 3 — Se connecter à la VM en SSH

Depuis la page de la VM ➜ SSH, ou en CLI :
```bash
gcloud compute ssh <VM_NAME>
```
---

## 🐳 Étape 4 — Installer Docker sur Ubuntu

Sur la VM (session SSH) :
```bash
# Mises à jour
sudo apt-get update -y

# Installation Docker depuis les dépôts Ubuntu (simple et suffisant pour le lab)
sudo apt-get install -y docker.io

# Activer et démarrer le service
sudo systemctl enable docker
sudo systemctl start docker

# (Optionnel) Ajouter l’utilisateur courant au groupe docker (évite sudo)
sudo usermod -aG docker $USER
# Appliquer sans déconnexion :
newgrp docker
```


Vérifier :

docker --version
docker run hello-world


## 🌐 Étape 5 — Lancer Nginx en conteneur (port 80)

Toujours sur la VM :

# Récupérer l'image (si besoin) et lancer Nginx exposé sur le port 80
```bash
docker run -d --name web \
  --restart unless-stopped \
  -p 80:80 \
  nginx:stable

```

Vérifier côté VM :
```bash
curl -I http://127.0.0.1
# Doit renvoyer "HTTP/1.1 200 OK" et des en-têtes Nginx
```

Récupérer l’IP publique de la VM :
```bash
gcloud compute instances describe <VM_NAME> --format='get(networkInterfaces[0].accessConfigs[0].natIP)'
```

Tester depuis ton navigateur :
```bash
http://<IP_PUBLIQUE>
```

Tu dois voir la page “Welcome to nginx!”.

## 🧩 (Bonus) Servir ta propre page

Sur la VM :
```bash
sudo mkdir -p /var/www/html
echo "<h1>Hello from Dockerized Nginx on GCP 👋</h1>" | sudo tee /var/www/html/index.html
```

### Recréer le conteneur en montant ton dossier
```bash
docker rm -f web
docker run -d --name web \
  --restart unless-stopped \
  -p 80:80 \
  -v /var/www/html:/usr/share/nginx/html:ro \
  nginx:stable
```


Rafraîchis la page : tu vois désormais ton index.html.