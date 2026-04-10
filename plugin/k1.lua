if vim.g.loaded_k1_nvim == 1 then
  return
end
vim.g.loaded_k1_nvim = 1

local k1 = require("k1")

vim.api.nvim_create_user_command("K1LspStart", function()
  k1.start(0)
end, {
  desc = "Start k1 LSP",
})
