local helpers = {  }

function helpers.get_previous_character()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local line = vim.api.nvim_get_current_line()

  if col == 0 then
    return nil
  end

  local prev_char = line:sub(col, col)

  return prev_char
end

return helpers

