-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Some OS detectors
local is_wsl = vim.fn.has("wsl") == 1
-- local is_mac = vim.fn.has("macunix") == 1
-- local is_linux = not is_wsl and not is_mac

-- WSL Clipboard support
if is_wsl then
    -- This is NeoVim's recommended way to solve clipboard sharing if you use WSL
    -- See: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

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
