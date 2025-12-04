# Image de base : Nginx pour servir un site statique
FROM nginx:stable-alpine 

# Copier la configuration nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf 

# Copier tous les fichiers du frontend (HTML, CSS, JS) dans le dossier web
COPY . /usr/share/nginx/html 

# Exposer le port 80 pour le trafic web
EXPOSE 80 

# Lancer Nginx en mode foreground
CMD ["nginx", "-g", "daemon off;"]
