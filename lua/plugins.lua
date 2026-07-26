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
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })
            require("nvim-treesitter").install({
                "rust", "javascript", "c", "cpp", "markdown", "markdown_inline", "comment",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "rust", "javascript", "c", "cpp", "markdown", "markdown_inline" },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "echasnovski/mini.completion",
})
