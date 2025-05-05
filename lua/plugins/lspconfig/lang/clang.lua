-- lua/plugins/lspconfig/lang/clang.lua
local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")
    local keymaps = require("plugins.lspconfig.keymaps")
    local nvlsp = require("nvchad.configs.lspconfig")

    lspconfig.clangd.setup({
        on_attach = keymaps.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

return M
