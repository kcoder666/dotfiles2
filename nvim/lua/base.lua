vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = ','

vim.wo.number = true -- same as `set number`
vim.wo.relativenumber = true -- same as `set relativenumber`

-- Automatically toggle between line number modes
vim.api.nvim_command [[augroup NumberToggle]]
vim.api.nvim_command [[autocmd!]]
vim.api.nvim_command [[autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif]]
vim.api.nvim_command [[autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif]]
vim.api.nvim_command [[augroup END]]

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true -- highlight search
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent
vim.opt.wrap = false -- no wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- finding files - search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl -- doesn't work on iTerm2 for now, leave it for the future
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comment
vim.opt.formatoptions:append { 'r' }
