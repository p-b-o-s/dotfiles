require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
map("n", "<leader>ca", "lua vim.lsp.buf.code_action()")
map("n", "<leader>th", function ()
  require("nvchad.themes").open { border = true}
end)
