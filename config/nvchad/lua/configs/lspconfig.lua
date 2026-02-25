require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "eslint", "nim_langserver", "zls", "taplo", "svelte" }
vim.lsp.enable(servers)

vim.lsp.config("zls", {
  settings = {
    zls = {
      enable_build_on_save = true,
      build_on_save_step = "install",
    },
  },
})

vim.lsp.config("svelte", {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = vim.empty_dict(),
    },
  },
  settings = {
    svelte = {
      plugin = {
        svelte = {
          defaultScriptLanguage = "ts",
        },
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      tsserver = {
        globalPlugins = {
          {
            name = "typescript-svelte-plugin",
            location = vim.fn.expand "$MASON/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
})
