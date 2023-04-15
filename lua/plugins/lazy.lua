local M = {}

M.plugins = {
  {
    "rcarriga/nvim-notify",
    commit = "30e6b5a710319e354c3e362deb7819cb2135c417",
  },
  {
    "kyazdani42/nvim-tree.lua",
    commit = "215b29bfad74518442621b9d0483a621483b066b",
    branch = "master",
  },
  {
    "kyazdani42/nvim-web-devicons",
    commit = "a421d183ef37dfa13f51a5805bed2381aebf9080",
    branch = "master",
  },
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
    branch = "master",
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim" },
    commit = "11e08391eeed00effa85ca24ff9d1e0472cbcd6a",
    branch = "master",
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    commit = "aa793975d10dda69817190faea84e28eeb176934",
    branch = "main",
  },
  {
    "folke/which-key.nvim",
    commit = "684e96c5e8477f1ee9b3f2e9a12d802fd12c5531",
    branch = "main",
  },
  {
    "nvim-lua/plenary.nvim",
    commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    branch = "master",
  },
  {
    "numToStr/Comment.nvim",
    commit = "7bb563ff2d811a63b207e9de63e3e9c0877cb6d5",
    branch = "master",
  },
  {
    "saifulapm/chartoggle.nvim",
    commit = "e96641c7ee7972033f832b7f4af78d9ed04b130f",
    branch = "main",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7",
    branch = "master",
  },
  {
    "akinsho/toggleterm.nvim",
    commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
    branch = "main",
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
