FROM ghcr.io/open-webui/open-webui:main

USER root

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Use the official Ollama install script to get the latest version
RUN curl -fsSL https://ollama.com/install.sh | sh

# IMPORTANT: Reset permissions on the ENTIRE application directory
RUN chown -R 1000:1000 /app

# Revert to the original user for security
USER 1000:1000

# The original CMD from the Open WebUI image will be used automatically
