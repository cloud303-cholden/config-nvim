local M = {}

M.plugins = {
  {
    "folke/twilight.nvim",
  },
  {
    "nvim-treesitter/playground",
  },
  {
    "rcarriga/nvim-notify",
    commit = "30e6b5a710319e354c3e362deb7819cb2135c417",
  },
  {
    "goolord/alpha-nvim",
    commit = "87c204040e3f5d4c1c95067b35905d8f8a2f2545",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "kyazdani42/nvim-web-devicons",
    commit = "a421d183ef37dfa13f51a5805bed2381aebf9080",
    branch = "master",
  },
  {
    "willothy/nvim-cokeline",
    branch = "main",
    -- commit = "709a379",
  },
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
    branch = "master",
    event = "VeryLazy",
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim" },
    branch = "master",
    lazy = true,
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "EdenEast/nightfox.nvim",
    commit = "aa793975d10dda69817190faea84e28eeb176934",
    branch = "main",
    lazy = true,
  },
  {
    "shaunsingh/nord.nvim",
  },
  {
    "AlexvZyl/nordic.nvim",
  },
  {
    "rmehri01/onenord.nvim",
  },
  {
    "kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"},
    commit = "890b94870f052773d77175d07a51f2e083210632",
  },
  {
    "luukvbaal/statuscol.nvim",
  },
  {
    "yamatsum/nvim-nonicons",
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "folke/which-key.nvim",
    commit = "684e96c5e8477f1ee9b3f2e9a12d802fd12c5531",
    branch = "main",
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },
  {
    "nvim-lua/plenary.nvim",
    -- commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    branch = "master",
    lazy = true,
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
    branch = "master",
    event = { "BufReadPost", "BufNewFile" },
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
  },
  -- {
  --   "ms-jpq/chadtree",
  --   commit = "bac02812a4ccb695a02dcc46ed6b33d56b31b147",
  -- },
  {
    "hrsh7th/nvim-cmp",
    -- commit = "",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    -- commit = "",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    -- commit = "",
    event = "InsertEnter",
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = { "L3MON4D3/LuaSnip" },
    event = "InsertEnter",
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
  },
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
    "mfussenegger/nvim-lint",
  },
  {
    "L3MON4D3/LuaSnip",
    -- commit = "",
  },
  {
    "ray-x/go.nvim",
    -- commit = "",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },
  {
    "ray-x/guihua.lua",
    -- commit = "",
    lazy = true,
  },
  {
    "simrat39/rust-tools.nvim",
    -- commit = "",
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "folke/trouble.nvim",
  },
  {
    "windwp/nvim-autopairs",
    commit = "03580d758231956d33c8dd91e2be195106a79fa4",
    event = "InsertEnter",
  },
  {
    "gpanders/editorconfig.nvim",
    commit = "2af880947129f1ab776b732a4eecb92528472ef5",
  },
  {
    "kylechui/nvim-surround",
    commit = "ad56e6234bf42fb7f7e4dccc7752e25abd5ec80e",
  },
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
	  build = "nvim -l build/init.lua",
  },
  {
    "windwp/nvim-ts-autotag",
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
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  local opts = nil

  require("lazy").setup(M.plugins, opts)
end

return M
