# vim setup
echo "source ~/.cfg/nvim/index.vimrc" > ~/.config/nvim/init.vim
ln -s ~/.cfg/nvim/ftplugin ~/.config/nvim/
ln -s ~/.cfg/nvim/cocsettings.json ~/.config/nvim/

# other configs
ln -s ~/.cfg/gitignore ~/.gitignore
ln -s ~/.cfg/tmux.conf ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
