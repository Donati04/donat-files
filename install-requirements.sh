#!/usr/bin/env bash
set -euo pipefail

# Eseguire dalla directory della lista, che è un file Bash locale fidato.
source ./requirments.sh

# Aggiorna il sistema e i database; set -e ferma lo script in caso di errore.
if (( EUID == 0 )); then
  pacman -Syu
else
  sudo pacman -Syu
fi

# Legge il catalogo aggiornato per scegliere le repository.
catalog=$(LC_ALL=C pacman -Sl)
declare -A selected=()
while read -r repo package rest; do
  if [[ $repo == cachyos || $repo == cachyos-* ]]; then
    # Mantiene la prima repository CachyOS, nell'ordine configurato.
    [[ ${selected[$package]-} == cachyos*/* ]] || selected[$package]="$repo/$package"
  elif [[ $repo == core || $repo == extra || $repo == multilib ]]; then
    [[ -n ${selected[$package]-} ]] || selected[$package]="$repo/$package"
  fi
done <<< "$catalog"

targets=()
for package in "${pacman_apps[@]}"; do
  if [[ $package == neovim ]]; then
    targets+=(extra/neovim)
  elif [[ -n ${selected[$package]-} ]]; then
    targets+=("${selected[$package]}")
  else
    printf 'Saltato: %s (non trovato nelle repository; potrebbe essere AUR).\n' "$package" >&2
  fi
done

(( ${#targets[@]} > 0 )) || { printf 'Nessun pacchetto da installare.\n' >&2; exit 1; }

# repository/pacchetto evita il prompt di scelta della repository per la lista.
# Senza --needed, anche Neovim già installato viene preso da extra.
if (( EUID == 0 )); then
  pacman -S -- "${targets[@]}"
else
  sudo pacman -S -- "${targets[@]}"
fi
