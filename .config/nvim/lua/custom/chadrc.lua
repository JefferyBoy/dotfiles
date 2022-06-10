local M = {}

M.options = {
   nvChad = {
      -- updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}
M.ui = {
   hl_override = {},
   changed_themes = {},
   colors = "", -- path of your file that contains colors
   theme = "onedark", -- default theme
   transparency = false,
}

local userPlugins = require "custom.plugins"

M.plugins = {
   override = {},
   remove = {},
   install = userPlugins,
   -- 启用插件
   status = {
     blankline = true,
     bufferline = true,
     colorizer = false,
     comment = true,
     alpha = true,
     better_escape = true,
     feline = true,
     gitsigns = true,
     lspsignature = true,
     vim_matchup = true,
     cmp = true,
     nvimtree = true,
     autopairs = true,
   },
   options = {
      packer = {
         init_file = "plugins.packerInit",
         snapshot = nil,
      },
      autopairs = {
        loadAfter = "nvim-cmp",
      },
      cmp = {
        lazy_load = true,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of lspconfig file
      },
      nvimtree = {
        lazy_load = true,
      },
      luasnip = {
        snippet_path = {},
      },
      statusline = {
        separator_style = "default", -- default/round/slant/block/arrow
      },
   },
  default_plugin_config_replace = {
     dashboard = "custom.plugins.dashboard",
  },
  default_plugin_remove = {},
   -- add, modify, remove plugins
  user = {},
}

-- non plugin only
M.mappings = {
   misc = function() end,
}

return M
