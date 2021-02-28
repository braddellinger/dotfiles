" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/brad/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/brad/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/brad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/brad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/brad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["challenger-deep"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/challenger-deep"
  },
  ["forest-night"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/forest-night"
  },
  gruvbox = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/brad/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["palenight.vim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/palenight.vim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/vim-code-dark"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-horizon"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/vim-horizon"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/brad/.local/share/nvim/site/pack/packer/start/vim-startify"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
