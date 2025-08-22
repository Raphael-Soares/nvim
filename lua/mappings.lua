local map = vim.keymap.set
local buffer = require("nvchad.tabufline")

-- General
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center" })

-- Line movement
map({ "n" }, "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
map({ "n" }, "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })

-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- Telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Telescope find Files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>fr", function()
    require("telescope.builtin").oldfiles({ cwd_only = true, prompt_title = "Recent Files" })
end, { desc = "telescope recent files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

-- Buffer management
map("n", "<S-l>", function()
    buffer.next()
end, { desc = "Previous Buffer" })
map("n", "<S-h>", function()
    buffer.prev()
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

-- Disabled mappings
-- nomap("n", "<leader>bn")
-- nomap("n", "<leader>v")
-- nomap("n", "<leader>h")
-- nomap("n", "<leader>x")
-- nomap("n", "<leader>ch")
-- nomap("n", "<leader>cm")
-- nomap({"n", "v"}, "<leader>fm")
-- nomap("n", "<A-h>")
