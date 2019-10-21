# vim setup
echo "source ~/.cfg/nvim/index.vimrc" > ~/.config/nvim/init.vim
ln -s ~/.cfg/nvim/ftplugin ~/.config/nvim/
ln -s ~/.cfg/nvim/coc-settings.json ~/.config/nvim/

# other configs
ln -s ~/.cfg/gitignore ~/.gitignore
ln -s ~/.cfg/tmux.conf ~/.tmux.conf
ln -s ~/.cfg/zshrc ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
