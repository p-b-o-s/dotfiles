require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- map("n", "<leader>ca", "lua vim.lsp.buf.code_action()")
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>th", function()
  require("nvchad.themes").open { border = true }
end)
-- map("n", "<leader>gl", "lua vim.diagnostic.open_float()")
map("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Diagnostic Float" })

map("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find hidden files" })

map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", { desc = "Rust Runnables" })
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", { desc = "Rust Tests" })
map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", { desc = "Rust Debug" })
map("n", "<leader>re", "<cmd>RustLsp expandMacro<cr>", { desc = "Expand Macro" })
map("n", "<leader>rh", "<cmd>RustLsp hover actions<cr>", { desc = "Rust Hover Actions" })
map("n", "<leader>rc", "<cmd>RustLsp openCargo<cr>", { desc = "Open Cargo.toml" })
map("n", "<leader>rp", "<cmd>RustLsp parentModule<cr>", { desc = "Parent Module" })
map("n", "<leader>rm", "<cmd>RustLsp joinLines<cr>", { desc = "Join Lines" })
map("n", "<leader>rs", "<cmd>RustLsp ssr<cr>", { desc = "Structural Search Replace" })
map("n", "<leader>rg", "<cmd>RustLsp crateGraph<cr>", { desc = "Crate Graph" })

map("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch C source/Header" })
