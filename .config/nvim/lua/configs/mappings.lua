local map = vim.keymap.set
local ops = { noremap = true, silent = true }
-- 窗口调整
map("n", "<C-up>", "<cmd>resize +5<CR>", ops)
map("n", "<C-down>", "<cmd>resize -5<CR>", ops)
map("n", "<C-left>", "<cmd>vertical resize -5<CR>", ops)
map("n", "<C-right>", "<cmd>vertical resize +5<CR>", ops)
--保存退出
map("n", "W", "<cmd>w<CR>", ops)
map("n", "Q", "<cmd>q<CR>", ops)
--键0回到行首非空字符位置
map("n", "0", "^", ops)
--系统剪贴板
map("v", "Y", "\"+y", ops)
--vmap <leader><leader>y "+y
--nnoremap <leader><leader>p "+p
--分屏窗口移动
map("n", "<C-j>", "<C-w>j", ops)
map("n", "<C-k>", "<C-w>k", ops)
map("n", "<C-h>", "<C-w>h", ops)
map("n", "<C-l>", "<C-w>l", ops)
map("n", "<A-v>", "<cmd>vsp<CR>", ops)
map("n", "<A-s>", "<cmd>sp<CR>", ops)
--buffer切换
map("n", "<A-l>", "<cmd>bprevious<CR>", ops)
map("n", "<A-h>", "<cmd>bnext<CR>", ops)
map("n", "<A-w>", "<cmd>bdelete<CR>", ops)
--barbar
map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", ops)
map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", ops)
map("n", "<A-W>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", ops)
map("n", "<C-A-h>", "<Cmd>BufferCloseBuffersLeft<CR>", ops)
map("n", "<C-A-l>", "<Cmd>BufferCloseBuffersRight<CR>", ops)

--行号显示
map("n", "<leader>n", "<cmd>set nu!<CR>", ops)
map("n", "<leader>rn", "<cmd>set rnu!<CR>", ops)
--取消高亮
map("n", "<ESC>", "<cmd>noh<CR>", ops)
--代码折叠
map("n", "<leader>zz", "<cmd>set foldmethod=indent<CR>", ops)
map("n", "<leader>zm", "<cmd>set foldmethod=manual<CR>", ops)
--快速搜索
map("n", "<leader>ss", "<cmd>SearcheInWord false<CR>", ops)
map("n", "<leader>sa", "<cmd>SearcheInWord true<CR>", ops)
map("n", "<leader>sd", "<cmd>UnSearcheInWord<CR>", ops)
map("n", "<leader>sn", "<cmd>SearcheCurrentBufferToNew<CR>", ops)
map("n", "<leader>sN", "<cmd>SearcheAllFilesToNew<CR>", ops)

--telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, ops)
map("n", "<leader>fw", builtin.live_grep, ops)
map("n", "<leader>fb", builtin.buffers, ops)
map("n", "<leader>fh", builtin.help_tags, ops)
map("n", "<leader>m", builtin.marks, ops)
map("n", "<leader>th", "<cmd>Telescope colorscheme<CR>", ops)
map("n", "<f1>", builtin.commands, ops)
map("n", "<f2>", builtin.keymaps, ops)
map("n", "<f12>", builtin.lsp_document_symbols, ops)
map("n", "<C-e>", builtin.oldfiles, ops)

--nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", ops)

--git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", ops)
map("n", "<leader>gd", "<cmd>GitToolFileDiff<CR>", ops)
map("n", "<leader>gl", "<cmd>GitToolFileHistory<CR>", ops)
map("n", "<leader>gb", "<cmd>GitToolFileDiffBranch<CR>", ops)

