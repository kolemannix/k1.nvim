## `k1.nvim`

### Install (lazy.nvim)

```lua
{
  dir = "~/dev/k1/tools/nvim",
  name = "k1.nvim",
  ft = "k1",
  config = function()
    require("k1").setup({
      -- Optional:
      -- k1_home = "~/.k1",
      -- lsp_binary = "~/.k1/bin/k1lsp",
      -- auto_start = true,
      -- root_dir defaults to the current buffer's directory
    })
  end,
}
```

### Binary lookup

`k1.nvim` resolves the LSP binary in this order:
1. `setup({ lsp_binary = ... })`
2. `$K1_HOME/bin/k1lsp`
3. `~/.k1/bin/k1lsp` (default when `K1_HOME` is unset)

### Commands

- `:K1LspStart` starts `k1-lsp` for the current buffer
