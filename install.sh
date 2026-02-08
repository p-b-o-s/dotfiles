#!/bin/bash

echo "🏠 Symlink dotfiles..."
# Symlink to Home
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/nvchad ~/.config/nvchad

echo "🔍 DEBUG: Checking directories before copying..."
TARGET_DIR="$HOME/.config/opencode"

if [ -d "$TARGET_DIR" ]; then
    echo "✅ Directory EXISTS: $TARGET_DIR"
    echo "   Contents:"
    ls -la "$TARGET_DIR"
else
    echo "❌ Directory MISSING: $TARGET_DIR"
    echo "   (This is why 'cp' failed)"
    
    echo "   Checking parent directory (~/.config):"
    if [ -d "$HOME/.config" ]; then
        ls -la "$HOME/.config" | grep "opencode" || echo "   -> 'opencode' folder is not inside .config"
    else
        echo "   -> Even ~/.config does not exist!"
    fi
fi
echo "----------------------------------------"


echo "🏠 Copying config files..."

mkdir -p ~/.config/opencode
mkdir -p ~/.config/mcp

cp ~/dotfiles/.config/opencode/opencode.json ~/.config/opencode/opencode.json
cp ~/dotfiles/.config/mcp/mcp_servers.json ~/.config/mcp/mcp_servers.json
cp -r ~/dotfiles/.config/claude/* ~/.claude/
