# zedro-dotfiles
### 1st version of my .dotfiles system configuration.

- Clone repo into .dotfiles folder in home directory.

```sh 
gh repo clone PedroZappa/zedro-dotfiles ~/dotfiles
``` 

- Create symlinks to .dotfiles in home directory.

```sh 
~
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
``` 
