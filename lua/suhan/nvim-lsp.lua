local lsp_config = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language-specific LSP definitions
function go_lsp()
    lsp_config.gopls.setup{
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = {"go", "gomod"},
        root_dir = lsp_config.util.root_pattern("go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,  -- Enable unused parameter analysis
                },
                staticcheck = true,  -- Enable staticcheck integration
            },
        },
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            -- Go to definition
            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

function odin_lsp()
	lsp_config.ols.setup {
	-- cmd = {
	-- 	  "ols",
	-- 	},
  filetypes = { "odin" },
  root_dir = lsp_config.util.root_pattern("odin.project"),
  settings = {},
}
end

function lua_lsp()
    lsp_config.lua_ls.setup{
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            -- Go to definition
            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

function c_lsp()
    lsp_config.clangd.setup{
        capabilities = capabilities,
        cmd = { "clangd", "--compile-commands-dir=." },
        -- filetypes = { "c", "h" },
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap=true, silent=true }

            -- Go to definition
            buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        end,
    }
end

function rust_lsp ()
	lsp_config.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    -- Key mappings, etc.
  end,
  settings = {},
})
end

-- Call LSP setups
odin_lsp()
go_lsp()
lua_lsp()
c_lsp()
rust_lsp()

