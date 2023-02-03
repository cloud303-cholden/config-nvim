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
    dependencies = { "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim" },
    -- commit = "",
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
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
    commit = "7bb563ff2d811a63b207e9de63e3e9c0877cb6d5",
  },
  {
    "saifulapm/chartoggle.nvim",
    -- commit = "",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7",
  },
  {
    "akinsho/toggleterm.nvim",
    tag = "2.3.0",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
    -- commit = "",
  },
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
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
    dependencies = { "L3MON4D3/LuaSnip" },
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
    commit = "d37fc85a4060352bcd4d8cbed0907cba442deb90",
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
    dependencies = { "neovim/nvim-lspconfig" },
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
  {
    "windwp/nvim-autopairs",
    commit = "03580d758231956d33c8dd91e2be195106a79fa4",
  },
  {
    "gpanders/editorconfig.nvim",
    commit = "2af880947129f1ab776b732a4eecb92528472ef5",
  },
  {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    commit = "a7839742dadf90177f3a9ea4747e79f404d10af3",
  },
  {
    "kylechui/nvim-surround",
    commit = "ad56e6234bf42fb7f7e4dccc7752e25abd5ec80e",
  },
}

M.load = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  local opts = nil

  require("lazy").setup(M.plugins, opts)
end

return M
