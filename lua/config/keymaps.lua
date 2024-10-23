local discipline = require("raph.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Remover keymaps que usam <C-/> e <C-_>
keymap.del("n", "<C-/>")
keymap.del("n", "<C-_>")
keymap.del("t", "<C-/>")
keymap.del("t", "<C-_>")

-- Keymap para alternar o ToggleTerm com <C-/> e <C-_>
vim.keymap.set("n", "<C-_>", ":ToggleTerm<CR>", opts)
vim.keymap.set("n", "<C-/>", ":ToggleTerm<CR>", opts)
vim.keymap.set("t", "<C-_>", "<cmd>exit<CR>", opts)
vim.keymap.set("t", "<C-/>", "<cmd>exit<CR>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Center view while moving
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<C-/>", ":ToggleTerm<CR>", opts)
