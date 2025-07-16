return {
    "neovim/nvim-lspconfig",
    config = function()
        require("nvchad.configs.lspconfig").defaults()

        local nvlsp = require("nvchad.configs.lspconfig")
        local keymaps = require("plugins.lspconfig.keymaps")

        local servers = {
            "lua_ls",
            "html",
            "cssls",
            "clangd",
            "pyright",
            "tailwindcss",
            "vtsls",
            "vue_ls",
        }

        for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, {
                on_attach = keymaps.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
            })
        end

        local vue_configs = require("plugins.lspconfig.vue")
        local vtsls = vue_configs.vtsls()
        local vue_ls = vue_configs.vue_ls()

        vim.lsp.config("vue_ls", vue_ls)
        vim.lsp.config("vtsls", vtsls)

        vim.lsp.enable(servers)
    end,
}
