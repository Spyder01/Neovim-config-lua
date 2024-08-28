vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
