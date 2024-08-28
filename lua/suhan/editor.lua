Editor = {}

-- display functions 
-- Define the function
function Editor.transparent_background()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })            -- For inactive windows
    vim.api.nvim_set_hl(0, 'NonText', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })         -- For floating windows
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })         -- For borders of floating windows
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE' })           -- For vertical splits
    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'NONE' })        -- For window separators
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })      -- For nvim-tree
    vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'NONE' }) -- For the end of buffer in nvim-tree
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })          -- For status line
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })        -- For inactive status line
end

function Editor.match_paren() 
	vim.g.loaded_matchparen = true
end

-- Function to toggle between recently opened files
function ToggleRecentFiles()
  local jumps = vim.fn.getjumplist()[1]
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cur_jump_index = nil

  -- Find the current cursor position in the jump list
  for i = 1, #jumps do
    if jumps[i].lnum == cursor_pos[1] and jumps[i].col == cursor_pos[2] then
      cur_jump_index = i
      break
    end
  end

  -- Toggle to the previous file
  if cur_jump_index and cur_jump_index > 1 then
    vim.api.nvim_win_set_cursor(0, {jumps[cur_jump_index - 1].lnum, jumps[cur_jump_index - 1].col})
  else
    -- If at the beginning, go to the next recent file
    if #jumps > 1 then
      vim.api.nvim_win_set_cursor(0, {jumps[#jumps].lnum, jumps[#jumps].col})
    end
  end
end

-- Map the function to a key, for example, <leader>r
vim.api.nvim_set_keymap('n', '<leader>r', ':lua ToggleRecentFiles()<CR>', { noremap = true, silent = true })



-- Autocomplete function for enclosing characters with optional indentation
function Editor.complete_scope (start, ending, config)

  ending = ending or start
	config = config or {}

  local replacer = start
  local _indent = config.indent or 0
	local new_line = config.new_line or false

	if not (_indent%2 == 0) then  
		_indent = _indent - 1
	end

	if new_line then
		replacer = replacer .. '<CR>'
	end

  if _indent > 0 then
    replacer = replacer .. string.rep(' ', _indent)
  end
	
	if new_line then
		replacer = replacer .. '<Esc>o'
	end
  replacer = replacer .. ending .. '<Left>'
	
	if _indent > 0 then
		replacer = replacer .. string.rep('<Left>', _indent/2) 
	end

	if new_line then 
		replacer = replacer .. '<Esc>k' .. string.rep(' ', _indent) .. '<Esc>a'
	end
	
  vim.api.nvim_set_keymap('i', start, replacer, { noremap = true, silent = true })
end


--appearance
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[highlight Identifier guifg=#ff0000 gui=bold]]
Editor.transparent_background()


vim.opt.relativenumber = true
vim.opt.tabstop =  2
vim.opt.shiftwidth =  2

-- autocomplete

Editor.complete_scope('\"')
Editor.complete_scope('`')
Editor.complete_scope('\'')
Editor.complete_scope('{', '}', { new_line = true, indent = 2 })
Editor.complete_scope('(', ')', { should_repeat = false })
Editor.complete_scope('[', ']')
-- Editor.complete_scope('<', '>')
Editor.match_paren()
Editor.transparent_background()

return Editor

