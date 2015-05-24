set nocompatible
filetype indent plugin on
syntax on

set background=dark

colorscheme jellybeans

if $COLORTERM == 'gnome-terminal'
      set t_Co=256
      let g:solarized_termcolors=256
      colorscheme molokai
endif


" Backgroud <F3>=dark/<F4>=light
nnoremap <F3> :set bg=dark<CR>:colorscheme solarized<CR>
nnoremap <F4> :set bg=light<CR>

" Press F12 to switch to UTF-8 encoding
nnoremap <F12> :e ++enc=utf-8<CR>
nnoremap <F11> :e ++enc=latin1<CR>

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Search as you type what to search for :)
set incsearch

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent


" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" BACKUP
set nobackup
"set backupdir=~/.vim_backup

" show linenumber:
set number

" set text width to 79
set tw=79

" Run Python for F6
autocmd FileType python nnoremap <silent> <F6> :w!<CR>:!python3 "%:p"<CR>

" Run PEP8 for current python file with F7
autocmd FileType python nnoremap <silent> <F7> :w!<CR>:!pep8 "%:p"<CR>

" Run GRIP for current markdown file with F6
autocmd FileType markdown nnoremap <F6> :w!<CR>:!grip "%:p"<CR>

" Run markdown-pdf for current markdown file with F7
autocmd FileType markdown nnoremap <silent> <F7> :w!<CR>:!markdown-pdf -s ~/mdpdf.css "%:p"<CR>

" Make C-file with F6
autocmd FileType c nnoremap <silent> <F6> :w!<CR>:!make main<CR>

" Make and Run C-file with F7
autocmd FileType c nnoremap <silent> <F7> :w!<CR>:!make run-main<CR>

" Make and Test C-file with F8
autocmd FileType c nnoremap <silent> <F8> :w!<CR>:!make run-test<CR>

" Open html file with firefox with F6
autocmd FileType html nnoremap <silent> <F6> :w!<CR>:!firefox "%:p"<CR>

" Change Default colorscheme for txt filetype
" autocmd BufEnter *.txt colorscheme default

" moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" set sp default direction
set splitright
set splitbelow

" tabsettings
set expandtab
set smarttab                  " tab and backspace are smart
set tabstop=4                 " 4 spaces
set shiftwidth=4
" :retab" to re-tab the file your working on..

" map control-backspace to delete the previous word
imap <C-BS> <C-W>

" Want a different map leader than \
let mapleader = "\<Space>"
let g:EasyMotion_leader_key = '<Leader><Leader>'

" More indention on html
let g:html_indent_inctags = "html,body,head,tbody"

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Recognition of markdown files with .md extension
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
