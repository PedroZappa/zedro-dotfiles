# zedro-dotfiles

## Install [`oh-my-zsh`](https://ohmyz.sh/)

```shell 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install [`oh-my-tmux`](https://github.com/gpakosz/.tmux)

```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

## Clone repo into .dotfiles folder in home directory.

```shell
git clone https://github.com/PedroZappa/zedro-dotfiles.git ~/.dotfiles
``` 

## Create symlinks to .dotfiles in home directory.

```shell
~
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.dotfiles/.gdbinit ~/.gdbinit
```

## Setup `zsh` plugins 

Clone plugins into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use 
```

## Install [`vim-plug`](https://github.com/junegunn/vim-plug)

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Setup `.vim`

```shell
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

# Install color schemes
cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -o dogrun.vim https://raw.githubusercontent.com/wadackel/vim-dogrun/main/colors/dogrun.vim
curl -o minimalist.vim https://raw.githubusercontent.com/dikiaap/minimalist/master/colors/minimalist.vim
curl -o dracula.vim https://raw.githubusercontent.com/dracula/vim/210e0961b9bd765b5b46a84d0631271ee8e6af64/colors/dracula.vim
curl -o PaperColor.vim https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim
```

## Ubuntu Dracula Theme

Create symlink for ~/.themes 

```shell
ln -s ~/.dotfiles/.themes ~/.themes
ln -s ~/.dotfiles/.icons ~/.icons

# Activate Theme
gsettings set org.gnome.desktop.interface gtk-theme Dracula
gsettings set org.gnome.desktop.wm.preferences theme Dracula
```
