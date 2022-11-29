local M = {}

M.plugins = {
  {
    "wbthomason/packer.nvim",
    commit = "04e45a888ff9a20fa15c1756c3a78ea50990ec17",
  },
  {
    "rcarriga/nvim-notify",
    commit = "30e6b5a710319e354c3e362deb7819cb2135c417",
  },
  {
    "kyazdani42/nvim-tree.lua",
    -- commit = "",
  },
  {
    "kyazdani42/nvim-web-devicons",
    -- commit = "",
  },
  {
    "nvim-lualine/lualine.nvim",
    -- commit = "",
  },
  {
    "SmiteshP/nvim-navic",
    requires = { "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim" },
    -- commit = "",
  },
  {
    "EdenEast/nightfox.nvim",
    -- commit = "",
  },
  {
    "folke/which-key.nvim",
    -- commit = "",
  },
  {
    "nvim-lua/plenary.nvim",
    -- commit = "",
  },
  {
    "numToStr/Comment.nvim",
    -- commit = "",
  },
  {
    "saifulapm/chartoggle.nvim",
    -- commit = "",
  },
  {
    "akinsho/toggleterm.nvim",
    tag = "2.3.0",
  },
  {
    "nvim-telescope/telescope.nvim",
    -- commit = "",
  },
  {
    "ahmedkhalf/project.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    -- commit = "",
  },
  {
    "hrsh7th/nvim-cmp",
    -- commit = "",
  },
  {
    "hrsh7th/cmp-buffer",
    -- commit = "",
  },
  {
    "hrsh7th/cmp-path",
    -- commit = "",
  },
  {
    "saadparwaiz1/cmp_luasnip",
    requires = { "L3MON4D3/LuaSnip" },
    -- commit = "",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    -- commit = "",
  },
  {
    "hrsh7th/cmp-nvim-lua",
    -- commit = "",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   commit = "",
  -- },
  {
    "williamboman/mason.nvim",
    -- commit = "",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    requires = { "neovim/nvim-lspconfig" },
    -- commit = "",
  },
  -- {
  --   "jayp0521/mason-null-ls.nvim",
  --   after = { "null-ls.nvim", "mason.nvim" },
  --   requires = { "jose-elias-alvarez/null-ls.nvim", "williamboman/mason.nvim" },
  --   commit = "",
  -- },
  {
    "neovim/nvim-lspconfig",
    -- commit = "",
  },
  {
    "L3MON4D3/LuaSnip",
    -- commit = "",
  },
  {
    "ray-x/go.nvim",
    -- commit = "",
  },
  {
    "ray-x/guihua.lua",
    -- commit = "",
  },
  {
    "simrat39/rust-tools.nvim",
    -- commit = "",
  },
}

M.load = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd("packadd packer.nvim")
  end
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost packer_plugins.lua source <afile> | PackerSync
    augroup end
  ]])

  local ok, packer = pcall(require, "packer")
  if not ok then
    return
  end

  packer.init({
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  })

  return packer.startup(function(use)
    for _, plugin in ipairs(M.plugins) do
      use(plugin)
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      packer.sync()
    end
  end)
end

return M.load()
