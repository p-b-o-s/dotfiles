require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "eslint", "nim_langserver", "zls" }
vim.lsp.enable(servers)

vim.lsp.config("zls", {
  settings = {
    zls = {
      enable_build_on_save = true,
      build_on_save_step = "install",
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
