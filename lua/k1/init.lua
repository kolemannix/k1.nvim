local M = {}
local uv = vim.uv or vim.loop
local LSP_NAME = "k1-lsp"
local LSPCONFIG_SERVER = "k1_lsp"

local defaults = {
  auto_start = true,
  k1_home = nil,
  lsp_binary = nil,
  root_dir = nil,
  on_attach = nil,
  capabilities = nil,
  settings = nil,
  init_options = nil,
  handlers = nil,
  flags = nil,
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

local function dirname_or_cwd(filename)
  if not filename or filename == "" then
    return uv.cwd()
  end
  return vim.fs.dirname(filename) or uv.cwd()
end

local function root_dir_from_filename(filename, o, bufnr)
  local custom = o.root_dir

  if type(custom) == "function" then
    local ok, resolved = pcall(custom, filename, bufnr)
    if ok and type(resolved) == "string" and resolved ~= "" then
      return normalize(resolved)
    end
    return dirname_or_cwd(filename)
  end

  if type(custom) == "string" and custom ~= "" then
    return normalize(custom)
  end

  return dirname_or_cwd(filename)
end

local function resolve_root_dir(bufnr, o)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local filename = vim.api.nvim_buf_get_name(bufnr)
  return root_dir_from_filename(filename, o, bufnr)
end

local function validate_lsp_binary(lsp_binary, k1_home)
  if vim.fn.executable(lsp_binary) == 1 then
    return true
  end

  vim.notify(
    ("k1.nvim: k1lsp not found/executable at '%s' (K1_HOME='%s')"):format(lsp_binary, k1_home),
    vim.log.levels.ERROR
  )
  return false
end

local function apply_lsp_overrides(config, o)
  config.on_attach = o.on_attach
  config.capabilities = o.capabilities
  config.settings = o.settings
  config.init_options = o.init_options
  config.handlers = o.handlers
  config.flags = o.flags
  return config
end

function M.setup(user_opts)
  M.options = vim.tbl_extend("force", defaults, user_opts or {})
end

function M.lspconfig_config()
  local o = opts()
  local k1_home = resolve_k1_home(o)
  local lsp_binary = resolve_lsp_binary(o, k1_home)

  if not validate_lsp_binary(lsp_binary, k1_home) then
    return nil
  end

  local config = {
    name = LSP_NAME,
    cmd = { lsp_binary },
    cmd_env = { K1_HOME = k1_home, RUST_BACKTRACE = "1" },
    filetypes = { "k1" },
    single_file_support = true,
    root_dir = function(filename)
      return root_dir_from_filename(filename, o)
    end,
  }

  return apply_lsp_overrides(config, o)
end

function M.lspconfig_setup(server_opts)
  local ok_configs, configs = pcall(require, "lspconfig.configs")
  local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
  if not ok_configs or not ok_lspconfig then
    vim.notify("k1.nvim: lspconfig is required for lspconfig_setup()", vim.log.levels.ERROR)
    return nil
  end

  local base = M.lspconfig_config()
  if not base then
    return nil
  end

  if not configs[LSPCONFIG_SERVER] then
    configs[LSPCONFIG_SERVER] = {
      default_config = {
        name = LSP_NAME,
        cmd = base.cmd,
        filetypes = { "k1" },
        single_file_support = true,
        root_dir = base.root_dir,
      },
      docs = {
        description = "k1 language server (k1lsp).",
      },
    }
  end

  if opts().auto_start then
    vim.notify(
      "k1.nvim: setup({ auto_start = false }) is recommended with lspconfig_setup()",
      vim.log.levels.WARN
    )
  end

  return lspconfig[LSPCONFIG_SERVER].setup(vim.tbl_deep_extend("force", base, server_opts or {}))
end

function M.start(bufnr)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local o = opts()
  local k1_home = resolve_k1_home(o)
  local lsp_binary = resolve_lsp_binary(o, k1_home)

  if not validate_lsp_binary(lsp_binary, k1_home) then
    return nil
  end

  local config = {
    name = LSP_NAME,
    cmd = { lsp_binary },
    cmd_env = { K1_HOME = k1_home, RUST_BACKTRACE = "1" },
    root_dir = resolve_root_dir(bufnr, o),
  }

  return vim.lsp.start(apply_lsp_overrides(config, o), {
    bufnr = bufnr,
  })
end

function M.on_ftplugin(bufnr)
  if opts().auto_start then
    M.start(bufnr)
  end
end

return M
