## ✅ Créer le bucket Cloud Storage via terminal

Voici la commande pour le créer proprement (en remplaçant éventuellement kadri par un nom unique si déjà pris) :
```
gsutil mb -l europe-west1 -c standard gs://data-cloud-kadri/
```

### 📌 Détail des options :

mb = make bucket

-l europe-west1 = région (Belgique, ou Paris )

-c standard = classe de stockage par défaut

gs://data-cloud-kadri/ = nom global (doit être unique dans tout GCP)

### 🧪 Étapes complètes :

 - ✅ Créer le bucket :
```
    gsutil mb -l europe-west1 -c standard gs://data-cloud-kadri/
```


 - ✅ Uploader ton fichier :
```
    gsutil cp "C:\Users\Kered\Documents\MyDigital_School\Jour1\openfoodfacts_sample.csv" gs://data-cloud-kadri/
```

 - ✅ Vérifier la présence :
```
    gsutil ls gs://data-cloud-kadri/
```

### ⚠️  créer le bucket via l’interface GCP :

 - Va dans la console GCP
 - Recherche Cloud Storage
 - Clique sur « Créer un bucket »
 - Choisis data-cloud-kadri, région europe-west1, classe Standard, accès uniforme

 ```
 gsutil cp "C:\Users\Kered\Documents\MyDigital_School\Jour1\openfoodfacts_sample.csv" gs://kadri_bucket/

 ```

### ✅ faire maintenant en une seule fois Terminal sdk :

Crée manuellement le bucket à l’intérieur de ce projet :
```
gsutil mb -p data-cloud-kadri -l europe-west1 -c standard gs://data-cloud-kadri/
```

    🔁 L’option -p data-cloud-kadri force le bucket à être créé dans ce projet même si tu es sur un autre projet par défaut dans ton terminal.

### 🔍 Vérification :

vérifier le projet actif en ligne de commande :
```
gcloud config list project
```

Et changer de projet (si besoin) avec :
```
gcloud config set project data-cloud-kadri
```

### 🔍 1. Lister tous les projets GCP accessibles à ton compte
```
gcloud projects list
```

### 🔁 2. Changer de projet actif dans ton terminal
```
gcloud config set project NOM_DU_PROJET
```

 - Exemple :
```
    gcloud config set project data-cloud-kadri
```

### ☁️ 3. Lister tous les buckets dans le projet courant
```
gsutil ls
```
