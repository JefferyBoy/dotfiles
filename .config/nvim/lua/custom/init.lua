-------------------按键映射---------------------
local map = require("core.utils").map

vim.opt.number = true            --显示行号
vim.opt.relativenumber = true    --相对行号
vim.opt.encoding = "utf-8"       --文件保存编码
vim.opt.showcmd = true           --最下面显示命令
vim.opt.cursorline = true        --光标行高亮
vim.opt.showmatch = true         --括号跳转
vim.opt.wildmenu = true          --命令补全
vim.opt.foldenable = true        --代码折叠
vim.opt.foldmethod = "indent"    --代码按缩进策略折叠
vim.opt.foldlevel = 100          --代码折叠层级最高

-- 保存退出
map('n', '<S-q>', ':q<CR>')
map('n', '<C-w>', ':q<CR>')
map('n', '<S-w>', ':w<CR>')

-- 快速分屏
map('n', 'sl', ':set splitright<CR>:vsplit<CR>')
map('n', 'sh', ':set nosplitright<CR>:vsplit<CR>')
map('n', 'sj', ':set splitright<CR>:split<CR>')
map('n', 'sk', ':set nosplitright<CR>:split<CR>')

-- 在分屏间移动
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- 改变窗口大小
map('n', '<up>', ':res +5<CR>')
map('n', '<down>', ':res -5<CR>')
map('n', '<left>', ':vertical resize-5<CR>')
map('n', '<right>', ':vertical resize+5<CR>')

-- 文件树
map('n', "<leader>n", ':NvimTreeToggle<CR>')

-- 格式化
map('n', '<leader>fm', ':Autoformat<CR>')

-- 保存时用suda写入
map('n', '<A-s>', ':SudaWrite<CR>')

-- Y复制到系统剪切板
map('v', 'Y', [["+y]])

-- 一键编译/运行/编译运行
map('n', '<F8>', ':w<CR> | :AsyncTask file-build<CR>')
map('n', '<F9>', ':w<CR> | :AsyncTask file-run<CR>')
map('n', '<F10>', ':w<CR> | :AsyncTask file-build<CR> | :AsyncTask file-run<CR>')

-- 开启/关闭函数列表
map('n', '<A-f>', ':Vista<CR>')

-- 创建表格
map('n', '<leader>tm', ':TableModeToggle<CR>')

-- markdown预览
map('n', '<A-r>', ':MarkdownPreviewToggle<CR>')

-- 用H和L代替^和$
map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')

-- 自动切换输入法(fcitx)
-- 退出到普通模式时自动切换为英文输入
-- vim.g.FcitxToggleInput = function()
--     local input_status = tonumber(vim.fn.system("fcitx-remote"))
--     if input_status == 2 then
--         vim.fn.system("fcitx-remote -c")
--     end
-- end
-- vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")

-------------------按键映射---------------------

-------------------杂项配置---------------------
-- 设置屏幕中间竖条
-- vim.o.colorcolumn = "130"

-- 禁用多光标警告
vim.g.VM_show_warnings = 0

-- 设置asynctasks窗口排版
vim.g.asynctasks_term_pos = 'bottom'
vim.g.asynctasks_term_rows = 15

-- vim-table-mode更改为markdown语法
vim.g.table_mode_corner='|'

-- 自动切换输入法配置
vim.o.ttimeoutlen=0
-------------------杂项配置---------------------
