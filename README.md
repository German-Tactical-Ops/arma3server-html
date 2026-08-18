# arma3server-html

Contains HTML mod presets and the static web files for the GTO Download Portal and server containers.

## Overview

- **Mod Presets (`*.html`):** Arma 3 Launcher modpack export files (e.g. *GTO Main*, *GTO BlackForest*, *GTO PineSpider*) used by the server container for automatic mod downloading and updates.
- **Web Portal (`www/`):** Static web frontend served by `gto-download-portal` providing direct downloads of mod preset HTML files and Arma3Sync autoconfig links.
- **Scripts (`scripts/`):** Utility scripts such as `generate-modlists.sh` to automatically index available HTML mod presets into `modlists.json` and `zeus-modlists.json`.

## Usage

- **Server Container:** Set `REPO_HTML` to point to this repository to automatically download and sync modpresets.
- **Download Portal:** Mount or clone into `gto-download-portal` (`NGINX_WEB_ROOT`) to host the web interface.
