local M = {}

-- 获取所有全局marks(A-Z)
local function marks_get_all()
	local marks = {}
	for i = 0, 25 do
		local mark = string.char(65 + i) -- A-Z
		local pos = vim.api.nvim_get_mark(mark, {})
		if pos[1] ~= 0 or pos[2] ~= 0 then
			table.insert(marks, { mark = mark, line = pos[1], col = pos[2] })
		end
	end
	return marks
end

local marks_save_file = function(filepath)
end

local marks_restore_file = function(filepath)
end

M.marks_toggle_bar = function()

end

M.marks_show_save_file = function()

end

M.marks_list_restore_file = function()

end

M.setup = function()
	local mark = vim.api.nvim_get_mark(string.char(65), {})
  print(string.format("Mark A: line %d, column %d, file %s", mark[1], mark[2], mark[4]))
end

return M
