return {
  filetypes = { 'k1' },
  cmd = { 'k1lsp' },
  cmd_env = { K1_HOME = k1_home, RUST_BACKTRACE = "1" },
  root_dir = buffer_dir(bufnr),
}
