#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
www_dir="$repo_root/www"
zeus_dir="$repo_root/zeus"

main_json="$www_dir/modlists.json"
zeus_json="$www_dir/zeus-modlists.json"

json_escape() {
  local s="$1"
  s="${s//\\/\\\\}"
  s="${s//\"/\\\"}"
  printf '%s' "$s"
}

write_json_array() {
  local output_file="$1"
  shift
  local entries=("$@")

  {
    printf '[\n'
    local total="${#entries[@]}"
    local i
    for ((i = 0; i < total; i++)); do
      local escaped
      escaped="$(json_escape "${entries[$i]}")"

      if [[ "$i" -lt $((total - 1)) ]]; then
        printf '  "%s",\n' "$escaped"
      else
        printf '  "%s"\n' "$escaped"
      fi
    done
    printf ']\n'
  } > "$output_file"
}

main_files=()
while IFS= read -r filename; do
  main_files+=("$filename")
done < <(find "$repo_root" -maxdepth 1 -type f -name '*.html' -print | sed 's|.*/||' | sort)

zeus_files=()
if [[ -d "$zeus_dir" ]]; then
  while IFS= read -r filename; do
    zeus_files+=("$filename")
  done < <(find "$zeus_dir" -maxdepth 1 -type f -print | sed 's|.*/||' | sort)
fi

if [[ ${#main_files[@]} -gt 0 ]]; then
  write_json_array "$main_json" "${main_files[@]}"
else
  write_json_array "$main_json"
fi

if [[ ${#zeus_files[@]} -gt 0 ]]; then
  write_json_array "$zeus_json" "${zeus_files[@]}"
else
  write_json_array "$zeus_json"
fi

echo "Generated $main_json with ${#main_files[@]} entries."
echo "Generated $zeus_json with ${#zeus_files[@]} entries."
