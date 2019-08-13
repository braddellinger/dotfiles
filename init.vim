" dependencies
""""""""""""""""""""""""""""""
" plugin installation
"   - vim-plug (https://github.com/junegunn/vim-plug)
" fonts & glyphs
"   - nerdfont (https://www.nerdfonts.com/)
" coc.nvim
"   - neovim (https://neovim.io/)
"   - nodejs (https://nodejs.org/en/)
"   - extensions (https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) 
" fzf.nvim
"   - ag (https://github.com/ggreer/the_silver_searcher)

" plug
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'NLKNguyen/papercolor-theme'
Plug 'niklaas/lightline-gitdiff'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'ntk148v/vim-horizon'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
call plug#end()

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
    \    'gitbranch': 'DisplayGitBranch',
    \    'filename':  'DisplayFileName',
    \    'lineinfo':  'DisplayLineInfo',
    \    'percent':   'DisplayPercent',
    \    'status':    'DisplayStatus' },
    \ 'component_expand': {
    \    'gitdiff': 'lightline#gitdiff#get' },
    \ 'tab': {
    \    'active':   ['tabnum', 'filename'],
    \    'inactive': ['tabnum', 'filename'] },
    \ 'tabline' : {
    \    'left':  [["ﳨ", 'tabs']],
    \    'right': [] },
    \ 'tabline_separator': {
    \    'left':  '',
    \    'right': '' },
    \ 'tab_component_function': {
    \    'filename': 'lightline#tab#filename',
    \    'modified': 'lightline#tab#modified',
    \    'tabnum':   'lightline#tab#tabnum' } }
function! DisplayGitBranch()
    return ' ' . fugitive#head()
endfunction
function! DisplayFileName()
    let filename = expand('%:t') !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[Untitled]'
    let modified = &modified ? ' ' : ''
    return filename . modified
endfunction
function! DisplayPercent()
    return &filetype !=? 'nerdtree' ? line('.') * 100 / line('$') . '%' : ''
endfunction
function! DisplayLineInfo()
    return &filetype !=? 'nerdtree' ? printf('%3d:%-2d', line('.'), col('.')) : 'ﳨ'
endfunction
function! DisplayStatus()
    if &filetype !=? 'nerdtree'
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

" nerdtree
""""""""""""""""""""""""""""""
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDDTreeWinSize=30
let g:NERDTreeWinPos='right'
let g:NERDTreeDirArrowCollapsible=' '
let g:NERDTreeDirArrowExpandable=' '
let g:NERDTreeIndicatorMapCustom={
    \ 'Untracked': '~ ',
    \ 'Modified':  '* ',
    \ 'Unmerged':  '= ',
    \ 'Renamed':   '> ',
    \ 'Deleted':   'X ',
    \ 'Ignored':   'i ',
    \ 'Unknown':   '? ',
    \ 'Staged':    '+ ',
    \ 'Dirty':     'x ',
    \ 'Clean':     ' ' }
highlight! link NERDTreeFlags NERDTreeDir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd VimEnter * wincmd p
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif    
endfunction
autocmd BufEnter * call SyncTree()

" fzf
""""""""""""""""""""""""""""""
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:fzf_layout={ 'down': '~30%' }
let g:fzf_action={
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
let g:fzf_colors={
    \ 'spinner': ['fg', 'Label'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'header':  ['fg', 'Comment'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'] }
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" devicons
""""""""""""""""""""""""""""""
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:DevIconsEnableFoldersOpenClose=1
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" gitgutter
""""""""""""""""""""""""""""""
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_added='┃'

" ayu
""""""""""""""""""""""""""""""
let ayucolor='mirage' " mirage, light, dark

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

" keymapping
""""""""""""""""""""""""""""""
map <F2> :%!python -m json.tool<CR>
map <F1> :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap <C-b> :buffers<CR>:buffer<Space>
inoremap jj <Esc>

" general
""""""""""""""""""""""""""""""
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd WinLeave * set nocul
autocmd WinEnter * set cul
colorscheme ayu
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//
set background=dark
set termguicolors
set statusline=2
set laststatus=2
set scrolloff=3
set splitright
set path+=**
set wildmenu
set showmode
set showcmd
set number
set nowrap
syntax on

