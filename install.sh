#!/bin/bash
# ══════════════════════════════════════
#  APERTURE SCIENCE TERMINAL
#  Script de instalación automática
# ══════════════════════════════════════

echo ""
echo "  APERTURE SCIENCE ENRICHMENT CENTER"
echo "  Initializing installation sequence..."
echo ""

# ── DEPENDENCIAS ────────────────────
echo "  [1/5] Installing dependencies..."
sudo apt update -q
sudo apt install -y cool-retro-term mpg123 bc vorbis-tools curl zstd

# ── OLLAMA ──────────────────────────
echo "  [2/5] Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
ollama serve &
sleep 3
ollama pull mistral:7b

# ── ARCHIVOS LINUX ──────────────────
echo "  [3/5] Copying config files..."
cp linux/.bashrc ~/.bashrc
cp linux/.aperture_animated.sh ~/.aperture_animated.sh
cp linux/.aperture_launch.sh ~/.aperture_launch.sh
cp linux/.aperture_logo ~/.aperture_logo
cp linux/.aperture_logo_static ~/.aperture_logo_static
cp linux/still_alive.mp3 ~/still_alive.mp3
chmod +x ~/.aperture_animated.sh ~/.aperture_launch.sh

# ── ARCHIVOS WINDOWS ────────────────
echo "  [4/5] Copying Windows files..."
WINUSER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
mkdir -p /mnt/c/Users/$WINUSER/.config/wezterm
cp windows/aperture.bat /mnt/c/Users/$WINUSER/.config/wezterm/aperture.bat
cp windows/logo.txt /mnt/c/Users/$WINUSER/.config/wezterm/logo.txt

# Crear portal
