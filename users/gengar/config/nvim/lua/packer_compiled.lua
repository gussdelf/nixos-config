-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gengar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gengar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gengar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gengar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gengar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fluasnip\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15bufferline\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-web-devicons"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-path", "cmp-tmux" },
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-nvim-lsp-signature-help"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-tabnine", "cmp-nvim-lsp-signature-help" },
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/after/plugin/cmp-tabnine.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-tmux"] = {
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rdressing\27plugins.configs.others\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.feline\frequire\0" },
    load_after = {
      ["gruvbox-material"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rgitsigns\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    after = { "feline.nvim", "nvim-web-devicons" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.color\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  harpoon = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fharpoon\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bhop\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0" },
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14signature\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nmarks\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mkdir.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["nabla.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nnabla\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  ["navigator.lua"] = {
    config = { "\27LJ\2\nK\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14navigator\30plugins.configs.lspconfig\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/navigator.lua",
    url = "https://github.com/ray-x/navigator.lua"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fnull_ls\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\ne\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\17show_numbers\2\16number_only\1\20show_cursorline\2\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14autopairs\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14colorizer\27plugins.configs.others\frequire\0" },
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "trouble.nvim", "navigator.lua", "rust-tools.nvim" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "playground", "nvim-ts-rainbow", "nvim-ts-autotag", "hlargs.nvim", "tabout.nvim" },
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    after = { "bufferline.nvim" },
    load_after = {
      ["gruvbox-material"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\trust\30plugins.configs.lspconfig\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\nY\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21ignore_beginning\1\15completion\1\nsetup\vtabout\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    after = { "dressing.nvim" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18todo_comments\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.configs.term\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ftrouble\27plugins.configs.others\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\nb\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\28<cmd>UndotreeToggle<cr>\a,u\6n\bset\vkeymap\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["venn.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tvenn\27plugins.configs.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rfugitive\27plugins.configs.others\frequire\0" },
    loaded = true,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\fzathura\23vimtex_view_method\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gengar/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\21<cmd>ZenMode<cr>\15<leader>tz\6n\bset\vkeymap\bvim\0", "setup", "zen-mode.nvim")
time([[Setup for zen-mode.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14colorizer\27plugins.configs.others\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rfugitive\27plugins.configs.others\frequire\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "lisp" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'nabla.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'vimtex', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptcommon ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "typescriptcommon" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'rust-tools.nvim', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType make ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "make" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'nabla.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'markdown-preview.nvim', 'cmp-nvim-lsp-signature-help'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType julia ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "julia" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'nvim-autopairs', 'hlargs.nvim', 'nvim-treesitter'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'cmp-buffer', 'lsp_signature.nvim', 'navigator.lua', 'cmp_luasnip', 'cmp-path', 'nvim-ts-autotag', 'nvim-autopairs', 'hlargs.nvim', 'nvim-dap-ui', 'nvim-cmp', 'cmp-tabnine', 'friendly-snippets', 'nvim-dap', 'LuaSnip', 'nvim-treesitter', 'cmp-tmux', 'cmp-nvim-lua', 'nvim-lspconfig', 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'null-ls.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim', 'vim-repeat', 'gruvbox-material', 'vim-surround'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'mkdir.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'venn.nvim', 'trouble.nvim', 'undotree', 'null-ls.nvim', 'hop.nvim', 'numb.nvim', 'marks.nvim', 'harpoon', 'gitsigns.nvim', 'todo-comments.nvim', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/navigator.lua/ftdetect/tf.vim]], true)
vim.cmd [[source /home/gengar/.local/share/nvim/site/pack/packer/opt/navigator.lua/ftdetect/tf.vim]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/navigator.lua/ftdetect/tf.vim]], false)
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/LuaSnip/ftdetect/snippets.vim]], true)
vim.cmd [[source /home/gengar/.local/share/nvim/site/pack/packer/opt/LuaSnip/ftdetect/snippets.vim]]
time([[Sourcing ftdetect script at: /home/gengar/.local/share/nvim/site/pack/packer/opt/LuaSnip/ftdetect/snippets.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
