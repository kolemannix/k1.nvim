return {
  cmd = { 'k1lsp' },
  filetypes = { 'k1' },
  -- root_uri = vim.fn.getcwd(),
  root_markers = { 'main.k1', 'module.k1', '.git' },
  cmd_env = { RUST_BACKTRACE = "full" },
  reuse_client = function(client, config)
    return true
  end
}
