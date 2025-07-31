require("nvchad.mappings")

local buffer = require("nvchad.tabufline")
local map = vim.keymap.set
local terminal = require("nvchad.term")

local nomap = vim.keymap.del

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map({ "n", "v" }, "<leader>f", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Find Files" })

map({ "n", "v" }, "<leader>fr", function()
    require("telescope.builtin").oldfiles({ cwd_only = true, prompt_title = "Recent Files" })
end, { desc = "telescope recent files" })

map({ "n" }, "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
map({ "n" }, "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })

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

map({ "n", "t" }, "<C-/>", function()
    terminal.toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Toggles floating terminal" })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

nomap("n", "<leader>bn")
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<leader>x")
nomap("n", "<leader>ch")
nomap("n", "<leader>cm")
nomap({"n", "v"}, "<leader>fm")
nomap("n", "<A-h>")
