return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "nvimtools/none-ls.nvim",
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Source
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "saadparwaiz1/cmp_luasnip",
  "tamago324/cmp-zsh",

  "L3MON4D3/LuaSnip",
  "onsails/lspkind-nvim",

  "mattn/emmet-vim",

  "simrat39/rust-tools.nvim",

  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "mfussenegger/nvim-dap-python",
  "nvim-telescope/telescope-dap.nvim",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  "numToStr/FTerm.nvim",

  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  --colorschemes
  "shaunsingh/solarized.nvim",
  "matsuuu/pinkmare",
  "ful1e5/onedark.nvim",
  "folke/tokyonight.nvim",
  "rockerBOO/boo-colorscheme-nvim",
  "torcor-dev/purple_winter",
  "shaunsingh/nord.nvim",

  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
  },

  "sam4llis/nvim-tundra",

  { "tpope/vim-dispatch",              cmd = { "Dispatch", "Make" } },

  {
    "rhysd/git-messenger.vim",
    keys = "<Plug>(git-messenger)",
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  "tpope/vim-fugitive",
  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",
  "rhysd/committia.vim",
  "sindrets/diffview.nvim",

  "rktjmp/shipwright.nvim",

  "bfredl/nvim-luadev",
  "chrisbra/Colorizer",

  { "folke/which-key.nvim", dependencies = { "echasnovski/mini.nvim" } },
  "torcor-dev/todoman.nvim",

  -- Go support
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        test_runner = 'go',
        run_in_floaterm = false,
        test_efm = '%f:%l:%c: %m,%-G|| ok%.%#',
        test_timeout = '30s',
        test_env = {},
        test_template = '',
        test_template_dir = '',
        test_flags = {'-v'},
        build_tags = '',
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
}
