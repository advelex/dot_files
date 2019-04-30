set nocompatible
filetype indent plugin on
syntax on

" Install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'neutaaaaan/iosvkem'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'ciaranm/inkpot'
Plug 'tomasiser/vim-code-dark'

" Essential
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-python/python-syntax'

call plug#end()

" Colorsceme options
set background=dark
colorscheme Iosvkem
" Transparent backbround
" hi Normal ctermbg=none


" Set space as leader-key
let mapleader = "\<Space>"

" Fuzzy path search
set path+=**


" Use systemclipboard by default
set clipboard=unnamedplus

" Have multiple unsaved buffers open, keep history for them
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

" BACKUP
set nobackup
"set backupdir=~/.vim_backup

" show linenumber and relative linenumber
set number
set relativenumber

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Always display the status line, even if only one window is displayed
set laststatus=2
" It's useful to show the buffer number in the status line.
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set default split direction
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

" moving between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


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

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>
" Shorcut to toggle relative numbers
nmap <leader>r :set rnu!<CR>


" Edit .vimrc with <leader> + v
nmap <leader>v :edit $MYVIMRC<CR>


" MATLAB FILES
" Run on octave with F6
autocmd FileType matlab nnoremap <silent> <F6> :w!<CR>:!octave -q "%:p"<CR>


" PYTHON FILES
" Run Python for F6
autocmd FileType python nnoremap <silent> <F6> :w!<CR>:!python3 "%:p"<CR>
" Run PEP8 for current python file with F7
autocmd FileType python nnoremap <silent> <F7> :w!<CR>:!pycodestyle "%:p"<CR>
" Better python highlighting
let python_highlight_all = 1
let python_highlight_space_errors = 0
let python_highlight_indent_errors = 0


" MARKDOWN FILES
" Recognition of markdown files with .md extension
autocmd BufNewFile,BufFilePre,BufRead *.md setlocal filetype=markdown
" Run GRIP for current markdown file with F6
autocmd FileType markdown nnoremap <F6> :w!<CR>:!grip "%:p"<CR>
" Run markdown-pdf for current markdown file with F7
autocmd FileType markdown nnoremap <silent> <F7> :w!<CR>:!markdown-pdf -s ~/mdpdf.css "%:p"<CR>


" C-FILES
" Make C-file with F6
autocmd FileType c nnoremap <silent> <F6> :w!<CR>:!make<CR>
" Make and Run C-file with F7
autocmd FileType c nnoremap <silent> <F7> :w!<CR>:!make run<CR>
" Make and Test C-file with F8
autocmd FileType c nnoremap <silent> <F8> :w!<CR>:!make run-test<CR>


" CPP-FILES
" Compile cpp-file with F6
" autocmd filetype cpp nnoremap <F6> :!g++ % -std=c++11 -Wall -Wextra -ggdb -o %:r <CR>
autocmd FileType cpp nnoremap <silent> <F6> :w!<CR>:!make main<CR>
" Compile and run cpp-file with F7
autocmd filetype cpp nnoremap<F7> :!g++ % -std=c++11 -Wall -Wextra -ggdb -o %:r && ./%:r <CR><CR>
" Compile and debug cpp-file with F8
autocmd filetype cpp nnoremap<F10> :!g++ % -std=c++11 -Wall -Wextra -ggdb -o %:r && gdb -tui %:r <CR>


" HTML-FILES
" Open html file with web browser with F6
autocmd FileType html nnoremap <silent> <F6> :w!<CR>:!gnome-open "%:p"<CR>
" Tabs to 2 spaces for html and htmldjango files
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype htmldjango setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
" More indention on html
let g:html_indent_inctags = "html,body,head,tbody"

" ASSEMBLY
" Recognition of asm files with .asm extension
autocmd BufNewFile,BufFilePre,BufRead *.asm setlocal filetype=nasm


" SPECIAL TERMINAL GUI RELATED SETTINGS

" Gvim options
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" Disable bell and visual bell
set visualbell
set t_vb=

" Set colors
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

" Putty and 256 colors
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif


" CUSTOM FUNCTIONS

" Create the 'tags' file (ctags needs to be installed on OS)
command! MakeTags !ctags -R .


" CUSTOM FUNCTIONS

" automatic not relative numbering when focus lost
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Toggle color column with [leader c]
nnoremap <leader>c :call ColorColumnToggle()<cr>
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=80
    endif
endfunction

" Toggle text width with [leader t]
nnoremap <leader>t :call TextWidthToggle()<cr>
function! TextWidthToggle()
    if &textwidth
        setlocal textwidth=0
    else
        setlocal textwidth=79
    endif
endfunction

" Toggle Background with <F4>
nnoremap <F4> :call BackgroundColorToggle()<CR>
let g:background_toggling = 1
function! BackgroundColorToggle()
    if g:background_toggling
        set bg=light
        let g:background_toggling = 0
    else
        set bg=dark
        let g:background_toggling = 1
    endif
endfunction

" Toggle encoding between UTF-8 and latin1 with <F12>
nnoremap <F12> :call EncodingToggle()<CR>
let g:encoding_toggling = 1
function! EncodingToggle()
    if g:encoding_toggling
        e ++enc=latin1
        let g:encoding_toggling = 0
    else
        e ++enc=utf-8
        let g:encoding_toggling = 1
    endif
endfunction
