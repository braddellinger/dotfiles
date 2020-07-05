" dependencies
""""""""""""""""""""""""""""""
" plugin manager
"   - vim-plug (https://github.com/junegunn/vim-plug)
" fonts & glyphs
"   - nerdfont (https://www.nerdfonts.com/)
" coc language server protocol
"   - nodejs (https://nodejs.org/en/)
"   - gopls for golang support (https://github.com/golang/go/wiki/gopls)
"   - extensions (https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) 
"       - coc-python (https://github.com/neoclide/coc-python)
"       - coc-yaml (https://github.com/neoclide/coc-yaml)
"       - coc-json (https://github.com/neoclide/coc-json)
"       - coc-tsserver (https://github.com/neoclide/coc-tsserver)
"       - coc-html (https://github.com/neoclide/coc-html)
"       - coc-css (https://github.com/neoclide/coc-css)
"       - coc-explorer (https://github.com/weirongxu/coc-explorer)
" fzf.nvim
"   - rg (https://github.com/BurntSushi/ripgrep)
"   - ag (https://github.com/ggreer/the_silver_searcher)
"   - bat (https://github.com/sharkdp/bat)

" plug
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gruvbox-community/gruvbox'
Plug 'niklaas/lightline-gitdiff'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/forest-night'
Plug 'ntk148v/vim-horizon'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf.vim'
call plug#end()

" colorscheme
""""""""""""""""""""""""""""""
let g:oceanic_next_terminal_italic=1
let g:oceanic_next_terminal_bold=1
let g:forest_night_enable_italic=1
let g:onedark_terminal_italic=1
let g:onedark_terminal_bold=1
let ayucolor='mirage'
colorscheme onedark
set background=dark
set termguicolors

" general
""""""""""""""""""""""""""""""
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd WinLeave * set nocul
autocmd WinEnter * set cul
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//
set number relativenumber
set clipboard=unnamedplus
set foldmethod=syntax
set signcolumn=yes
set updatetime=300
set nowritebackup
set foldlevel=99
set statusline=2
set laststatus=2
set scrolloff=3
set splitright
set path+=**
set nobackup
set wildmenu
set showmode
set showcmd
set mouse=a
set number
set nowrap
syntax on

" hybrid line numbers
""""""""""""""""""""""""""""""
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" general keymapping
""""""""""""""""""""""""""""""
let mapleader=' '
nnoremap <silent> <Leader>j :%!python -m json.tool<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-l> >>
nnoremap <A-h> <<
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <ESC>:m .-2<CR>==gi
inoremap <A-l> <Esc>>>gi
inoremap <A-h> <Esc><<gi
inoremap jj <Esc>
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-l> >gv
vnoremap <A-h> <gv
vnoremap > >gv
vnoremap < <gv
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" indentation
""""""""""""""""""""""""""""""
set shiftwidth=4
set autoindent
set tabstop=4
set expandtab

" search
""""""""""""""""""""""""""""""
set ignorecase
set incsearch
set hlsearch

" lightline
""""""""""""""""""""""""""""""
let g:lightline#gitdiff#indicator_modified=' '
let g:lightline#gitdiff#indicator_deleted=' '
let g:lightline#gitdiff#indicator_added=' '
let g:lightline#gitdiff#separator=' '
let g:lightline={
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \    'left':  [['filename'], ['mode', 'paste']],
    \    'right': [['lineinfo'], ['percent'], ['gitdiff'], ['status']] },
    \ 'inactive': {
    \    'left':  [['filename']],
    \    'right': [] },
    \ 'separator': {
    \    'left':  '',
    \    'right': '' },
    \ 'component_function': {
    \    'gitbranch': 'GetGitBranch',
    \    'filename':  'GetFileName',
    \    'lineinfo':  'GetLineInfo',
    \    'percent':   'GetPercent',
    \    'status':    'GetStatus' },
    \ 'component_expand': {
    \    'gitdiff': 'lightline#gitdiff#get' },
    \ 'tab': {
    \    'active':   ['tabnum', 'filename', 'modified'],
    \    'inactive': ['tabnum', 'filename', 'modified'] },
    \ 'tabline' : {
    \    'left':  [['tabs']],
    \    'right': [] },
    \ 'tabline_separator': {
    \    'left':  '',
    \    'right': '' },
    \ 'tab_component_function': {
    \    'filename': 'GetTabFileName',
    \    'modified': 'GetTabModified',
    \    'tabnum':   'GetTabNumber' } }
function! GetGitBranch()
    return ' ' . fugitive#head()
endfunction
function! GetFileName()
    let filename = expand('%:t') !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[Untitled]'
    let modified = &modified ? ' ' : ''
    return filename . modified
endfunction
function! GetPercent()
    return &filetype !=? 'coc-explorer' ? line('.') * 100 / line('$') . '%' : ''
endfunction
function! GetLineInfo()
    return &filetype !=? 'coc-explorer' ? printf('%3d:%-2d', line('.'), col('.')) : 'ﳨ'
endfunction
function! GetStatus()
    if &filetype !=? 'coc-explorer'
        let info = get(b:, 'coc_diagnostic_info', {})
        if get(info, 'error', 0)
            return 'ﴫ'
        elseif get(info, 'warning', 0)
            return ''
        endif
        return '' 
    endif
    return ''
endfunction
function! GetTabFileName(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':t')
  return _ !=# '' ? _ : '[Untitled]'
endfunction
function! GetTabModified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? ' ' : ''
endfunction
function! GetTabNumber(n) abort
  return a:n
endfunction

" fzf
""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>r :Rg<CR>
let g:fzf_layout={ 'window': { 'width': 0.6, 'height': 0.4, 'border': 'rounded' } }
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:fzf_colors={
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'header':  ['fg', 'Comment'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'spinner': ['fg', 'Label'] }
let g:fzf_action={
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--layout=reverse', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({ 'options': ['--layout=reverse'] }), <bang>0)
command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({ 'options': ['--layout=reverse'] }), <bang>0)
command! -bang -nargs=? -complete=dir Lines
    \ call fzf#vim#lines(<q-args>, fzf#vim#with_preview({ 'options': ['--layout=reverse'] }), <bang>0)
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({ 'options': ['--layout=reverse'] }), <bang>0)

" coc
""""""""""""""""""""""""""""""
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>e :CocCommand explorer<CR> 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" gitgutter
""""""""""""""""""""""""""""""
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_modified_removed=''
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_added='┃'

" startify
""""""""""""""""""""""""""""""
let g:startify_change_to_vcs_root=0
let g:startify_change_to_dir=0
let g:startify_bookmarks=[
    \ '~/.config/nvim/init.vim',
    \ '~/.config/nvim/coc-settings.json',
    \ '~/.zshrc',
    \ '~/.tmux.conf' ]
