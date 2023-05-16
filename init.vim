set number
set relativenumber
set numberwidth=1
set clipboard=unnamed
set mouse=a
syntax on
set showcmd
set ruler
set showcmd
set cursorline
set showmatch
set scrolloff=7
set shiftwidth=2
set backspace=indent,eol,start
set hidden
set updatetime=100
set nocompatible
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set encoding=UTF-8
set laststatus=2
set noshowmode "para Modo sin lightline

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
" set signcolumn=yes
" set nowrap
" set ruler
" set sw=2
" scriptencoding utf-8
" set autoindent

call plug#begin()
Plug 'https://github.com/preservim/nerdtree' "NerdTree
Plug 'easymotion/vim-easymotion' "space+s ingrese dos letras
Plug 'https://github.com/tpope/vim-surround' "Surrounding ysw)
Plug 'https://github.com/jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.
Plug 'https://github.com/tpope/vim-commentary' "gcc, gcap, gc and gcgc
Plug 'https://github.com/alvan/vim-closetag' "for html, react
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple curso
Plug 'https://github.com/christoomey/vim-tmux-navigator' "navegar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "busca archivos y texto
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/preservim/vimux' "varios paneles desde nvim
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'neovim/nvim-lspconfig'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' "Retro Scheme
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'mhinz/vim-signify' "muestra cuando se quiten lineas
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons' "Developer Icons
Plug 'https://github.com/preservim/tagbar'
Plug 'honza/vim-snippets'
" Plug 'https://github.com/shinchu/lightline-gruvbox.vim'
" Plug 'https://github.com/maximbaz/lightline-ale'
" Plug 'sheerun/vim-polyglot' "syntax
" Plug 'https://github.com/tpope/vim-fugitive' git
" Plug 'tpope/vim-repeat'
" Plug 'tyewang/vimux-jest-test'
" Plug 'janko-m/vim-test'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'https://github.com/SirVer/ultisnips' "revisar
call plug#end()

"g:tagbar_ctags_bin

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
let mapleader=" "
" :vsp Izq, :sp Abajo, 
let g:indentLine_char_list = ['┊']
"js polyglot
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
highlight Normal ctermbg=NONE
hi Normal ctermbg=NONE guibg=NONE
let g:NERDTreeDirArrowCollapsible = '~'
let g:NERDTreeDirArrowExpandable = '+'
let g:tmux_navigator_no_mappings = 0
" let g:UltiSnipsEditSplit='vertical'
" let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsListSnippets='<c-tab>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'

"  nerdtree
let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" lua << EOF
lua require('EgWeard')
" EOF
 
vmap <Leader>y "+y<CR>
nnoremap <Leader>p "+p<CR>
nnoremap <Leader>vsp :vsp<CR>
nnoremap <Leader>sp :sp<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>q! :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <leader>da :let @*=expand("%")<CR>
nnoremap <Leader>i.v :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>nt :NERDTreeFocus<CR>
nnoremap <Leader>lp :LspInfo<CR>
noremap <Leader>k :bnext<CR> 
noremap <Leader>j :bprevious<CR>
noremap <Leader>x :bdelete<CR>
noremap <silent> <leader><C-h> :TmuxNavigateLeft<cr>
noremap <silent> <leader><C-j> :TmuxNavigateDown<cr>
noremap <silent> <leader><C-k> :TmuxNavigateUp<cr>
noremap <silent> <leader><C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <up> :resize +5<cr>
nnoremap <silent> <down> :resize -5<cr>
vmap <F5> :source ~/.config/nvim/init.vim<CR>
nmap <F5> :source ~/.config/nvim/init.vim<CR>
nmap <F8> :TagbarToggle<CR>
map <Leader>F :Files<CR>
map <Leader>L :Lines<CR>
map <Leader>ag :Ag<CR> 
map <Leader>bf :Buffers<cr>
map <Leader>s <Plug>(easymotion-s2)

set splitright
function! OpenTerminal()
  " move to rigth most buffer
  execute "normal \<c-l>"
  execute "normal \<c-l>"
  execute "normal \<c-l>"
  execute "normal \<c-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&bufType", "not found")
  
  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    
    execute ":vsp term://bash"
    
    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    "set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
"ejecutar node con el archivo que esta editandose
nnoremap <Leader>x :!node %<cr>

"split resize / redimenciona los paneles tmux "space </> 
" nnorema <Leader>> 10<C-w>>
" noremap <Leader>< 10<C-w><
""faster scrolling
" Desplazar ctrl j/k 10 espacios
" nnoremap <C-j> 10<C-e>
" nnoremap <C-k> 10<C-y>

"tab navigation
" map <Leader>h :tabprevious<cr>
" map <Leader>l :tabnext<cr>

" git
"nnoremap <Leader>G :G<cr>
"nnoremap <Leader>gp :Gpush<cr>
"nnoremap <Leader>gl :Gpull<cr>
"git
" noremap <leader>G :let @*=expand("%")<CR>
" noremap <leader>gp :Gpush<CR>
" noremap <leader>gel :Gpull<CR>

"" Use <c-space> to trigger completion
"if &filetype == 'javascript' || &filetype == 'python'
"	inoremap <c-space> <C-x><C-u>
"else
"	inoremap <silent><expr> <c-space> coc#refresh()
"endif

"""tab
""set tabstop=4
""set softtabstop=4

"""For undofiles, swapfiles, other files
""set undodir=~/.vim/undodir
""set undofile
"""desactivacion archivos swap y backup
""set noswapfile
""set nobackup

" coc

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
" set updatetime=300

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? '\<Tab>' :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
