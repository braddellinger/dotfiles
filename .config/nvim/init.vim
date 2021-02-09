" dependencies
""""""""""""""""""""""""""""""""""""""""""
" neovim >=0.5 (https://github.com/neovim/neovim)
" nodejs (https://nodejs.org/en/)
" language servers must be installed separately
" vim-plug (https://github.com/junegunn/vim-plug)
" nerdfont (https://www.nerdfonts.com/)
" rg (https://github.com/BurntSushi/ripgrep)

" plug
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/forest-night'
Plug 'onsails/lspkind-nvim'
Plug 'ntk148v/vim-horizon'
Plug 'nvim-lua/popup.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'ayu-theme/ayu-vim'
call plug#end()

" colorscheme
""""""""""""""""""""""""""""""""""""""""""
let g:oceanic_next_terminal_italic=1
let g:oceanic_next_terminal_bold=1
let g:forest_night_enable_italic=1
let g:onedark_terminal_italic=1
let g:onedark_terminal_bold=1
let ayucolor='mirage'
colorscheme challenger_deep
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

" scrollbar
""""""""""""""""""""""""""""""""""""""""""
let g:scrollview_excluded_filetypes=['startify']
let g:scrollview_current_only=1

" tree
""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :NvimTreeToggle<CR>
let g:nvim_tree_side='right'
let g:nvim_tree_bindings={
    \ 'edit':         ['<CR>', 'o'],
    \ 'edit_vsplit':  '<C-v>',
    \ 'edit_split':   '<C-s>',
    \ 'edit_tab':     '<C-t>',
    \ 'close_node':   ['<S-CR>', '<BS>'],
    \ 'refresh':      'R',
    \ 'create':       'c',
    \ 'remove':       'd',
    \ 'rename':       'r',
    \ 'cut':          'x',
    \ 'copy':         'y',
    \ 'paste':        'p',
    \ 'close':        'q' }
let g:nvim_tree_icons={
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': ""
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }

" gitgutter
""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_modified_removed=''
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_added='┃'

" startify
""""""""""""""""""""""""""""""""""""""""""
let g:startify_bookmarks=[ '~/.config/nvim/init.vim', '~/.zshrc' ]
let g:startify_change_to_vcs_root=0
let g:startify_change_to_dir=0

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
    let line='%#StatusLineNC#  '
    let tabcount=tabpagenr('$')
    for i in range(tabcount)
        let tab=i + 1
        let winnr=tabpagewinnr(tab)
        let buflist=tabpagebuflist(tab)
        let bufnr=buflist[winnr - 1]
        let bufname=bufname(bufnr)
        let bufmodified=getbufvar(bufnr, "&mod")
        
        let line.='%' . tab . 'T'
        let line.=(tab == tabpagenr() ? '%#TablineActiveSeparator#%#TablineActive# ' : '%#TablineInactiveSeparator#%#TablineInactive# ')
        let line.=WebDevIconsGetFileTypeSymbol(bufname(bufnr)) . ' ' . (bufname != '' ? fnamemodify(bufname, ':t') : '[Untitled]')
        let line.=(bufmodified ? '  ' : '')
        let line.=(tab == tabpagenr() ? ' %#TablineActiveSeparator#' : ' %#TablineInactiveSeparator#')
        let line.=( tab == tabcount ? '' : '  ')
    endfor
    return line
endfunction
set tabline=%!Tabline()

" treesitter
""""""""""""""""""""""""""""""""""""""""""
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm"
        }
    }
}
EOF

" lsp
""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
EOF

" lsp completion
""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:true
let g:compe.source.treesitter = v:true

lua <<EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  else
    return t "<Tab>"
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" lsp completion icons
""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require('lspkind').init({
  with_text = false,
  symbol_map = {
    Text = '',
    Method = '',
    Function = 'ƒ',
    Constructor = '',
    Variable = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '﬌',
    Color = '',
    File = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = ''
  },
})
EOF


" telescope
""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>d <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').treesitter()<cr>
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = ' ',
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {},
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { 'node_modules', 'vendor', '.git' },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<esc>"] = actions.close,      
        ["<C-v>"] = actions.goto_file_selection_vsplit,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<C-t>"] = goto_file_selection_tabedit,
        ["<CR>"] = actions.goto_file_selection_edit
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-v>"] = actions.goto_file_selection_vsplit,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<C-t>"] = goto_file_selection_tabedit,
        ["<CR>"] = actions.goto_file_selection_edit
      },
    },
  }
}
EOF
