#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apt update && apt upgrade
grep -v '^#' ./genwork.packages | xargs apt -y install

# Installing python libraries
python -m venv /general
/general/bin/pip install -r requirements.txt

# Installing R libraries
#Rscript -e "install.packages(c(\"readr\", \"dplyr\", \"tidyr\", \"kableExtra\", \"ggplot2\", \"stringr\", \"lubridate\", \"igraph\"), lib=\"~/R/libs\")"

# Installing Quarto and other debs not present in the repos
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.42/quarto-1.6.42-linux-amd64.deb
apt -y install ./quarto-1.6.42-linux-amd64.deb && rm ./quarto-1.6.42-linux-amd64.deb

