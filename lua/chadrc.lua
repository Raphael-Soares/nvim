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

-- UI Config (e.g., statusline)
M.ui = {
    statusline = {
        order = {
            "mode",
            "file",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            "diagnostics",
            "lsp",
            "cwd",
        },
    },
}

return M
