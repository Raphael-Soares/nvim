return {
    "neovim/nvim-lspconfig",
    config = function()
        require("nvchad.configs.lspconfig").defaults()

        local lspconfig = require("lspconfig")
        local nvlsp = require("nvchad.configs.lspconfig")

        lspconfig.servers = {
            "lua_ls",
            "ts_ls",
            "volar",
            "html",
            "cssls",
            "pyright",
            "tailwindcss",
        }

        local default_servers = { "html", "tailwindcss", "cssls", "pyright" }
        for _, lsp in ipairs(default_servers) do
            lspconfig[lsp].setup({
                on_attach = nvlsp.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
            })
        end

        require("plugins.lang.typescript").setup()
        require("plugins.lang.python").setup()
    end,
}
