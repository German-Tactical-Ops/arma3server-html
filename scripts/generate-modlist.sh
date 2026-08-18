#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
www_dir="$repo_root/www"
zeus_dir="$repo_root/zeus"

main_json="$www_dir/modlists.json"
zeus_json="$www_dir/zeus-modlists.json"

mkdir -p "$www_dir"

# Generate main modlists JSON
find "$repo_root" -maxdepth 1 -type f -name '*.html' -exec basename {} \; | sort | jq -R . | jq -s . > "$main_json"

# Generate zeus modlists JSON
if [[ -d "$zeus_dir" ]]; then
  find "$zeus_dir" -maxdepth 1 -type f -exec basename {} \; | sort | jq -R . | jq -s . > "$zeus_json"
else
  echo "[]" > "$zeus_json"
fi

echo "Generated $main_json"
echo "Generated $zeus_json"
