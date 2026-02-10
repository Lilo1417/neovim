return { 
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function() 
        require'nvim-treesitter'.setup {
          install_dir = vim.fn.stdpath('data') .. '/site',
          ensure_installed = {"lua", "c", "cpp", "c_sharp", "asm", "css", "python", "cmake", "sql", "bash", "hyprlang", "json", "latex", "scss", "yuck"},
          highlight = { enable = true },
          indent = { enable = true }, 
        }
    end
}
