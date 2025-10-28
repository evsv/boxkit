# CSS Boxkit

This is a fork of the boxkit project customised to come pre-configured with a tools I use for the Computational Social Sciences. Containers are something I'm still learning, so if there's a better way to set this image up, please let me know in the issues!

## What is boxkit ?

boxkit is a set of GitHub actions and skeleton files to build custom toolbox and distrobox images. Basically, clone this repo, make any changes you need, and then generate your custom images.

Note that boxkit can be used independently of Fedora or uBlue OS.
boxkit requires you atleast understand the basics of [ContainerFiles](https://www.mankier.com/5/Containerfile) and [shell scripting.](https://www.shellscript.sh/)

## Base images

You can use the Docker/OCI container image of practically any distribution as your base image to build your custom image off of. Note that the base images can also be used directly with distrobox/toolbox without any modifications.

Here is a list of some base images you can use:

- [toolbx Community images](https://github.com/toolbx-images/images)
- [uBlue toolboxes](https://github.com/ublue-os/toolboxes)

Try to derive your custom images from these base images so we can all help maintain them over time, you can't have bling without good stock!

Tag your image with `boxkit` to share with others!

## What's included in this image?

**Software:**
- Python, with pip, venv and uv included
- Base R
- Pandoc for document rendering
- A set of library dependencies for a variety of Python and R projects
- A set of LaTex packages 
- sqlite3 for basic db file writing
- Please refer to `packages/genwork.packages` for a full list

**R libraries pre-installed:**
- Tidyverse packages: readr, tidyr, dplyr, ggplot2, knitr
- Rmarkdown packages: knitr, kableExtra
- Please refer `ContainerFiles/genwork` for the R command that installs packages
