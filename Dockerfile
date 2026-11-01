# Use lightweight nginx to serve static files
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all static site files to nginx's web root
COPY . /usr/share/nginx/html

# Cloud Run requires the container to listen on PORT env var (default 8080)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
