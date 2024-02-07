-- [[ Basic Keymaps ]]

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
keymap("n", "<F13>", "1gt", opts)
keymap("n", "<F14>", "2gt", opts)
keymap("n", "<F15>", "3gt", opts)
keymap("n", "<F16>", "4gt", opts)
keymap("n", "<F17>", "5gt", opts)
keymap("n", "<F18>", "6gt", opts)
keymap("n", "<C-n>", ":tabnew<Space>", {})
keymap("n", "<C-S-f>", ":NvimTreeToggle<cr>", opts)

keymap("i", "<C-a>", "<Home>", opts)
keymap("i", "<C-d>", "<Del>", opts)
keymap("i", "<C-e>", "<End>", opts)
keymap("i", "<C-b>", "<Left>", opts)
keymap("i", "<C-f>", "<Right>", opts)
keymap("i", "<C-n>", "<Down>", opts)
keymap("i", "<C-p>", "<Up>", opts)
