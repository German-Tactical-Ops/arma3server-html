# arma3server-html

Contains HTML mod presets for Arma 3 server containers and the GTO Download Portal.

## Overview

- **Mod Presets (`*.html`):** Arma 3 Launcher modpack export files (e.g. *GTO Main*, *GTO British*, etc.) used by the server container for automatic mod downloading and updates, and by the download portal for direct user downloads.

## Usage

- **Server Container:** Set `REPO_HTML` to point to this repository to automatically download and sync modpresets.
- **Download Portal:** Set `GIT_REPO_URL` (or `HTML_REPO_URL`) in `modpack-html` to automatically index and serve mod presets.
