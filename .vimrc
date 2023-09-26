""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Zedro's Config           
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""      
" OPTIONS 

" 1. important------------------------------------------------- {{{
"
" Initialize Vim to its default
source $VIMRUNTIME/defaults.vim
" disable compatibility with vi which can cause unexpected issues 
set nocp
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Turn syntax highlighting on.
syntax on

" }}}

" 2. moving around, searching and patterns------------------------------------------------- {{{
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" }}}

" 3. tags (aka. hyperlinks) ------------------------------------------------ {{{
" Use binary search in tag files
set tbs

" }}}

" 4. Display text------------------------------------------------- {{{
" Do not let cursor scroll below or above N number of lines when scrolling.
set scr=10
" Set smoothscroll : scroll by screen line
set sms
set scrolloff=5
" Wrap lines.
set wrap
" Show tabs and trailing spaces
set list
" list of strigns used for list mode
" set listchars=tab:>-,trail:-

" number of lines used for the command line
set cmdheight=1

" Add numbers to each line on the left-hand side.
set number
set relativenumber
set numberwidth=4

" }}}

" 5. Syntax highlight and spelling ------------------------------------------------ {{{
" Set backgound color brightness
set bg=dark
" Use highlighting when doing a search.
set hlsearch
" UseGUI colors for the terminal
set termguicolors
" highlight the screen column of the cursor
set cursorcolumn
" highlight the screen line of the cursor
" Enable cursorline in Normal mode
autocmd InsertEnter * set nocursorline
" Disable cursorline in Insert mode
autocmd InsertLeave * set cursorline

" Highlight Spelling Mistakes 
set nospell
" Enable spell check for .md and .txt files
autocmd BufNewFile,BufRead *.md,*.txt setlocal spell

" list of accepted languages
set spl=en


" }}}

" 6. Multiple Windows ------------------------------------------------ {{{
" Check Status Line for more settings from this section
" ( ... )
" Identifies the preview window
" set previewwindow
" Scroll bind : this window scrolls together with other bound windows
"set scb
" Cursor bind : this window's cursor moves together with other bound windows
"set crb

" }}}

" 7. Multiple tab pages ------------------------------------------------ {{{
" Show open buffers in tabs
set showtabline=2
" Maximum number of tab pages to be opened
set tabpagemax=10

" }}}

" 8. terminal  ------------------------------------------------ {{{
" name of the used terminal
set term=screen-256color
" alias for 'term'
set tty=screen-256color
" Show info in the window title
set title
" Percentage of 'columns' used for the window title
set titlelen=66
" string to be used for the window title
set titlestring=Zedro's\ Term
" string to restore the title to when exiting Vim
set titleold=See\ you\ in\ another\ life\ Zedro!
" set the text of the icon for this window
set icon


" }}}

" 9. Using the Mouse ------------------------------------------------ {{{
" allows the mouse to be used everywhere in Vim.
set mouse=a
" What the right mouse button is used for
set mousemodel=extend
" Hide the mouse pointer while typing
set mousehide=1


" }}}

" 10. Printing ------------------------------------------------ {{{

" }}}

" 11. Messages and info ------------------------------------------------ {{{
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show cursor position below each window.
set ruler
" use a visual bell for error messages
set visualbell
" ring the bell for error messages
set errorbells


" }}}

" 12. Selecting text ------------------------------------------------ {{{

" How selecting text behaves
set selection=inclusive
" When to start Select mode instead of Visual mode
" set selectmode=mouse,key,cmd

" }}}

" 13. Editing text ------------------------------------------------ {{{
" Maximum amount of changes that can be undone
set undolevels=1000
" automatically save and restore undo history
set undofile
" list of directories for undo files
set undodir=~/.vim/backup
" Tells vim to keep a backup copy of a file when overwritting it. But not on
" VMS system, since it keepss versions of old files already.
" if has("vms")
"     set nobackup
" else
"     set backup
"     if has('persistent_undo')
"         set undofile
"     endif
" endif

" maximum number of lines to save for undo on a buffer reload
set undoreload=10000
" changes have been made and not written to a file
set nomodified
" buffer is not to be written
set noreadonly
" Specifies what <BS>, CTRL-W, etc, can do in Insert mode
set backspace=indent,eol,start

" completeopt :  whether to use a popup menu for Insert mode completion
set completeopt=menu,preview

