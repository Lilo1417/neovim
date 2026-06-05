return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap = require("dap")
            local mason_dap = require("mason-nvim-dap")
            local ui = require("dapui")
            local dap_virtual_text = require("nvim-dap-virtual-text")

            -- Virtual text
            dap_virtual_text.setup()

            -- Mason DAP setup
            mason_dap.setup({
                ensure_installed = {"cppdbg", "codelldb"},
                automatic_installation = true,
                handlers = {
                    function(config)
                        mason_dap.default_setup(config)
                    end,
                },
            })

            -- Configurations for C, C++, Rust
            local function get_program_path()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end

            -- C, C++, Rust
            dap.configurations.c = {
                {
                    name = "Launch file (cpplldb)",
                    type = "codelldb",   -- adapter name
                    request = "launch",
                    program = get_program_path,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c

            --Python
            require("dap-python").setup("python3")
            -- DAP UI
            ui.setup()

            vim.fn.sign_define("DapBreakpoint", { text = "" })

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end

            -- Keybindings
            require("which-key").add({
          -- Debugger
          {
              "<leader>d",
              group = "Debugger",
              nowait = true,
              remap = false,
          },
          {
              "<leader>dt",
              function()
                  require("dap").toggle_breakpoint()
              end,
              desc = "Toggle Breakpoint",
              nowait = true,
              remap = false,
          },
          {
              "<leader>dc",
              function()
                  require("dap").continue()
              end,
              desc = "Continue",
              nowait = true,
              remap = false,
          },
          {
              "<leader>di",
              function()
                  require("dap").step_into()
              end,
              desc = "Step Into",
              nowait = true,
              remap = false,
          },
          {
              "<leader>do",
              function()
                  require("dap").step_over()
              end,
              desc = "Step Over",
              nowait = true,
              remap = false,
          },
          {
              "<leader>du",
              function()
                  require("dap").step_out()
              end,
              desc = "Step Out",
              nowait = true,
              remap = false,
          },
          {
              "<leader>dr",
              function()
                  require("dap").repl.open()
              end,
              desc = "Open REPL",
              nowait = true,
              remap = false,
          },
          {
              "<leader>dl",
              function()
                  require("dap").run_last()
              end,
              desc = "Run Last",
              nowait = true,
              remap = false,
          },
          {
              "<leader>dq",
              function()
                  require("dap").terminate()
                  require("dapui").close()
                  require("nvim-dap-virtual-text").toggle()
              end,
              desc = "Terminate",
              nowait = true,
              remap = false,
          },
          {
              "<leader>db",
              function()
                  require("dap").list_breakpoints()
              end,
              desc = "List Breakpoints",
              nowait = true,
              remap = false,
          },
          {
              "<leader>de",
              function()
                  require("dap").set_exception_breakpoints({ "all" })
              end,
              desc = "Set Exception Breakpoints",
              nowait = true,
              remap = false,
          },
        }, { mode = "n" })
    end,
    },
}

