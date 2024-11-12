# Use a lightweight Nginx image to serve your static frontend files
FROM nginx:alpine

# Copy the built frontend files to the Nginx public directory
COPY . /usr/share/nginx/html

# Expose port 80 for Nginx to listen on
EXPOSE 80

# Nginx will serve the files from the default location
CMD ["nginx", "-g", "daemon off;"]
