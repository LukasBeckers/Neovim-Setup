-- Configure lsp-zero and nvim-cmp
local lsp = require('lsp-zero')
lsp.preset('recommended')

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright' },
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  window = {
  documentation = cmp.config.window.bordered(),
},
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Configure lspconfig with pyright
local lspconfig = require('lspconfig')
lspconfig.pyright.setup(lsp.nvim_lua_ls())

lsp.setup()
