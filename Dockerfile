# Stage 1: Build the static site
FROM ubuntu:latest AS builder

# Install dependencies
RUN apt-get update && apt-get install -y pandoc

# Set working directory
WORKDIR /app

# Copy source files
COPY . .

# Generate HTML
RUN pandoc -s index.md --template _template_.html -o index.html

# Generate DOCX
RUN pandoc -s index.md -o index.docx

# Stage 2: Prepare nginx container
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets from builder stage
COPY --from=builder /app/index.html /usr/share/nginx/html/
COPY --from=builder /app/index.docx /usr/share/nginx/html/

# Copy any other static assets (CSS, images, etc.)
# COPY --from=builder /app/assets /usr/share/nginx/html/assets

# Configure nginx
#COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
#EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]