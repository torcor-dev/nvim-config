return {
	{ "nvim-treesitter/nvim-treesitter", lazy = false, branch = "main", build = ":TSUpdate" },
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

	{ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } },

	{
		"rhysd/git-messenger.vim",
		keys = "<Plug>(git-messenger)",
	},

	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"echasnovski/mini.pick",
			"folke/snacks.nvim",
		},
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
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			{
				"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
				branch = "main", -- NOTE; not the master branch!
				build = function()
					vim.cmd(":TSUpdate go")
				end,
			},
			{
				"fredrikaverpil/neotest-golang",
				version = "*", -- Optional, but recommended; track releases
				build = function()
					vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
				end,
			},
		},
		config = function()
			local config = {
				runner = "gotestsum", -- Optional, but recommended
			}
			require("neotest").setup({
				adapters = {
					require("neotest-golang")(config),
				},
			})
		end,
	},
}
