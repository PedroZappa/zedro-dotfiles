# zedro-dotfiles

## Install [`oh-my-zsh`](https://ohmyz.sh/)

```sh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install [`oh-my-tmux`](https://github.com/gpakosz/.tmux)

```sh
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

## Clone repo into .dotfiles folder in home directory.

```sh 
git clone https://github.com/PedroZappa/zedro-dotfiles.git ~/.dotfiles
``` 

## Create symlinks to .dotfiles in home directory.

```sh 
~
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

## Setup `zsh` plugins 

Clone plugins into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use 
```

## Install [`vim-plug`](https://github.com/junegunn/vim-plug)

```sh 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Setup `.vimrc`

```sh 
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

```
