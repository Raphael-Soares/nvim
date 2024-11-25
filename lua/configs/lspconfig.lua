require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.servers = {
    "lua_ls",
    "ts_ls",
    "volar",
}

local default_servers = { "html", "cssls", "volar" }
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"
    .. "/node_modules/@vue/typescript-plugin"

lspconfig.jdtls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = { "java" },
})

lspconfig.ts_ls.setup({
    on_attach = nvlsp.on_attach,
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
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
    },
})
