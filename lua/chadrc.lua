---@type ChadrcConfig
local M = {}

-- Theme and highlights
M.base46 = {
    theme = "gruvchad",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.ui = {
    statusline = {
        order = {
            "mode",
            "file",
            "diagnostics",
            "%=",
            "lsp_msg",
            "%=",
            "git",
            "cwd",
        },
    },

    tabufline = {
        order = { "treeOffset", "buffers", "tabs" },
    },
}

return M
