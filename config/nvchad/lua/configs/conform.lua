local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    rust = { "rustfmt" },
    toml = { "taplo" },
    odin = { "odinfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  formatters = {
    odinfmt = {
      command = "/home/ubuntu/languages_from_source/ols/odinfmt",
      args = { "-stdin" },
      stdin = true,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
