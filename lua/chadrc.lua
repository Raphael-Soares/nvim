---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

local st = require("configs.statusline")

M.ui = {
    statusline = {
        modules = {
            git_branch = st.git_branch,
            lsp = st.lsp,
        },
        separator_style = "default",
        order = {
            "mode",
            "file",
            "%=",
            "lsp_msg",
            "lsp",
            "git_branch",
        },
    },
    tabufline = {
        enabled = false,
        order = { "treeOffset", "buffers", "tabs" },
    },
}

return M
