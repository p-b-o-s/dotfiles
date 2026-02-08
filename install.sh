#!/bin/bash
# Symlink to Home
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/nvchad ~/.config/nvchad

cp ~/dotfiles/.config/opencode/opencode.json ~/.config/opencode/opencode.json
cp ~/dotfiles/.config/mcp/mcp_servers.json ~/.config/mcp/mcp_servers.json
cp ~/dotfiles/.config/claude ~/.claude
