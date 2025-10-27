#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apt update && apt upgrade
grep -v '^#' ./genwork.packages | xargs apt -y install

# Installing Quarto and other debs not present in the repos
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.42/quarto-1.6.42-linux-amd64.deb
apt -y install ./quarto-1.6.42-linux-amd64.deb && rm ./quarto-1.6.42-linux-amd64.deb

# Installing R and Python Packages
R -e "install.packages('readr', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('tidyr', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('dplyr', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('ggplot2', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('knitr', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('kableExtra', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('igraph', dependencies=TRUE, repos='http://cran.rstudio.com/')"

python3 -m venv /pyenv && \
    /pyenv/bin/pip install -r requirements.txt && \
    chmod 777 -R /pyenv && rm /requirements.txt
