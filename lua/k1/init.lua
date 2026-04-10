local M = {}
local uv = vim.uv or vim.loop

local defaults = {
  auto_start = true,
  k1_home = nil,
  lsp_binary = nil,
}

M.options = defaults

local function normalize(path)
  local expanded = vim.fn.expand(path)
  local absolute = vim.fn.fnamemodify(expanded, ":p")
  return absolute:gsub("/$", "")
end

local function opts()
  return M.options or defaults
end

local function resolve_k1_home(o)
  return normalize(o.k1_home or vim.env.K1_HOME or "~/.k1")
end

local function resolve_lsp_binary(o, k1_home)
  if o.lsp_binary and o.lsp_binary ~= "" then
    return normalize(o.lsp_binary)
  end
  return normalize(k1_home .. "/bin/k1lsp")
end

local function buffer_dir(bufnr)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local filename = vim.api.nvim_buf_get_name(bufnr)
  if filename == "" then
    return uv.cwd()
  end
  return vim.fs.dirname(filename)
end

function M.setup(user_opts)
  M.options = vim.tbl_extend("force", defaults, user_opts or {})
end

function M.start(bufnr)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local o = opts()
  local k1_home = resolve_k1_home(o)
  local lsp_binary = resolve_lsp_binary(o, k1_home)

  if vim.fn.executable(lsp_binary) ~= 1 then
    vim.notify(
      ("k1.nvim: k1lsp not found/executable at '%s' (K1_HOME='%s')"):format(lsp_binary, k1_home),
      vim.log.levels.ERROR
    )
    return nil
  end

  return vim.lsp.start({
    name = "k1-lsp",
    cmd = { lsp_binary },
    cmd_env = { K1_HOME = k1_home, RUST_BACKTRACE = "1" },
    root_dir = buffer_dir(bufnr),
  }, {
    bufnr = bufnr,
  })
end

function M.on_ftplugin(bufnr)
  if opts().auto_start then
    M.start(bufnr)
  end
end

return M
