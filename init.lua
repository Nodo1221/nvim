vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    { "echasnovski/mini.pairs" },
    { "folke/tokyonight.nvim"},
    --{ "lervag/vimtex" },
    { "preservim/nerdcommenter" },
})

require("mini.pairs").setup()

-- Colourscheme
vim.cmd.colorscheme("tokyonight")

--vim.g.vimtex_view_method = "zathura"        -- choose your PDF viewer
--vim.g.vimtex_compiler_method = "latexmk"   -- default compiler

-- Numbering
vim.o.number = true 
vim.o.relativenumber = true

-- Indenting
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

-- Don't fuck up the selection after >
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })

-- Searching
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Colours
vim.o.termguicolors = true

-- Better undo & disable fuckedup backup
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false

-- No dumbass bells
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.belloff=all

-- Manage splits
vim.o.splitbelow = true
vim.o.splitright = true

vim.keymap.set("n", "<C-->", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-=>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<C-[>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-]>", ":resize +2<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Paths
local data_path = vim.fn.stdpath("data")  -- usually ~/.local/share/nvim
local undodir = data_path .. "/undo"
local swap_dir = data_path .. "/swap"

-- Create directories if missing
vim.fn.mkdir(undodir, "p")
vim.fn.mkdir(swap_dir, "p")

-- Set directories
vim.o.undodir = undodir
vim.o.directory = swap_dir
vim.o.swapfile = true

-- Disable fuckedup mouse
vim.o.mouse = "i"

-- Better save
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save file" })

-- Exit terminal mode with <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
