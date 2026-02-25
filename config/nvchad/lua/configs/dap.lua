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

dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      local root = vim.fn.getcwd()
      local cargo_toml = root .. "/Cargo.toml"
      if vim.fn.filereadable(cargo_toml) == 1 then
        local binary_name = vim.fn.fnamemodify(root, ":t")
        local target_dir = root .. "/target/debug/"
        return vim.fn.input("Path to executable: ", target_dir .. binary_name, "file")
      end
      return vim.fn.input("Path to executable: ", "", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.odin = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      local root = vim.fn.getcwd()
      local exe_name = vim.fn.fnamemodify(root, ":t")
      return vim.fn.input("Path to executable: ", root .. "/" .. exe_name, "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

local map = vim.keymap.set

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "Continue" })
map("n", "<leader>dso", dap.step_over, { desc = "Step Over" })
map("n", "<leader>dsi", dap.step_into, { desc = "Step Into" })
map("n", "<leader>dsO", dap.step_out, { desc = "Step Out" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
map("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
map("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