" Show matching words during a search.
set showmatch


" }}}

" 14. Selecting text ------------------------------------------------ {{{
" Set the number of spaces a tab stands for.
set tabstop=4
" Number of spaces used for each step of (auto)indent 
set shiftwidth=4
" Use space characters instead of tabs.
set expandtab
" Automatically set the Indent of a new line
set autoindent
" Do clever auto-indenting
set smartindent 
" Enable specific indenting for C code
set cindent
" Copy whitespace for indenting from previous line
" set copyindent

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab


" }}}

" 15. Folding  ------------------------------------------------ {{{

" }}}

" 16. Diff Mode  ------------------------------------------------ {{{

" }}}

" 17. Mapping ------------------------------------------------ {{{
" recognize mappings in mapped keys
set remap
" allow timing out halfway into a mapping
set timeout

" }}}

" 18. Reading and writing files ------------------------------------------------ {{{
" automatically write a file when leaving a modified buffer
set autowrite
" Automatically read a file when it was modified outside of Vim
set autoread


" }}}

" 19. The swap file ------------------------------------------------ {{{
" Do not use a swap file for this buffer
set noswf

" }}}

" 20. Command line editing ------------------------------------------------ {{{
" Set the commands to save in history default number is 20.
set history=1000
" Auto-complete
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" Enable auto completion menu after pressing TAB.
set wildmenu
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" 21. Reading and writing files ------------------------------------------------ {{{
" name of the shell program used for external commands 
set shell=zsh

" }}}

" 22. Running make and jumping to errors ----------------------------------------- {{{
" Program used for the ":make" command
set makeprg=make
" }}}

" 23. Language Specific ------------------------------------------------ {{{
" Insert Characters backwards (Off)
set norevins

" }}}

" 24. Multi-Byte Characters ------------------------------------------------ {{{
" character encoding used in Vim
set encoding=utf-8
" emoji characters are full width
set emoji

" }}}

" 25. Various ------------------------------------------------ {{{
" Load plugin scripts when stating up
set lpl

" TAG JUMPING
" Create the `tags` file (may need to install ctags first)
"command! MakeTags !ctags -R .

" Trying to reduce LAG
set timeoutlen=1000
set ttimeoutlen=0

" }}}
"


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

    Plug 'christoomey/vim-tmux-navigator'

    Plug 'dense-analysis/ale'

    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

    Plug 'mbbill/undotree'

    Plug 'airblade/vim-gitgutter'
    Plug 'jreybert/vimagit'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

    Plug 'vim-airline/vim-airline' |
            \ Plug 'vim-airline/vim-airline-themes'

    Plug 'tpope/vim-commentary'

    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'preservim/tagbar'

    Plug 'BourgeoisBear/clrzr' 

    Plug 'https://github.com/adelarsq/vim-matchit'

    Plug 'editorconfig/editorconfig-vim'

call plug#end()

" }}}

""" PLUGIN CONFIG """

" NERDTree Options ------------------------------------------------ {{{
" show hidden files
let NERDTreeShowHidden=1

" Use Nerdfonts predefined map
let g:NERDTreeGitStatusUseNerdFonts = 1 
" Show ignored files, a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 
" Show 'clean' indicator
let g:NERDTreeGitStatusShowClean = 1 " default: 0

" NERDTree Syntax Highlighting
" Disable unmatched folder and file icons having the same color as label 
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Set NERDTree colors
" Helper Colors codes
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let git_files = ['.git', '.gitconfig', '.gitignore_global', '.gitignore', '.gitmodules', '.gitattributes', ".git_globals"]

let g:NERDTreeExactMatchHighlightColor = {}
for git_file in git_files
    let g:NERDTreeExactMatchHighlightColor[git_file] = s:git_orange " sets the color for .gitignore files
endfor

"let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
"let g:NERDTreeExtensionHighlightColor['c'] = s:blue " sets the color of .c files to blue

" DevIcons Default Options
let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" Have NERDTree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$', '\.DS_Store']
    

" Mitigation LAG
" Disable all default file highlighting (you can use this to easily customize all the highlighting rules)
"let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
" Enable specific file extensions
"let g:NERDTreeSyntaxEnabledExtensions = ['lua', 'c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html'] " enabled extensions with default colors
"let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico'] " enabled exact matches with default colors


" }}}

