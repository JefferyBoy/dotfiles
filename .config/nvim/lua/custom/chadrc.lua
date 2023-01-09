-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

M.options.user = function ()
  vim.opt.relativenumber = true
  vim.opt.cursorcolumn = true
end

return M
