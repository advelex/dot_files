set nocompatible
filetype indent plugin on
syntax on


" Colorsceme options
set background=dark
colorscheme Iosvkem
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
      let g:solarized_termcolors=256
      " colorscheme molokai
endif


" Set space as leader-key
let mapleader = "\<Space>"

" fuzzy path search
set path+=**

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


" Transparent backbround
" hi Normal ctermbg=none


" Use systemclipboard by default
set clipboard=unnamedplus


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

" automatic not relative numbering when focus lost
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


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

" show linenumber and relative linenumber
set number
set relativenumber

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


" Open html file with web browser with F6
autocmd FileType html nnoremap <silent> <F6> :w!<CR>:!gnome-open "%:p"<CR>
" Tabs to 2 spaces for html and htmldjango files
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype htmldjango setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2


" Change Default colorscheme for txt filetype
" autocmd BufEnter *.txt colorscheme default


" moving between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


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


" Recognition of asm files with .asm extension
au BufNewFile,BufFilePre,BufRead *.asm set filetype=nasm



" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>
" Shorcut to toggle relative numbers
nmap <leader>r :set rnu!<CR>


" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


" Edit .vimrc with <leader> + v
nmap <leader>v :edit $MYVIMRC<CR>


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


" Gvim options
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" Disable bell and visual bell
set visualbell
set t_vb=
