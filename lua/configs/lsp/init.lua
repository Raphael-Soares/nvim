local M = {}

M.setup = function()
    require("nvchad.configs.lspconfig").defaults()

    local nvlsp = require("nvchad.configs.lspconfig")
    local keymaps = require("plugins.lspconfig.keymaps")
    local clangd_config = require("plugins.lspconfig.clang")
    local vue_configs = require("plugins.lspconfig.vue")

    local servers = {
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
    }

    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
            on_attach = keymaps.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
        })
    end

    vim.lsp.config("clangd", clangd_config.config())

    local vtsls = vue_configs.vtsls()
    local vue_ls = vue_configs.vue_ls()

    vim.lsp.config("vue_ls", vue_ls)
    vim.lsp.config("vtsls", vtsls)

    vim.lsp.enable(servers)
end

return M
