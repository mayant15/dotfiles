local obsidian = require('obsidian')

local function mark_done()
    obsidian.util.toggle_checkbox()

    local line_num = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, {})
    vim.api.nvim_buf_set_lines(0, -1, -1, false, { line })
end

return {
    mark_done = mark_done
}
