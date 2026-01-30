vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    { "echasnovski/mini.pairs" },
    { "folke/tokyonight.nvim"},
    { "lervag/vimtex" },
    { "preservim/nerdcommenter" },
    { "neovim/nvim-lspconfig" },
    { "ellisonleao/gruvbox.nvim" }, 
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "rust", "javascript", "c", "cpp"},
                auto_install = true,
                highlight = { enable = true },
            })
        end,
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "echasnovski/mini.completion",
})
