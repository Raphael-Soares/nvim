return {
    "folke/trouble.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
        modes = {
            symbols = {
                desc = "document symbols",
                mode = "lsp_document_symbols",
                focus = true,
                win = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Document Symbols",
                    title_pos = "center",
                    position = { 0.5, 0.5 },
                    size = { width = 0.7, height = 0.7 },
                    zindex = 200,
                },
                format = "{kind_icon} {symbol.name} ",
            },
        },
        keys = {
            ["<esc>"] = "close",
            ["q"] = "close",
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle<cr>",
            desc = "Document Symbols (Trouble Floating)",
        },
    },
}
