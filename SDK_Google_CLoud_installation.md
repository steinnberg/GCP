## Google Cloud SDK (gcloud)

Google Cloud SDK (gcloud) sur une machine personnelle (Windows, Mac ou Linux). Cela permet ensuite de :

- Gérer tes projets GCP en ligne de commande,
- Utiliser `gsutil` pour manipuler des fichiers dans Cloud Storage,
- Authentifier DBT, Python, Terraform, etc.

### ✅ Étapes pour installer Google Cloud SDK sur machine perso
 - 🔸 1. Prérequis
Python 3 (recommandé pour les scripts BigQuery)
Accès admin sur ta machine
Navigateur (pour l’auth via gcloud auth login)

 - 🔸 2. Installation (par OS)
    `Windows`
 - Télécharge l’installateur ici :
👉 https://cloud.google.com/sdk/docs/install

 - Exécute le .exe, laisse tout par défaut (il installe aussi gsutil, bq, gcloud)

 - Une fois installé, ouvre le terminal (PowerShell ou CMD) et tape :
 
```
gcloud init
```

✅ Cela lancera le navigateur pour te connecter à ton compte GCP, puis tu pourras choisir ton projet actif.

`🍎 macOS` (Homebrew recommandé)
```
brew install --cask google-cloud-sdk
```

- Puis initialise :
```
gcloud init
```

`🐧 Linux (Debian/Ubuntu)`
```
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
  sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
  sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
```


- Puis lance :
```
gcloud init
```

### 🔍 Vérification

Après installation, il est possible de tester :
```
gcloud --version
gsutil --version
bq --version
```


Et pour voir ton projet actif :
```
gcloud config list
```
### 📦 Bonus : pour Python et DBT

Pour manipuler BigQuery ou Storage en Python, pense à installer ces bibliothèques :
```
pip install google-cloud-storage google-cloud-bigquery
```
