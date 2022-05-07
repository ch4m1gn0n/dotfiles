local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better save and quite
-- keymap("n", "<Leader>q", ":q<CR>", opts)
-- keymap("n", "<Leader>Q", ":q!<CR>", opts)
-- keymap("n", "<Leader>s", ":w<CR>", opts)

-- Better cursor move
keymap("", "j", "j", opts)
keymap("", "k", "k", opts)
keymap("", "<S-j>", "5j", opts)
keymap("", "<S-k>", "5k", opts)
-- remap $ and ^
keymap("", "<S-h>", "^", opts)
keymap("", "<S-l>", "$", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better split navigation
-- keymap("n", "<Leader>wv", "<C-w>v", opts)
-- keymap("n", "<Leader>ws", "<C-w>s", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- nohlight
keymap("n", "<ESC>", ":nohl<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "<C-@>", "<ESC>", opts)

-- move cursor
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- keymap('n', "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
-- keymap('n', "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", opts)
-- keymap('n', "<leader>td", "<cmd>lua _NCDU_TOGGLE()<cr>", opts)
-- keymap('n', "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", opts)
-- keymap('n', "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)

-- project --
-- keymap("n", "<leader>fp", ":Telescope projects <CR>", opts)

-- lsp --
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

-- nvim-tree --
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Buffer --
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
-- keymap("n", "<leader>bd", "<cmd>Bdelete<cr>", opts)
-- keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>bb", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- markdown --
-- keymap("n", "<leader>p", "<cmd>MarkdownPreviewToggle<cr>", opts)

-- input method
vim.g.ZFVimIM_keymap = 0
keymap("n", ",q", "<cmd>call ZFVimIME_keymap_toggle_n()<cr>", opts)
keymap("i", ",q", "<cmd>call ZFVimIME_keymap_toggle_i()<cr>", opts)
keymap("v", ",q", "<cmd>call ZFVimIME_keymap_toggle_v()<cr>", opts)

-- aerial --
-- keymap("n", "<leader>o", "<cmd>AerialToggle<cr>", opts)

-- easymotion --
vim.cmd[[
map , <Plug>(easymotion-prefix)
]]
