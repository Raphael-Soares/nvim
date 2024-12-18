require("nvchad.mappings")

local map = vim.keymap.set
local buffer = require("nvchad.tabufline")
local terminal = require("nvchad.term")

-- Disable mappings
local nomap = vim.keymap.del

-- General mappings
map("n", ";", ":", { desc = "Enter command mode" })
map({ "i", "x", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "+", "<c-a>", { desc = "Increment number" })
map("n", "-", "<c-x>", { desc = "Decrement number" })
map("n", "<c-a>", "gg<s-v>G", { desc = "Select all" })
map("n", "<c-d>", "<c-d>zz", { desc = "Scroll down and center" })
map("n", "<c-u>", "<c-u>zz", { desc = "Scroll up and center" })

-- NvimTree toggle
map("n", "<leader>e", "<cmd>nvimtreetoggle<cr>", { desc = "Toggle NvimTree window" })

-- Window navigation
map("n", "<c-h>", "<c-w>h", { desc = "Switch window left" })
map("n", "<c-l>", "<c-w>l", { desc = "Switch window right" })
map("n", "<c-j>", "<c-w>j", { desc = "Switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "Switch window up" })

-- Line movement
map("n", "<a-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down in insert mode" })
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up in insert mode" })
map("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move selection up" })

-- Window management
map("n", "<leader>sv", "<c-w>s", { desc = "Split window below", remap = true })
map("n", "<leader>sb", "<c-w>v", { desc = "Split window right", remap = true })
map("n", "<leader>sd", "<c-w>c", { desc = "Delete window", remap = true })

-- Buffer navigation
map("n", "<s-l>", function()
    buffer.next()
end, { desc = "Next buffer" })
map("n", "<s-h>", function()
    buffer.prev()
end, { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
map("n", "<leader>bd", function()
    buffer.close_buffer()
end, { desc = "Delete buffer" })
map("n", "<leader>bo", function()
    buffer.closebufs_at_direction("left")
    buffer.closebufs_at_direction("right")
end, { desc = "Delete other buffers" })
map("n", "<leader>ba", function()
    buffer.closeallbufs()
end, { desc = "Delete all buffers" })

-- Terminal management
map("n", "<leader>h", function()
    terminal.new({ pos = "sp" })
end, { desc = "New horizontal terminal" })
map("n", "<leader>v", function()
    terminal.new({ pos = "vsp" })
end, { desc = "New vertical terminal" })

-- Toggleable terminals
map({ "n", "t" }, "<a-v>", function()
    terminal.toggle({ pos = "vsp", id = "vtoggleterm" })
end, { desc = "Toggle vertical terminal" })
map({ "n", "t" }, "<a-h>", function()
    terminal.toggle({ pos = "sp", id = "htoggleterm" })
end, { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<c-_>", function()
    terminal.toggle({ pos = "sp", id = "htoggleterm" })
end, { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<a-f>", function()
    terminal.toggle({ pos = "float", id = "floatterm" })
end, { desc = "Toggle floating terminal" })

-- Quit command
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Disable specific mappings
nomap("n", "<leader>bn")
