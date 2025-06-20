local opt = vim.opt
local cmd = vim.api.nvim_command
local o = vim.o

local g = vim.g
g.background = "dark"

opt.termguicolors = true
opt.number = true
opt.rnu = true
opt.timeoutlen = 500

cmd('filetype plugin on')
-- o.clipboard = 'unnamedplus' -- to use system clipboard

o.showmode = true

o.completeopt = 'noinsert,menuone,noselect'
o.ignorecase = true -- case insensitive search
o.cursorline = true
o.hidden = true
o.inccommand = 'split'
o.splitbelow = true
o.splitright = true
o.title = false
o.ttimeoutlen = 0
o.wildmenu = true

opt.guicursor = "n-v-c-i-ci-ve-sm:block,r-cr-o:hor20"
-- opt.colorcolumn="80"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 3
opt.updatetime = 50
opt.swapfile = false
opt.laststatus = 2
-- opt.laststatus = 3

-- NEWLINE AND ETC
vim.opt.list = false
-- vim.opt.listchars = {eol = '↲', tab = "··>"}
-- vim.opt.listchars = {tab = "··>"}
-- vim.opt.listchars = {tab = "  >"}

-- NETRW STUFF
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle= "h"
vim.g.netrw_winsize = 25
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_keepdir = 1

vim.g.editorconfig = true

-- ZIG WHY?????
vim.cmd("let g:zig_fmt_autosave = 0")
