return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Esc>"] = cmp.mapping.close(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
      },
    }
  end
}
