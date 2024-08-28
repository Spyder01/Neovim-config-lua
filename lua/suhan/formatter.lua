-- Ensure these are required
local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local sources = {}

function go_formatter()
  lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
      -- Set up keybinding for manual formatting
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
      -- Set up auto-format on save using goimports
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  })

  -- Use goimports for formatting
  table.insert(sources, null_ls.builtins.formatting.goimports)
end

function c_formatter()
  lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormatting then
        vim.api.nvim_create_autocmd('BufWritePre', {
          pattern = {'*.c', '*.h'}, -- specify C and header files
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
  })

  table.insert(sources, null_ls.builtins.formatting.clang_format)
end

function lua_formatter()
  lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormatting then
        vim.api.nvim_create_autocmd('BufWritePre', {
          pattern = '*.lua',
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
    settings = {
      Lua = {
        format = {
          enable = true, -- enable Lua formatter
        },
      },
    },
  })

  table.insert(sources, null_ls.builtins.formatting.stylua)
end

null_ls.setup({
  sources = sources,
})

-- Call the formatter functions
go_formatter()
lua_formatter()
c_formatter()

