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

-- WSL clipboard integration
local function setup_clipboard_for_wsl()
    if vim.fn.has("wsl") == 1 then
        local user = vim.env.USERNAME or "raphael.soares"
        local win32yank = "/mnt/c/Users/" .. user .. "/win32yank.exe"
        if vim.fn.executable(win32yank) == 1 then
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
        else
            vim.notify("win32yank.exe not found or not executable", vim.log.levels.WARN)
        end
    end
end

setup_clipboard_for_wsl()

return M
