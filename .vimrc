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

" 3. tags------------------------------------------------ {{{
" Use binary search in tag files
set tbs

" }}}

" 4. Display text------------------------------------------------- {{{
" Do not let cursor scroll below or above N number of lines when scrolling.
set scr=10
" Set smoothscroll : scroll by screen line
set sms
set scrolloff=5
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
set tgc
" highlight the screen column of the cursor
set cuc
" highlight the screen line of the cursor
set cul

" Highlight Spelling Mistakes 
set spell
" list of accepted languages
set spl=en


" }}}

" 6. Multiple Windows (Status Line) ------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2

"  Identifies the preview window
set previewwindow
" Scroll bind : this window scrolls together with other bound windows
set scb
" Cursor bind : this window's cursor moves together with other bound windows
set crb

" }}}

" 7. Multiple tab pages ------------------------------------------------ {{{
" Show open buffers in tabs
set showtabline=1
" Maximum number of tab pages to be opened
set tabpagemax=10

" }}}

" 8. terminal  ------------------------------------------------ {{{
" name of the used terminal
set term=tmux-256color
" alias for 'term'
set tty=tmux-256color
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
set ru
" use a visual bell for error messages
set vb




" }}}

" 12. Selecting text ------------------------------------------------ {{{

" How selecting text behaves
set selection=inclusive
" When to start Select mode instead of Visual mode
set selectmode=mouse,key,cmd

" }}}

" 13. Editing text ------------------------------------------------ {{{
" Maximum amount of changes that can be undone
set undolevels=1000
" automatically save and restore undo history
set undofile
" list of directories for undo files
set undodir=~/.vim/backup
" maximum number of lines to save for undo on a buffer reload
set ur=10000
" changes have been made and not written to a file
set nomod
" buffer is not to be written
set noro
" completeopt :  whether to use a popup menu for Insert mode completion
set cot=menu,preview

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
set copyindent



" }}}

" 15. Folding  ------------------------------------------------ {{{

" }}}

" 16. Diff Mode  ------------------------------------------------ {{{

" }}}

" 17. Mapping ------------------------------------------------ {{{

" }}}

" 18. Reading and writing files ------------------------------------------------ {{{

" }}}

" 19. The swap file ------------------------------------------------ {{{

" }}}

" 20. Command line editing ------------------------------------------------ {{{

" }}}

" 21. Executing external commands ------------------------------------------------ {{{

" }}}

" 22. Running make and jumping to errors ----------------------------------------- {{{

" }}}

" 23. Language Specific ------------------------------------------------ {{{

" }}}

" 24. Multi-Byte Characters ------------------------------------------------ {{{

" }}}

" 25. Various ------------------------------------------------ {{{


" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn



" Do not save backup files.
set nobackup


" Wrap lines.
set wrap





" Set the commands to save in history default number is 20.
set history=1000

" Auto-complete
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
"set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" NERDTree show hidden files
let NERDTreeShowHidden=1

colorscheme molokai 
hi Normal guibg=NONE ctermbg=NONE

" TAG JUMPING
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
"
" NETrw settings (file tree)
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"
" MOUSE

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'

    Plug 'preservim/nerdtree'

    Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

""" Normal Mode
" Set the space bar as the leader key.
let mapleader = " "
" Press SPACE-\ to jump back to the last cursor position.
nnoremap <leader>\ ``
" Navigation Controls
" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>

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
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <leader>e :NERDTreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Insert Mode 
" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Codeium Mappings
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-x>   <Cmd>call codeium#Clear()<CR>"

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Visual Mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Command Mode


""" Terminal Mode
tnoremap <Esc> <C-\><C-n>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

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


" }}}
