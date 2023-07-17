local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-web-devicons").setup()

      require("nvim-tree").setup {
        hijack_cursor = true,
        view = {
          width = 40
        }
      }
    end
  }  
  use 'Mofiqul/vscode.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'

  use {
      'junegunn/fzf.vim',
      requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }
  
  -- Treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
          require("nvim-treesitter.install").update({ with_sync = true })
      end,
      config = function()
          require("core.plugin_config.treesitter")
      end,
  })
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use({
       "nvim-telescope/telescope.nvim",
       tag = "0.1.1",
       requires = { { "nvim-lua/plenary.nvim" } },
  })
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  
  -- Docstring generator
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
