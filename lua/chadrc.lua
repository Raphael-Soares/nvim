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
        modules = {
            venv = require("venv-selector.statusline.nvchad").render,
        },
        order = {
            "mode",
            "file",
            "git",
            "%=",
            "%=",
            "diagnostics",
            "lsp_msg",
            "venv",
            "lsp",
            "cwd",
        },
    },

    tabufline = {
        enabled = false,
        order = { "treeOffset", "buffers", "tabs" },
    },
    mason = {
        pkgs = {
            "lua_ls",
            "html",
            "cssls",
            "clangd",
            "pyright",
            "tailwindcss",
            "vtsls",
            "vue_ls",
            "jsonls",
            "eslint",
        },
        skip = {},
    },
}

return M
