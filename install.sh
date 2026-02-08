#!/bin/bash

echo "🏠 Symlink dotfiles..."
# Symlink to Home
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/nvchad ~/.config/nvchad

echo "🏠 Symlink dotfiles..."
cp ~/dotfiles/.config/opencode/opencode.json ~/.config/opencode/opencode.json
cp ~/dotfiles/.config/mcp/mcp_servers.json ~/.config/mcp/mcp_servers.json
cp -r ~/dotfiles/.config/claude ~/.claude
