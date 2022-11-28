local plugins = {
  -- Packer
  { "wbthomason/packer.nvim" },

  --Notifications
  { "rcarriga/nvim-notify" },

  -- Appearance
  { "kyazdani42/nvim-tree.lua" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim" },
  { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },

  -- Keymaps
  { "folke/which-key.nvim" },

  -- Utils
  { "nvim-lua/plenary.nvim" },
  { "numToStr/Comment.nvim" },
  { "saifulapm/chartoggle.nvim" },
  { "akinsho/toggleterm.nvim", tag = "2.3.0" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "ahmedkhalf/project.nvim", requires = { "nvim-telescope/telescope.nvim" } },

  -- CMP
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip", requires = { "L3MON4D3/LuaSnip" } },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0" },

  -- LSP
  -- use { "jose-elias-alvarez/null-ls.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", requires = { "neovim/nvim-lspconfig" } },
  -- use { "jayp0521/mason-null-ls.nvim", after = { "null-ls.nvim", "mason.nvim" }, requires = { "jose-elias-alvarez/null-ls.nvim", "williamboman/mason.nvim" } },
  { "neovim/nvim-lspconfig" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },

  -- Go
  { "ray-x/go.nvim" },
  { "ray-x/guihua.lua" },

  -- Rust
  { "simrat39/rust-tools.nvim" },
}

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
