local meta = require('suhan.meta-config')


function _G.toggle_terminal ()
	local terminal_type = meta.config.defualt_shell
	local terminal_buff = vim.fn.bufnr('term://*')

	if vim.api.nvim_get_mode().mode == 't' then
    vim.cmd('<C-\\><C-n>')
  end

	if not (terminal_buff == -1) then
		vim.cmd('bd! ' .. terminal_buff)
		return
	end

	return vim.cmd('botright split term://' .. terminal_type)
end

-- Get into terminal mode
vim.api.nvim_set_keymap('n', '<leader>t', ':lua toggle_terminal()<CR>', { noremap = true, silent = true })

-- Moves out of terminal normal mode.
vim.api.nvim_set_keymap('t', '<leader>t', ':lua toggle_terminal()<CR>', { noremap = true, silent = true })

-- Moves out of terminal insert mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

