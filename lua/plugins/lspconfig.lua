return {
    "neovim/nvim-lspconfig",
    config = function()
        require("configs.lsp.init").setup()
    end,
}
