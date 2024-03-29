" Note if plugins missing run :PlugInstall

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'neutaaaaan/iosvkem'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'ciaranm/inkpot'
Plug 'tomasiser/vim-code-dark'

" Style
Plug 'itchyny/lightline.vim'

" Language spesific
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Essential
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Enhancements
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'w0rp/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" BASIC SETTINGS

" Set learder key to space
let mapleader = "\<Space>"

let g:python3_host_prog = '/usr/bin/python3'

" Colorscheme options
colorscheme onedark

" Set visible linenumbers
set number
set relativenumber  " as relative numbers

" No numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" Allow unsaved buffers
set hidden

" Set sp default direction
set splitright
set splitbelow

" Smart case when sarching.
set ignorecase
set smartcase

" Tabsettings
set expandtab
set tabstop=4                 " 4 spaces
set shiftwidth=4
" :retab to re-tab the file your working on..

" Set clipboard
set clipboard+=unnamedplus

" Fuzzy path search
set path+=**

" See non-visible chars better
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·


" REMAPPINGS

" Map Y to act like D and C, i.e. yank till EOL and not just yy
nnoremap Y y$

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>

" Mapping to exit terminal-mode
" tnoremap <Esc> <C-\><C-n>
tnoremap <A-n> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Moving between windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Movement from terminal
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" Shortcut to rapidly toggle `set list`
nnoremap <leader>i :set list!<CR>

" Shorcut to toggle relative numbers
nnoremap <leader>r :set relativenumber!<CR>

" Edit .vimrc with <leader> + v
nmap <leader>v :edit $MYVIMRC<CR>


" CUSTOM COMMANDS

" Create the 'tags' file (ctags needs to be installed on OS)
command! MakeTags !ctags -R .


" CUSTOM FUNCTIONS

" Toggle color column with [leader c]
nnoremap <leader>c :call ColorColumnToggle()<cr>
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=80
    endif
endfunction


" FILETYPE SPESIFIC SETTINGS

" tabstop at 2 spaces
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab


" PLUGIN SETTINGS

" Map fuzzy finder to [leader p]
nnoremap <Leader>p :CtrlP<CR>

" ALE settings
let g:ale_linters = {
  \ 'python': ['pycodestyle', 'pylint'] ,
  \ }
let g:ale_enabled = 0
" Dont check when at start
" let g:ale_lint_on_enter = 0
" Check only after save
" let g:ale_lint_on_text_changed = 'never'
nnoremap <Leader>j :ALEToggle<CR>

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype', ] ]
      \ },
      \ 'component_function': {
      \   'fileencoding': 'LightlineFileEncoding',
      \   'filetype': 'LightlineFiletype',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

" Dont show file encoding if window is too short
function! LightlineFileEncoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

" Dont show filetype if window is too short
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Show trunctated filepath
function! LightlineFilename()
	let name = ""
	let subs = split(expand('%'), "/") 
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
        " Uncomment below for full first directory name
		" elseif i == 1
		" 	let name = s
		else
			let name = parent . '/' . strpart(s, 0, 1)
		endif
		let i += 1
	endfor
  return name
endfunction

" Semshi settings
" let g:semshi#error_sign = 1
let g:semshi#error_sign_delay = 5.0
