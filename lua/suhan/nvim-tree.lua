-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

function treeOpen()
vim.keymap.set('n', '<leader>ex', function()
		local view = require'nvim-tree.view'
		if view.is_visible() and view.get_winnr() == vim.api.nvim_get_current_win() then
			-- If you're in the nvim-tree window, close it
			vim.cmd('NvimTreeClose')
		elseif view.is_visible() then
			-- If nvim-tree is visible but you're in another window, find the current file
			vim.cmd('NvimTreeFindFile')
		else
			-- If nvim-tree is not visible, toggle it
			vim.cmd('NvimTreeToggle')
		end
	end, { noremap = true, silent = true })
end


treeOpen()

-- vim.keymap.set('n', '<leader>ex', ':NvimTreeToggle<CR>')
-- vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Ensure that transparency is set for floating windows
vim.cmd('hi NormalFloat guibg=NONE')

require("nvim-tree").setup({
	disable_netrw = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,  -- Set the width of the panel
    side = 'left',  -- Position the panel on the left
    float = {
      enable = false,  -- Disable floating to keep the panel fixed on the side
    },
  },
  filters = {
    -- dotfiles = true,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  }
})

