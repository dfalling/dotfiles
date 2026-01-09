# vim setup
mkdir ~/.config
ln -s ~/.cfg/nvim/ ~/.config/

mkdir ~/.config/ghostty
ln -s ~/.cfg/ghostty ~/.config/ghostty/config

# other configs
ln -s ~/.cfg/gitignore ~/.gitignore
ln -s ~/.cfg/tmux.conf ~/.tmux.conf
echo "source ~/.cfg/zshrc" >> ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
