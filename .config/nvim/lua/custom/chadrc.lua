-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

M.general  = {
  v = {
    -- TODO 复制到剪贴板有问题
    ["Y"] = { ""*y", "copy to clipboard" },
    ["P"] = { ""*p", "paste form clipboard" },
  }
}

return M
