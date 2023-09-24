# zedro-dotfiles

- Clone repo into .dotfiles folder in home directory.

```sh 
gh repo clone PedroZappa/zedro-dotfiles ~/.dotfiles
``` 

- Create symlinks to .dotfiles in home directory.

```sh 
~
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

# Setup `zsh` plugins 

Clone plugins into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use 
```

# Setup `.vimrc`


```sh 
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
```
