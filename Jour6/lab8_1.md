## 🔧 Étapes pour installer Docker Compose (Debian 12 / Ubuntu)
1. Ajouter le dépôt officiel Docker
sudo apt update
sudo apt install ca-certificates curl gnupg -y


# Ajouter la clé GPG officielle
```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

# Ajouter le dépôt Docker
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
```

2. Installer Docker + plugin Compose
```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

3. Vérifier l’installation
```bash
docker --version
docker compose version
```

👉 Tu dois voir une version Docker Compose v2.x.x.

4. Relancer Airflow

Dans ton dossier ~/airflow :
```bash
docker compose up airflow-init
docker compose up -d
```

Puis :
```bash
docker ps
```
