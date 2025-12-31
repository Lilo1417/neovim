return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup DAP UI
            dapui.setup()

            -- Listeners
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Keymaps
            local keymap = vim.keymap
            keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
            keymap.set("n", "<Leader>dc", dap.continue)
            keymap.set("n", "<Leader>do", dap.step_over)
            keymap.set("n", "<Leader>di", dap.step_into)
            keymap.set("n", "<Leader>de", dap.step_out)
            keymap.set("n", "<Leader>dr", dap.repl.open)

            -- Adapter for GDB
            dap.adapters.cppdbg = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=mi2" },
            }

            -- Configurations
            local function make_c_cpp_config(name)
                return {
                    {
                        name = "Launch " .. name,
                        type = "cppdbg",
                        request = "launch",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        args = {},
                        cwd = "${workspaceFolder}",
                        stopAtEntry = false,
                        setupCommands = {
                            {
                                text = "-enable-pretty-printing",
                                description = "enable pretty printing",
                                ignoreFailures = false,
                            },
                        },
                    },
                    {
                        name = "Attach to process " .. name,
                        type = "cppdbg",
                        request = "attach",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        pid = function()
                            return require("dap.utils").pick_process()
                        end,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

            dap.configurations.c = make_c_cpp_config("C")
            dap.configurations.cpp = make_c_cpp_config("C++")
            dap.configurations.rust = make_c_cpp_config("Rust")
        end,
    },
}

