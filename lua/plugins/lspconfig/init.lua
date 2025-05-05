return {
    "neovim/nvim-lspconfig",
    config = function()
        require("nvchad.configs.lspconfig").defaults()

        local lspconfig = require("lspconfig")
        local nvlsp = require("nvchad.configs.lspconfig")

        lspconfig.servers = {
            "lua_ls",
            "html",
            "cssls",
            "tailwindcss",
        }

        local default_servers = { "html", "tailwindcss", "cssls" }
        for _, lsp in ipairs(default_servers) do
            lspconfig[lsp].setup({
                on_attach = nvlsp.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
            })
        end

        require("plugins.lspconfig.lang.typescript").setup()
        require("plugins.lspconfig.lang.python").setup()
        require("plugins.lspconfig.lang.clang").setup()
    end,
}
