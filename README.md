# zedro-dotfiles

Installation instructions to my favourite digital tools.

___

### Table o'Contents

<p>
    ~
    <a href="#cloning-zedro-dotfiles">Cloning</a> ~
    <a href="#setup-zsh">Setup zsh</a> ~
    <a href="#setup-vim">Setup vim</a> ~
    <a href="#setup-tmux">Setup tmux</a> ~
    <a href="#setup-terminal">Setup Terminal</a> ~
    <a href="#other-utilities">Other Utilities</a> ~
</p>

___

### Cloning `zedro-dotfiles`

```shell
git clone https://github.com/PedroZappa/zedro-dotfiles.git ~/.dotfiles
``` 

#### Create symlinks to .dotfiles in home directory.

```sh
~
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.dotfiles/.gdbinit ~/.gdbinit
```

___

## Setup [zsh](https://www.zsh.org/)


#### Install [`oh-my-zsh`](https://ohmyz.sh/)

```shell 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Setup [zap](https://github.com/zap-zsh/zap) plugin manager

```shell
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

#### Setup [zsh](https://www.zsh.org/) plugins 

Clone plugins into `ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)`

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use 
```

#### Install [`starship`](https://starship.rs/) prompt

```shell
curl -sS https://starship.rs/install.sh | sh
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml
```

___

# Setup [vim](https://www.vim.org/)


#### Setup `.vim`

```shell
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

# Install color schemes
cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -o dogrun.vim https://raw.githubusercontent.com/wadackel/vim-dogrun/main/colors/dogrun.vim
curl -o minimalist.vim https://raw.githubusercontent.com/dikiaap/minimalist/master/colors/minimalist.vim
curl -o dracula.vim https://raw.githubusercontent.com/dracula/vim/210e0961b9bd765b5b46a84d0631271ee8e6af64/colors/dracula.vim
curl -o PaperColor.vim https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim
```

#### Setup [neovim](https://neovim.io/doc/)

```shell
ln -s ~/.dotfiles/nvim/ ~/.config/
```

___

## Setup [tmux](https://github.com/tmux/tmux) 

#### Install [`oh-my-tmux`](https://github.com/gpakosz/.tmux)

```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

___

## Setup Terminal

#### Setup [kitty](https://sw.kovidgoyal.net/kitty/)

```shell
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Add kitty to path
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/

# kitty dracula theme
ln -s ~/.dotfiles/kitty/dracula.conf ~/.config/kitty/dracula.conf
ln -s ~/.dotfiles/kitty/diff.conf ~/.config/kitty/diff.conf

```

___

## Other Utilities

#### Setup [Midnight Commander](https://midnight-commander.org/)

```shell
# mc config
ln -s ~/.dotfiles/mc/ini ~/.config/mc/ini
ln -s ~/.dotfiles/mc/panels.ini ~/.config/mc/panels.ini

# Dracula Color Scheme
# dracula
ln -s ~/.dotfiles/mc/skins/dracula.ini ~/.local/share/mc/skins/dracula.ini
# dracula256
ln -s ~/.dotfiles/mc/skins/dracula256.ini ~/.local/share/mc/skins/dracula256.ini
```

#### Install [neofetch](https://github.com/dylanaraps/neofetch)

```shell
sudo apt install neofetch
ln -s ~/.dotfiles/neofetch.conf ~/.config/neofetch/neofetch.conf
```