" NETRW Options ------------------------------------------------ {{{
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" }}}

" gitgutter Options ------------------------------------------------ {{{
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
hi SignColumn guibg=NONE
hi SignColumn ctermbg=NONE

" Your vimrc
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('| Git: +%d ~%d -%d', a, m, r)
endfunction

" }}}

" Airline Options ------------------------------------------------ {{{
" Show open buffer tabline
let g:airline#extensions#tabline#enabled = 1
" Setup Separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Set Path formatter
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Set Airline Theme
" let g:airline_theme='wombat'
let g:airline_theme='powerlineish'
" let g:airline_theme='jellybeans'
" let g:airline_theme='minimalist'
" let g:airline_theme='term'

" }}}

" NERDCommenter Options ------------------------------------------------ {{{
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" }}}



" Vim THEME ------------------------------------------------ {{{
"
" set color scheme
" colorscheme molokai 
colorscheme dracula
" Adjust Type highlighting
hi Type gui=bold guifg=#60ff60

" set transparent background
hi Normal guibg=NONE ctermbg=NONE


" }}}


" MAPPINGS --------------------------------------------------------------- {{{
""" Normal Mode
" Set the space bar as the leader key.
let mapleader = " "
" Press SPACE-\ to jump back to the last cursor position.
nnoremap <leader>\ ``
" Source the current Vim configuration file
nnoremap <leader><leader> :source $MYVIMRC<CR>
" Call for Help
nnoremap <leader>h :help<CR>
" Close Help Buffer
nnoremap <leader>ch :helpclose<CR>
" Go into inside tag
map oo <C-]>
" Call for Options
nnoremap <leader>o :options<CR>
" Close active buffer
nnoremap <leader>bd :bd!<CR>

" Navigation Controls
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>

" Folding and Unfolding
" Open all folds
nnoremap <leader>of :normal! zR<CR>
" Close all folds
nnoremap <leader>cf :normal! zM<CR>

" Search and Replace CMD
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" clear Search Highlight
nnoremap <silent> <leader>cs :nohlsearch<CR>

" Press SPACE-p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Press \ to type the : character in command mode.
nnoremap \ :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Surround word by curly braces {}
map <leader>\{ i{<Esc>ea}<Esc>
" Surround word by square braces []
map <leader>\[ i[<Esc>ea]<Esc>
" Surround word by braces ()
map <leader>\( i(<Esc>ea)<Esc>
" Surround word by double quotes
map <leader>\" i"<Esc>ea"<Esc>
" Surround word by single quotes
map <leader>\' i'<Esc>ea'<Esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
" nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <leader>e :NERDTreeToggle<cr>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Open vimagit pane
nnoremap <leader>gs :Magit<CR>

" vim-fugitive
" Show commits for every source line
nnoremap <leader>gb :Git blame<CR> 

" tagbar mappings
nnoremap <leader>tb :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Insert Mode 
" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Codeium Mappings
inoremap <script><silent><nowait><expr> <C-g> codeium#Accept()
inoremap <M-q>   <Cmd>call codeium#CycleCompletions(1)<CR>
inoremap <M-w>   <Cmd>call codeium#CycleCompletions(-1)<CR>
inoremap <M-x>   <Cmd>call codeium#Clear()<CR>"

"  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Visual Mode

" Yank visually selected text and serch for it in C files
vnoremap _g y:exe "grep /" .. escape(@", '\\/') .. "/ *.c *.h"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Terminal Mode

" Open a new empty horizontal terminal window
nnoremap <leader>tr :belowright terminal<CR>
" Open a new vertical terminal window
nnoremap <leader>tv :vertical terminal<CR><C-W>L


" Exit insert mode in terminal mode
tnoremap <Esc> <C-\><C-n>
" Terminate terminal and close pane
tnoremap <Esc><Esc> <C-\><C-n>:bd!<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" File Type Related Settings

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" for text documents break lines at 78 characters
augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
                \set guioptions-=mTr<Bar>
                \else<Bar>
                \set guioptions+=mTr<Bar>
                \endif<CR>

endif

" }}}
"

" STATUS LINE ------------------------------------------------------------ {{{
" Vanilla Vim Status line config
" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" gitgutter status
set statusline+=%{GitStatus()}
" Codeium Status
set statusline+=\ \|\ \{…\}%3{codeium#GetStatusString()}
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2

" }}}