--lspconfig
local lsp = vim.lsp
map("n", "gD", lsp.buf.declaration, ops)
map("n", "gd", lsp.buf.definition, ops)
map("n", "K", lsp.buf.hover, ops)
map("n", "gi", lsp.buf.implementation, ops)
map("n", "gr", lsp.buf.references, ops)
map("n", "<A-CR>", lsp.buf.code_action, ops)
map("n", "<C-A-7>", lsp.buf.incoming_calls, ops)
map("n", "<leader>ls", lsp.buf.signature_help, ops)
map("n", "<leader>D", lsp.buf.type_definition, ops)
map("n", "<leader>q", vim.diagnostic.setloclist, ops)
map("n", "<leader>f", vim.diagnostic.open_float, ops)
-- map('n', '<leader>fm', lsp.buf.format, ops)
map("n", "<leader>wa", lsp.buf.add_workspace_folder, ops)
map("n", "<leader>wr", lsp.buf.remove_workspace_folder, ops)
map("n", "<leader>wl", function()
	print(vim.inspect(lsp.buf.list_workspace_folders()))
end, ops)

--终端nvterm
local toggle_modes = { "n", "t" }
-- local nvterm = require("nvterm.terminal")
-- map(toggle_modes, '<leader>i', function () nvterm.toggle('float') end, ops)
-- map(toggle_modes, '<leader>v', function () nvterm.toggle('vertical') end, ops)
-- map(toggle_modes, "<leader>hh", function()
-- 	nvterm.toggle("horizontal_1")
-- end, ops)
-- map(toggle_modes, "<leader>h1", function()
-- 	nvterm.toggle("horizontal_1")
-- end, ops)
-- map(toggle_modes, "<leader>h2", function()
-- 	nvterm.toggle("horizontal_2")
-- end, ops)
-- map(toggle_modes, "<leader>h3", function()
-- 	nvterm.toggle("horizontal_3")
-- end, ops)
-- map(toggle_modes, "<leader>h4", function()
-- 	nvterm.toggle("horizontal_4")
-- end, ops)
-- map(toggle_modes, "<leader>h5", function()
-- 	nvterm.toggle("horizontal_5")
-- end, ops)
--终端toogleterm.nvim
map(toggle_modes, "<A-1>", "<Cmd>1ToggleTerm<CR>", ops)
map(toggle_modes, "<A-2>", "<Cmd>2ToggleTerm<CR>", ops)
map(toggle_modes, "<A-3>", "<Cmd>3ToggleTerm<CR>", ops)
map(toggle_modes, "<A-4>", "<Cmd>4ToggleTerm<CR>", ops)
map(toggle_modes, "<A-5>", "<Cmd>5ToggleTerm<CR>", ops)

--renamer
map("n", "<leader>rn", require("plugins.renamer").open, ops)
map("v", "<leader>rn", require("plugins.renamer").open, ops)
-- map('n', '<leader>rn', function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })
-- map('v', '<leader>rn', function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })

--formatter
map("n", "<leader>fm", "<cmd>Format<cr>")

--nvim-dap
local dap = require("dap")
map("n", "<SHIFT-F6>", dap.repl.open, ops)
map("n", "<SHIFT-F7>", dap.step_into, ops)
map("n", "<SHIFT-F7>", dap.step_out, ops)
map("n", "<SHIFT-F8>", dap.step_over, ops)
map("n", "<SHIFT-F8>", dap.continue, ops)
map("n", "<leader>b", dap.toggle_breakpoint, ops)

--todo
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", ops)

--翻译
map("n", "tt", "<cmd>TranslateW<cr>", ops)
map("n", "tr", "<cmd>TranslateR<cr>", ops)

--代码outline
map("n", "{", "<cmd>AerialPrev<CR>", { buffer = 0 })
map("n", "}", "<cmd>AerialNext<CR>", { buffer = 0 })
map("n", "<C-m>", "<cmd>AerialToggle! right<CR>")
map("n", "<CR>", "<cmd>AerialNext<CR>", { buffer = 0 })
vim.keymap.del('n', "<CR>")

-- 任务管理obverseer
map("n", "<F8>", "<CMD>OverseerToggle<CR>")
map("n", "<F7>", "<CMD>OverseerRun<CR>")
map("n", "<F6>", "<CMD>OverseerRunCmd<CR>")

-- nvim-jdtls
map("n", "<C-A-o>", require("jdtls").organize_imports)
