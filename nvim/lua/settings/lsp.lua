require("mason").setup()

require("neoconf").setup({
  -- override any of the default settings here
})

-- 1. LSP Sever management
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "volar" },
}

require('mason-lspconfig').setup_handlers({
  function(server)
    if require("neoconf").get(server .. ".disable") then
      return
    end
    local opt = {
      -- -- Function executed when the LSP server startup
      -- on_attach = function(client, bufnr)
      --   local opts = { noremap=true, silent=true }
      --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
      -- end,
      capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
      )
    }
    -- each servers
    if server == "volar" then
      opt.filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
    end
    if server == "lua_ls" then
      opt.settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      }
    end
    require('lspconfig')[server].setup(opt)
  end
})

-- 2. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

