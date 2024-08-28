local lsp_config = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- JavaScript/TypeScript LSP
function ts_lsp()
    lsp_config.tsserver.setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

-- React LSP (using tsserver for JSX/TSX support)
function react_lsp()
    lsp_config.tsserver.setup{
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

-- Svelte LSP
function svelte_lsp()
    lsp_config.svelte.setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

-- Call LSP setups
ts_lsp()
react_lsp()
svelte_lsp()

