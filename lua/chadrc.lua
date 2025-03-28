---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvbox",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}
M.ui = {
    statusline = {
        order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd" },
    },
}

local is_wsl = vim.fn.has("wsl") == 1
if is_wsl then
    local win32yank = "/mnt/c/Users/raphael.soares/win32yank.exe"
    vim.g.clipboard = {
        name = "win32yank",
        copy = {
            ["+"] = win32yank .. " -i --crlf",
            ["*"] = win32yank .. " -i --crlf",
        },
        paste = {
            ["+"] = win32yank .. " -o --lf",
            ["*"] = win32yank .. " -o --lf",
        },
        cache_enabled = 0,
    }
end

return M
