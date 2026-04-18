## `k1.nvim`

### Install (lazy.nvim)

```lua
{
  "kolemannix/k1.nvim",
  ft = "k1",
  config = function()
    require("k1").setup({
      -- Optional:
      -- k1_home = "~/.k1",
      -- lsp_binary = "~/.k1/bin/k1lsp",
      -- auto_start = true,
      -- on_attach = on_attach,
      -- capabilities = capabilities,
      -- root_dir = function(filename) return vim.fs.dirname(filename) end,
      -- root_dir defaults to the current buffer's directory
    })
  end,
}
```

### lspconfig integration (`lua/lsp/k1.lua`)

If you keep one file per server, disable `auto_start` and let `lspconfig` own startup:

```lua
-- lua/lsp/k1.lua
return function(on_attach, capabilities)
  local k1 = require("k1")

  k1.setup({
    auto_start = false,
    on_attach = on_attach,
    capabilities = capabilities,
  })

  k1.lspconfig_setup()
end
```

Then from your LSP bootstrap:

```lua
require("lsp.k1")(on_attach, capabilities)
```

### Binary lookup

`k1.nvim` resolves the LSP binary in this order:
1. `setup({ lsp_binary = ... })`
2. `$K1_HOME/bin/k1lsp`
3. `~/.k1/bin/k1lsp` (default when `K1_HOME` is unset)

### Commands

- `:K1LspStart` starts `k1-lsp` for the current buffer
