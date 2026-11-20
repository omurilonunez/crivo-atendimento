#!/usr/bin/env bash
# Troca os ícones PNG do Chatwoot (favicon, apple, android, ms) pela bolinha da Crivo.
# Roda no GitHub Actions, antes do build da imagem. Cada PNG é refeito no mesmo tamanho do original.
# Os favicon-badge-* (aba com mensagem nova) ganham a bolinha vermelha no canto, como no original.
set -euo pipefail
cd "$(dirname "$0")/.."
SVG=crivo/icone.svg
for f in public/*.png; do
  tam=$(identify -format '%w' "$f")
  rsvg-convert -w "$tam" -h "$tam" "$SVG" -o "$f"
  case "$f" in
    *favicon-badge-*)
      r=$(( tam * 22 / 100 ))
      convert "$f" -fill '#E5484D' -draw "circle $((tam - r - 1)),$((r + 1)) $((tam - 1)),$((r + 1))" "$f"
      ;;
  esac
  echo "$f ${tam}px"
done
