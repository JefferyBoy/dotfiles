-- lazy.nvim包管理
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
	"folke/which-key.nvim",
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},
	"folke/neodev.nvim",
	-- telescope显示各种窗口
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs/telescope")
		end,
	},
	-- 格式显示
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs/treesitter")
		end,
	},
	-- 文件侧边栏
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("configs/nvimtree")
		end,
	},
	"numToStr/Comment.nvim",
	-- 快捷注释
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- lsp
	{
		"williamboman/mason.nvim",
		config = function()
			require("configs/mason")
		end,
	},
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs/lspconfig")
		end,
	},
	-- 主题
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("configs/catppuccin")
		end,
	},
	-- 状态栏
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = true,
			insert_at_start = true,
		},
		version = "^1.7.0",
	},
	-- 终端
	{
		"JefferyBoy/nvterm",
		config = function()
			require("configs.nvterm")
		end,
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- 括号引号等成对符号处理
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- 代码提示
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
		module = { "cmp", "cmp_nvim_lsp" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = "friendly-snippets",
		config = function()
			require("configs/cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets", "nvim-cmp" },
		config = function(_, opts)
			if opts then
				require("luasnip").config.setup(opts)
			end
			require("configs/luasnip")
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		dependencies = "LuaSnip",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		dependencies = "cmp_luasnip",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = "cmp-nvim-lua",
	},
	{
		"hrsh7th/cmp-buffer",
		dependencies = "cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-path",
		dependencies = "cmp-buffer",
	},
	-- 变量重命名
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	-- 代码格式化
	{
		"mhartington/formatter.nvim",
		config = function()
			require("configs.formatter")
		end,
	},
	-- 缩进显示、对齐
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("configs.indent_blankline")
		end,
	},
	-- 快速修改成对符号（如引号、括号等）
	{
		"kylechui/nvim-surround",
		version = "main",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- 底部状态栏
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	},
	-- 调试
	{
		"mfussenegger/nvim-dap",
	},
	-- todo显示、查找
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- 消息提示
	{
		"rcarriga/nvim-notify",
	},
	-- 颜色串显示
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- 翻译
	{
		"voldikss/vim-translator",
		config = function()
			vim.g.translator_target_lang = "zh"
			vim.g.translator_source_lang = "auto"
			vim.g.translator_proxy_url = ""
			-- 'bing', 'google', 'haici', 'iciba'(expired), 'sdcv', 'trans', 'youdao'
			vim.g.translator_default_engines = { "bing", "haici" }
		end,
	},
	-- 代码大纲outline
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				-- keymaps = {
				-- 	["<CR>"] = false,
				-- },
			})
		end,
	},
	-- 任务管理
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({
				templates = require("overseer.template.user.tasks"),
			})
		end,
	},
  -- nvim-jdtls
  "mfussenegger/nvim-jdtls",
}

require("lazy").setup(plugins)
require("plugins.fcitx")
require("plugins.gitbox").setup()
require("plugins.searcher").setup()
require("configs.mappings")

-- 设置文件类型检测  
vim.cmd([[  
  au BufRead,BufNewFile *.log set filetype=android_log  
]])
