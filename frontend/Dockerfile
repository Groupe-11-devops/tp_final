# Image de base : Nginx pour servir un site statique
FROM nginx:alpine

# Copier la configuration nginx perso (si tu l’utilises)
# (optionnel mais tu as un nginx.conf, donc on s'en sert)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copier tous les fichiers du frontend (html, css, js, etc.) dans le dossier web
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
