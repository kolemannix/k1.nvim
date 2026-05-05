return {
  cmd = { 'k1lsp' },
  filetypes = { 'k1' },
  -- root_uri = vim.fn.getcwd(),
  root_markers = { 'main.k1', 'proj.k1', '.git' },
  cmd_env = { RUST_BACKTRACE = "1" },
  reuse_client = function(client, config)
    true
  end
}
