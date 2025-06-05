-- lua/plugins/lspconfig/lang/typescript.lua
local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    local keymaps = require("plugins.lspconfig.keymaps")
    local nvlsp = require("nvchad.configs.lspconfig")

    local vue_typescript_plugin = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

    local typescript_language_server = vim.fn.stdpath("data")
        .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"

    lspconfig.vue_ls.setup({
        on_attach = keymaps.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        init_options = {
            typescript = { tsdk = typescript_language_server },
        },
    })

    lspconfig.ts_ls.setup({
        on_attach = keymaps.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        init_options = {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vue_typescript_plugin,
                    languages = { "javascript", "typescript", "vue" },
                },
            },
        },
        filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "javascript.jsx",
            "typescript.tsx",
            "vue",
        },
    })
end

return M
