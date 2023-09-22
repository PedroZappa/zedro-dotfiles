# zedro-dotfiles

- Clone repo into .dotfiles folder in home directory.

```sh 
gh repo clone PedroZappa/zedro-dotfiles ~/.dotfiles
``` 

- Create symlinks to .dotfiles in home directory.

```sh 
~
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

- Setup vimrc

```sh 
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
```
