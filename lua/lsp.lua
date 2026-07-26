require("mason").setup()

-- Enable servers
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')

-- Autocomplete UI
require('mini.completion').setup({
  lsp_completion = {
    source_func = 'completefunc',
    auto_setup = true,
  },
})

-- Auto-trigger completion on typing
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Show warnings and erorrs on CursorHold
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
    vim.lsp.buf.hover(opts)
  end,
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover information' })

-- Autoselect the first option
vim.opt.completeopt = { "menu", "menuone", "noinsert" }

-- Merge W and E with number line
vim.opt.signcolumn = "number"

-- Force diagnostics to stay visible and update while typing
vim.diagnostic.config({
  update_in_insert = true, -- This is the magic line for your request
  --virtual_text = true,     -- Shows the error text at the end of the line
  signs = true,            -- Keeps the E and W in the gutter
  underline = true,        -- Underlines the code with the error
})
