#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apt update && apt upgrade
grep -v '^#' ./genwork.packages | xargs apt install

# Installing python libraries
pip install pandas numpy ollama bertopic gensim

# Installing R libraries
Rscript -e "install.packages(c(\"readr\", \"dplyr\", \"tidyr\", \"kableExtra\", \"ggplot2\", \"stringr\", \"lubridate\", \"igraph\"), lib=\"~/R/libs\")"

# Installing Ollama and other deb files not present in repos
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.42/quarto-1.6.42-linux-amd64.deb

apt install ./quarto-1.6.42-linux-amd64.deb && rm ./quarto-1.6.42-linux-amd64.deb
curl -fsSL https://ollama.com/install.sh | sh
