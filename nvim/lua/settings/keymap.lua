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
keymap("n", "<C-t>", ":tabnew<Space>", {})
keymap("n", "<C-S-f>", ":Neotree toggle<Return>", opts)

