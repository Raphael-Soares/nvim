-- lua/plugins/lspconfig/keymaps.lua
local M = {}

function M.on_attach(client, bufnr)
    local map = function(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
    map({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "References" })
    map({ "n", "v" }, "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
    map({ "n", "v" }, "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

    map({ "n", "v" }, "K", vim.lsp.buf.hover, { desc = "Hover" })
    map({ "n", "v" }, "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    map({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
    map({ "n", "v" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format Code" })

    require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

return M
