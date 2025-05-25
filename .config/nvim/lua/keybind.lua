Nvim_cc_start_insert = false
Nvim_cc_blacklist_dir_name = {"src", "bin"}

local nvim_cc = require("mod.nvim-cc")
local bj = require("mod.jumpbuff")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "nzz")

-- Leader key mappings
vim.g.mapleader = " " -- Set space as leader key

-- Normal mode mappings
vim.keymap.set("n", "<leader>nt", ":tabe .<CR>", { desc = "Open New Tab" })
vim.keymap.set("n", "<leader>os", ":cd ~/.config/nvim | :Telescope find_files<CR>", { desc = "Open Nvim Config" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear Search Highlight", silent = true })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move Line Down" })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move Line Up" })
vim.keymap.set("n", "<leader>jj", "<cmd>normal! %<CR>", { desc = "Jump Matching Parenthesis" })
vim.keymap.set("n", "<leader>jh", "<cmd>normal! ^<CR>", { desc = "Jump to Line Start" })
vim.keymap.set("n", "<leader>jl", "<cmd>normal! $<CR>", { desc = "Jump to Line End" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source Current File (Lua)" })
vim.keymap.set("n", "<leader>.", "<cmd>Ex<CR>", { desc = "Open Netrw" })
vim.keymap.set("n", "<leader>mp", "<cmd>Man<CR>", { desc = "Open man page of the current word" })

-- Visual mode mappings
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank/Copy to System Clipboard" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
vim.keymap.set("v", "<leader>jj", "<cmd>normal! %<CR>", { desc = "Jump Matching Parenthesis" })
vim.keymap.set("v", "<leader>jh", "<cmd>normal! ^<CR>", { desc = "Jump to Line Start" })
vim.keymap.set("v", "<leader>jl", "<cmd>normal! $<CR>", { desc = "Jump to Line End" })
vim.keymap.set("v", "mf", ":normal mf<CR>", { desc = "Mark File (netrw)" })

-- Terminal mode mappings
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode", silent = true })

-- Function mappings
vim.keymap.set("n", "<leader>dl", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    print(cursor_pos)
    vim.cmd("normal! yyp")
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1] + 1, cursor_pos[2] })
end, { desc = "Duplicate Line with Cursor" })

-- Git mappings
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "Git Diff" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })

-- Telescope mappings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<CR>", { desc = "Git Files" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fs", function()
    require("telescope.builtin").live_grep()
end, { desc = "Search String" })

-- Search mappings
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = "Substitute Word Globally" })
vim.keymap.set("n", "<leader>sw", "<cmd>normal! *<CR>", { desc = "Search Word Forward" })
vim.keymap.set("n", "<leader>sb", "<cmd>normal! #<CR>", { desc = "Search Word Backward" })

-- Buffer mappings
vim.keymap.set("n", "<leader>be", ":enew<CR>", { desc = "New Empty Buffer Tab" })
vim.keymap.set("n", "<leader>bs", ":Telescope buffers<CR>", { desc = "List Buffers" })
vim.keymap.set("n", "<leader>bc", ":bd!<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bn", ":bNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous Buffer" })

-- LSP mappings
vim.keymap.set("n", "<leader>lr", ":Telescope lsp_references<CR>", { desc = "LSP References" })
vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>lfb", ":lua vim.lsp.buf.format()<CR>", { desc = "Format Code" })
vim.keymap.set("n", "<leader>lqf", ":lua vim.diagnostic.setqflist()<CR>", { desc = "Quickfix List" })

-- Compiler mappings (assuming nvim_cc is defined elsewhere)
vim.keymap.set("n", "<leader>cC", function() nvim_cc.input_compile_command() end, { desc = "Input Compile Command" })
vim.keymap.set("n", "<leader>cc", function()
    if Nvim_cc_term_buffn == nil or vim.fn.bufexists(Nvim_cc_term_buffn) ~= 1 then
        nvim_cc.run_compile_command()
    else
        vim.api.nvim_buf_delete(Nvim_cc_term_buffn, { force = true })
        nvim_cc.run_compile_command()
    end
end, { desc = "Run Compile Command" })
vim.keymap.set("n", "<leader>co", function() Nvim_cc_compile_command = "" end, { desc = "Clear compile command" })
vim.keymap.set("n", "<leader>cf", function() nvim_cc.set_compile_command_from_file() end, { desc = "Set Compile Command From File" })
vim.keymap.set("n", "<leader>cs", function()
    nvim_cc.sync_directory_to_buffer()
    nvim_cc.set_compile_command_from_file()
    print("cwd & cc set.")
end, { desc = "Sync Directory & Set Compile Command" })
vim.keymap.set("n", "<leader>cw", function() nvim_cc.export_compile_command() end, { desc = "Export Compile Command" })
vim.keymap.set("n", "<leader>cj", function() nvim_cc.jump_to_error_position() end, { desc = "Jump to Error Position" })

-- Jump buffer mappings (assuming bj is defined elsewhere)
vim.keymap.set("n", "<C-s>a", function() bj.add_jumpbuff() end, { desc = "Add current buf to jlist" })
vim.keymap.set("n", "<C-s>c", function() JumpBuffTable = {} end, { desc = "Clear jlist" })
vim.keymap.set("n", "<C-s>p", function() bj.prev_jumpbuff() end, { desc = "Go to prev buf" })
vim.keymap.set("n", "<C-s>n", function() bj.next_jumpbuff() end, { desc = "Go to next buf" })
vim.keymap.set("n", "<C-s>r", function() bj.rem_jumpbuff() end, { desc = "Remove current buf from jlist" })
vim.keymap.set("n", "<C-s>1", function() bj.jumpto_jumpbuff(1) end, { desc = "Jump to buf n1" })
vim.keymap.set("n", "<C-s>2", function() bj.jumpto_jumpbuff(2) end, { desc = "Jump to buf n2" })
vim.keymap.set("n", "<C-s>3", function() bj.jumpto_jumpbuff(3) end, { desc = "Jump to buf n3" })
vim.keymap.set("n", "<C-s>m1", function() bj.move_jumpbuff_to(1) end, { desc = "Move CBuf to n1" })
vim.keymap.set("n", "<C-s>m2", function() bj.move_jumpbuff_to(2) end, { desc = "Move CBuf to n2" })
vim.keymap.set("n", "<C-s>m3", function() bj.move_jumpbuff_to(3) end, { desc = "Move CBuf to n3" })
