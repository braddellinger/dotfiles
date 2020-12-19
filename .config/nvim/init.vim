" dependencies
""""""""""""""""""""""""""""""""""""""""""
" vim-plug (https://github.com/junegunn/vim-plug)
" nerdfont (https://www.nerdfonts.com/)
" nodejs (https://nodejs.org/en/)
" rg (https://github.com/BurntSushi/ripgrep)
" ag (https://github.com/ggreer/the_silver_searcher)
" bat (https://github.com/sharkdp/bat)

" plug
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gruvbox-community/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
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
""""""""""""""""""""""""""""""""""""""""""
let g:oceanic_next_terminal_italic=1
let g:oceanic_next_terminal_bold=1
let g:forest_night_enable_italic=1
let g:onedark_terminal_italic=1
let g:onedark_terminal_bold=1
let ayucolor='mirage'
colorscheme OceanicNext
set background=dark
set termguicolors

" general
""""""""""""""""""""""""""""""""""""""""""
autocmd VimLeave * set guicursor=a:hor100
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
set fcs=eob:\ 
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
""""""""""""""""""""""""""""""""""""""""""
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" general keymapping
""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set autoindent
set tabstop=4
set expandtab

" search
""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><Esc> :noh<return>
set inccommand=nosplit
set ignorecase
set incsearch
set hlsearch

" fzf
""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions=[
    \ 'coc-python', 'coc-yaml', 'coc-json',
    \ 'coc-tsserver', 'coc-html', 'coc-css',
    \ 'coc-explorer', 'coc-gocode' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>e :CocCommand explorer<CR> 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" golang
""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd FileType go nmap <leader>t :GoTest<CR>
let g:go_metalinter_autosave_enabled=['vet', 'golint']
let g:go_highlight_variable_declarations=1
let g:go_highlight_variable_assignments=1
let g:go_highlight_build_constraints=1
let g:go_highlight_function_calls=1
let g:go_highlight_generate_tags=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_metalinter_autosave=1
let g:go_fmt_fail_silently=1
let g:go_highlight_types=1

" gitgutter
""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_modified_removed=''
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_added='┃'

" startify
""""""""""""""""""""""""""""""""""""""""""
let g:startify_change_to_vcs_root=0
let g:startify_change_to_dir=0
let g:startify_bookmarks=[
    \ '~/.config/nvim/init.vim',
    \ '~/.zshrc' ]

" status line
""""""""""""""""""""""""""""""""""""""""""
hi StatusLine guibg=none guifg=#ffffff
hi StatusLineNC guibg=none guifg=none
hi StatuslineInactive guibg=gray guifg=#ffffff
hi StatuslineInactiveSeparator guibg=none guifg=gray
function! Statusline(status)
    if a:status == "active"
        setlocal statusline=%{RerenderColors()}
        setlocal statusline+=\ \ 
        setlocal statusline+=%#StatuslinePrimarySeparator#%#StatuslinePrimary#\ %{GetFileName()}%{GetModified()}\ %#StatuslinePrimarySeparator#
        setlocal statusline+=%=
        setlocal statusline+=%#Statusline#%{GetStatus()}
        setlocal statusline+=\ \ \ 
        setlocal statusline+=%#StatuslineSecondarySeparator#%#StatuslineSecondary#\ %{GetPercent()}\ %#StatuslineSecondarySeparator#
        setlocal statusline+=\ \ 
        setlocal statusline+=%#StatuslinePrimarySeparator#%#StatuslinePrimary#\ %l:%c\ %#StatuslinePrimarySeparator#
        setlocal statusline+=\ \ 
    else
        setlocal statusline=\ \ 
        setlocal statusline+=%#StatuslineInactiveSeparator#%#StatuslineInactive#\ %{GetFileName()}%{GetModified()}\ %#StatuslineInactiveSeparator#
    endif
endfunction
function! RerenderColors()
    if mode() == 'n' || mode() == 'c'
        hi StatuslinePrimary guibg=green guifg=#ffffff
        hi StatuslinePrimarySeparator guibg=none guifg=green
        hi StatuslineSecondary guibg=lightgreen guifg=#ffffff
        hi StatuslineSecondarySeparator guibg=none guifg=lightgreen
    elseif mode() == 'v' || mode() == 'V' || mode() == ''
        hi StatuslinePrimary guibg=blue guifg=#ffffff
        hi StatuslinePrimarySeparator guibg=none guifg=blue
        hi StatuslineSecondary guibg=lightblue guifg=#ffffff
        hi StatuslineSecondarySeparator guibg=none guifg=lightblue
    elseif mode() == 'i'
        hi StatuslinePrimary guibg=red guifg=#ffffff
        hi StatuslinePrimarySeparator guibg=none guifg=red
        hi StatuslineSecondary guibg=lightred guifg=#ffffff
        hi StatuslineSecondarySeparator guibg=none guifg=lightred
    elseif mode() == 'R' || mode() == 'Rv'
        hi StatuslinePrimary guibg=yellow guifg=#000000
        hi StatuslinePrimarySeparator guibg=none guifg=yellow
        hi StatuslineSecondary guibg=lightyellow guifg=#000000
        hi StatuslineSecondarySeparator guibg=none guifg=lightyellow
    endif
    return ''
endfunction
function! GetFileName()
    return WebDevIconsGetFileTypeSymbol() . ' ' . (expand('%:t') !=# '' ?  expand('%:t') : '[Untitled]')
endfunction
function GetModified()
    return &modified ? '  ' : ''
endfunction
function! GetPercent()
    return &filetype !=? 'coc-explorer' ? line('.') * 100 / line('$') . '%' : ''
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
set laststatus=2
call Statusline("active")
autocmd WinEnter,BufEnter * call Statusline("active")
autocmd WinLeave * call Statusline("inactive")

" tab line
""""""""""""""""""""""""""""""""""""""""""
hi TablineActive guibg=green guifg=none
hi TablineActiveSeparator guibg=none guifg=green
hi TablineInactive guibg=gray guifg=#ffffff
hi TablineInactiveSeparator guibg=none guifg=gray
function! Tabline()
    let line = '%#StatusLineNC#  '
    let tabcount = tabpagenr('$')
    for i in range(tabcount)
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")
        
        let line .= '%' . tab . 'T'
        let line .= (tab == tabpagenr() ? '%#TablineActiveSeparator#%#TablineActive# ' : '%#TablineInactiveSeparator#%#TablineInactive# ')
        let line .= WebDevIconsGetFileTypeSymbol(bufname(bufnr)) . ' ' . (bufname != '' ? fnamemodify(bufname, ':t') : '[Untitled]')
        let line .= (bufmodified ? '  ' : '')
        let line .= (tab == tabpagenr() ? ' %#TablineActiveSeparator#' : ' %#TablineInactiveSeparator#')
        let line .= ( tab == tabcount ? '' : '  ')
    endfor
    return line
endfunction
set tabline=%!Tabline()
