local dap = require "dap"
local dapui = require "dapui"

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.zig = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "Launch (select binary)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.julia = {
  {
    name = "Launch Julia file",
    type = "julia",
    request = "launch",
    program = "${file}",
    stopOnEntry = false,
  },
  {
    name = "Launch Julia (select file)",
    type = "julia",
    request = "launch",
    program = function()
      return vim.fn.input("Path to Julia file: ", vim.fn.getcwd() .. "/", "file")
    end,
    stopOnEntry = false,
  },
}

-- ═══════════════════════════════════════════════════════════════════════════════
-- KEYBINDINGS - Uncomment and adjust as needed
-- ═══════════════════════════════════════════════════════════════════════════════
-- local map = vim.keymap.set
--
-- map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
-- map("n", "<leader>dc", dap.continue, { desc = "Continue" })
-- map("n", "<leader>dso", dap.step_over, { desc = "Step Over" })
-- map("n", "<leader>dsi", dap.step_into, { desc = "Step Into" })
-- map("n", "<leader>dsO", dap.step_out, { desc = "Step Out" })
-- map("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
-- map("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
-- map("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
