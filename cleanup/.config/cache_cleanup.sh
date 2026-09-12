#!/usr/bin/env bash
set -e

echo "🧹 Starting disk cleanup..."

echo "▶ Cleaning pacman cache"
sudo pacman -Scc --noconfirm || true

echo "▶ Cleaning yay cache"
rm -rf ~/.cache/yay || true

echo "▶ Cleaning Docker"
if command -v docker >/dev/null 2>&1; then
  docker system prune -af --volumes || true
else
  echo "Docker not installed, skipping"
fi

echo "▶ Cleaning pnpm store"
if command -v pnpm >/dev/null 2>&1; then
  pnpm store prune || true
fi

echo "▶ Cleaning npm cache"
if command -v npm >/dev/null 2>&1; then
  npm cache clean --force || true
fi

echo "▶ Cleaning bun cache"
rm -rf ~/.bun/install/cache || true

echo "▶ Cleaning uv (Python) cache"
rm -rf ~/.cache/uv || true

echo "▶ Vacuuming systemd logs"
sudo journalctl --vacuum-size=200M || true

echo "✅ Cleanup complete"
df -h /

