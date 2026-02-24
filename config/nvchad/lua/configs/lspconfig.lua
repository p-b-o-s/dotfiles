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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "julia",
  callback = function()
    vim.lsp.start {
      name = "julials",
      cmd = {
        "/home/ubuntu/.juliaup/bin/julia",
        "--startup-file=no",
        "--history-file=no",
        "-e",
        [[
          using Pkg
          using LanguageServer
          Pkg.instantiate()
          env_path = something(get(ENV, "JULIA_PROJECT", nothing), first(Base.load_path()))
          depot_path = joinpath(Base.DEPOT_PATH[1], "environments", "nvim-lspconfig")
          server = LanguageServer.LanguageServerInstance(stdin, stdout, depot_path, env_path)
          server.runlinter = true
          run(server)
        ]],
      },
      root_dir = vim.fs.root(0, { "Project.toml", "Manifest.toml", ".git" }) or vim.uv.cwd(),
    }
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
