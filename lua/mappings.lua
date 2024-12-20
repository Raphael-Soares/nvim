require("nvchad.mappings")

local map = vim.keymap.set
local buffer = require("nvchad.tabufline")
local terminal = require("nvchad.term")

-- Disable mappings
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

map("n", "+", "<C-a>", { desc = "Increment Number" })
map("n", "-", "<C-x>", { desc = "Decrement Number" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Line Down in Insert Mode" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line Up in Insert Mode" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Selection Up" })

map("n", "<leader>sv", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>sb", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>sd", "<C-W>c", { desc = "Delete Window", remap = true })

map("n", "<S-l>", function()
    require("nvchad.tabufline").next()
end, { desc = "Previous Buffer" })
map("n", "<S-h>", function()
    require("nvchad.tabufline").prev()
end, { desc = "Next Buffer" })

map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })

map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

map("n", "<leader>bd", function()
    buffer.close_buffer()
end, { desc = "Delete Buffer" })

map("n", "<leader>bo", function()
    buffer.closeBufs_at_direction("left")
    buffer.closeBufs_at_direction("right")
end, { desc = "Delete Other Buffers" })

map("n", "<leader>ba", function()
    buffer.closeAllBufs()
end, { desc = "Delete All Buffers" })

map("n", "<leader>h", function()
    terminal.new({ pos = "sp" })
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
    terminal.new({ pos = "vsp" })
end, { desc = "terminal new vertical term" })

-- toggleable terminal
map({ "n", "t" }, "<A-v>", function()
    terminal.toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    terminal.toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<C-_>", function()
    terminal.toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-f>", function()
    terminal.toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

nomap("n", "<leader>bn")
