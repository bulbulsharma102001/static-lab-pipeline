# Use lightweight nginx image
FROM nginx:alpine

# Copy your static website files into nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]()
