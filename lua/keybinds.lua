local keymap = vim.keymap.set
local opt = { silent = true }
local noremap = { noremap = true, silent = true }

vim.g.mapleader=" "
vim.g.maplocalleader="\\"

keymap("t", "<ESC>", "<C-\\><C-n>", noremap)
keymap("", "<F8>", "<CMD>noh<CR>", noremap)
keymap("", "<C-c>", "<C-\\><C-n>", noremap)
keymap("!", "<C-c>", "<C-\\><C-n>", noremap)

-- 移动
keymap("n", "<C-e>", "<C-e><C-e><C-e>0", noremap)
keymap("n", "<C-y>", "<C-y><C-y><C-y>0", noremap)
keymap("n", "<C-u>", "<C-u>M0", noremap)
keymap("n", "<C-d>", "<C-d>M0", noremap)
keymap("n", "G", "Gzz0", noremap)
keymap("n", "{", "{zz", noremap)
keymap("n", "}", "}zz", noremap)

keymap("", "j", "gj", noremap)
keymap("", "k", "gk", noremap)
keymap("", "<Up>",   "g<Up>", noremap)
keymap("", "<Down>", "g<Down>", noremap)

keymap("t", "<A-h>", "<Left>", opt)
keymap("t", "<A-j>", "<Down>", opt)
keymap("t", "<A-k>", "<Up>", opt)
keymap("t", "<A-l>", "<Right>", opt)
keymap("t", "<A-Up>",   "<Up>", opt)
keymap("t", "<A-Down>", "<Down>", opt)
keymap("t", "<A-Left>", "<Left>", opt)
keymap("t", "<A-Right>", "<Right>", opt)

keymap("i", "<Up>",   "<C-o><Up>", opt)
keymap("i", "<Down>", "<C-o><Down>", opt)
keymap("i", "<A-h>", "<Left>", opt)
keymap("i", "<A-j>", "<Down>", opt)
keymap("i", "<A-k>", "<Up>", opt)
keymap("i", "<A-l>", "<Right>", opt)
keymap("i", "<A-Up>",   "<Up>", opt)
keymap("i", "<A-Down>", "<Down>", opt)
keymap("i", "<A-Left>", "<Left>", opt)
keymap("i", "<A-Right>", "<Right>", opt)
keymap("i", "<A-w>", "<C-o>w", noremap)
keymap("i", "<A-W)", "<C-o>W", noremap)
keymap("i", "<A-b>", "<C-o>b", noremap)
keymap("i", "<A-B>", "<C-o>B", noremap)
keymap("i", "<A-e>", "<C-o>e<Right>", noremap)
keymap("i", "<A-E>", "<C-o>E<Right>", noremap)
keymap("i", "<C-<Left>>", "<C-o>b", noremap)
keymap("i", "<C-<Right>>", "<C-o>e<Right>", noremap)

keymap("i", "<A-/>", "<C-o>/", noremap)
keymap("i", "<A-?>", "<C-o>?", noremap)

-- 搜索不显示提示
keymap("n", "/", "/", noremap)
keymap("n", "?", "?", noremap)

keymap("n", "u", "<CMD>undo<CR>", noremap)
keymap("n", "U", "<CMD>redo<CR>", noremap)


keymap("i", "<A-a>", "<C-o>A", noremap)
keymap("i", "<A-i>", "<C-o>I", noremap)

keymap("i", "<A-d>", "<C-o>d", noremap)
keymap("i", "<A-D>", "<C-o>D", noremap)

-- 窗格分割
keymap("n", "<A-\">", "<C-w>s", noremap)
keymap("n", "<A-|>",  "<C-w>v", noremap)

-- 关闭窗格
keymap("n", "<A-w>", "<C-w>q", noremap)

-- 窗格跳转
keymap("n", "<A-h>", "<C-w>h", noremap)
keymap("n", "<A-j>", "<C-w>j", noremap)
keymap("n", "<A-k>", "<C-w>k", noremap)
keymap("n", "<A-l>", "<C-w>l", noremap)
keymap("n",  "<A-Up>",    "<C-w><Up>", noremap)
keymap("n",  "<A-Down>",  "<C-w><Down>", noremap)
keymap("n",  "<A-Left>",  "<C-w><Left>", noremap)
keymap("n",  "<A-Right>", "<C-w><Right>", noremap)

-- 窗格移动
keymap("n", "<A-r>", "<C-w>r", noremap)
keymap("n", "<A-H>", "<C-w>H", noremap)
keymap("n", "<A-J>", "<C-w>J", noremap)
keymap("n", "<A-K>", "<C-w>K", noremap)
keymap("n", "<A-L>", "<C-w>L", noremap)
keymap("n", "<A-S-Up>", "<C-w>K", noremap)
keymap("n", "<A-S-Down>", "<C-w>J", noremap)
keymap("n", "<A-S-Left>", "<C-w>H", noremap)
keymap("n", "<A-S-Right>", "<C-w>L", noremap)

-- 调整窗格大小
keymap("n", "<A-<>", "<C-w><", noremap)
keymap("n", "<A->>", "<C-w>>", noremap)
keymap("n", "<A-=>", "<C-w>=", noremap)
keymap("n", "<A-+>", "<C-w>+", noremap)
keymap("n", "<A-->", "<C-w>-", noremap)

-- LSP
keymap("n", "K", vim.lsp.buf.hover, noremap)

keymap("v", "<", "<gv", noremap)
keymap("v", ">", ">gv", noremap)

keymap("n", "<C-\\>", "<CMD>Ex<CR>", noremap)
