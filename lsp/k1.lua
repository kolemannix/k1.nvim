return {
  cmd = { 'k1lsp' },
  filetypes = { 'k1' },
  root_markers = { '*.k1' },
  cmd_env = { K1_HOME = k1_home, RUST_BACKTRACE = "1" },
  root_dir = buffer_dir(bufnr),
}
