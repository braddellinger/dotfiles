" To use, update ~/.conf/nvim/init.vim
"   - Delete 'status line' & 'tab line' sections
"   - Add the two Plug calls (below)
"   - Add the 'lightline' section (below)

" lightline
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'niklaas/lightline-gitdiff'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:lightline#gitdiff#indicator_modified=' '
let g:lightline#gitdiff#indicator_deleted=' '
let g:lightline#gitdiff#indicator_added=' '
let g:lightline#gitdiff#separator=' '
let g:lightline={
    \ 'colorscheme': 'challenger_deep',
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
    \    'active':   ['filename', 'modified'],
    \    'inactive': ['filename', 'modified'] },
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
