# Clicker Game - Projet DevOps

Projet d'application web de jeu de type "clicker" avec leaderboard, achievements et gestion des scores. L'architecture comprend un frontend statique (HTML/CSS/JS servi par Nginx), un backend Go et une base PostgreSQL.[^1][^2]

## Architecture

- **Frontend** : Interface jeu avec `index.html`, `style.css` et `game.js` (logique clicker, envoi scores API).
- **Backend** : API Go (`main.go`) gérant users, scores, leaderboard et achievements via Gorilla Mux et lib/pq.
- **Base de données** : PostgreSQL avec schémas `00-init.sql` (tables) et `01-populate.sql` (données initiales achievements).[^2][^1]


## Installation Locale

1. Clonez le dépôt et copiez `file.env` en `.env`.
2. Lancez avec Docker Compose (fichier manquant, mais services prévus : frontend/nginx, backend/go, postgres).
3. Variables DB : `DB_HOST=db`, `DB_PORT=5432`, `DB_USER=clicker`, `DB_PASSWORD=clicker`, `DB_NAME=clicker`.[^3]
4. Scripts utilitaires : `wait-for-db.sh` pour attendre la DB.[^1]

## Utilisation

- Lancez localement : `docker compose up`.
- API endpoints : `/api/leaderboard` (GET), `/api/scores` (POST), `/api/achievements` (GET), `/api/achievements/{username}` (GET).
- Frontend accessible via Nginx (`nginx.conf` avec gzip et cache).[^4][^2]


## CI/CD

Workflow GitHub Actions (`ci-cd.yml`) :

- Scan secrets (TruffleHog).
- Scan vulnérabilités (Trivy sur images Docker backend/frontend).
- Déploiement webhook Coolify sur `tpfinal.domain.store`.[^5]

| Étape | Outil | Déclencheur |
| :-- | :-- | :-- |
| Secrets | TruffleHog | Push/PR main |
| Vulns | Trivy | Après secrets |
| Deploy | Coolify webhook | Main only |

## Git Flow

- **main** : Production (déploiement auto).
- **develop** : Intégration (tests CI).
- PR vers main avec reviews. Documenté pour audits sécurité (bandit/trufflehog).[^1]


## Docker

- Backend : `dockerfile` (Go multi-stage).
- Frontend : `Dockerfile` (Nginx).
- Build : `docker build -t clicker-backend .backend` et `.frontend`.[^1]


## Déploiement Coolify

Configurez webhook avec tokens CI/CD. URL : `https://coolify.niceapp.cloud` sur `tpfinal.domain.store`.[^5][^1]

## Fichiers Ignorés

`.gitignore` : `file.gitignore` standard (node_modules, .env, etc.).[^1]

<div align="center">⁂</div>

[^1]: Final-2.pdf

[^2]: main.go

[^3]: file.env

[^4]: nginx.conf

[^5]: ci-cd.yml

