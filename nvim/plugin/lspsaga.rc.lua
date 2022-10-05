local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {},
  finder_action_keys = {
    open = "<CR>",
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "q",
  },
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = '<CR>',
    -- auto refresh when change buffer
    auto_refresh = true,
  }
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Diagnostic jump. Can use `<C-o>` to jump back.
keymap('n', '[e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', ']e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Find symbol definition. When using action in finder like vsplit, can use `<C-t>` to jump back.
keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- Peek definition. Can edit file in the float window.
keymap('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- Rename symbol.
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Hover doc.
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- Show outline.
keymap("n", "<leader>o", "<Cmd>LSoutlineToggle<CR>", opts)

-- Code action.
keymap({ 'n', 'v' }, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
