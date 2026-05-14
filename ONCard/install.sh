#!/bin/bash
# install_shortcut.sh - Run this to add ONCard to your Start Menu

# Securely get the directory this script lives in!
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ICON_SRC="$APP_DIR/_internal/assets/icons/app/app_logo.png"
ICON_DEST="$HOME/.local/share/icons/oncard.png"
DESKTOP_FILE="$HOME/.local/share/applications/ONCard.desktop"

# 1. Copy the icon
mkdir -p "$HOME/.local/share/icons/"
cp "$ICON_SRC" "$ICON_DEST"

# 2. Create the .desktop file
cat > "$DESKTOP_FILE" << EOL
[Desktop Entry]
Name=ONCard
Comment=Opensource Neural-accelerated Cards
Exec="$APP_DIR/ONCard"
Icon=oncard
Terminal=false
Type=Application
Categories=Education;Science;
StartupNotify=true
EOL

# 3. Apply changes
chmod +x "$DESKTOP_FILE"
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$HOME/.local/share/applications/"
fi

echo "✅ ONCard has been added to your application menu!"
