return {
    "stevearc/conform.nvim",
    even = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            vue = { "prettier" },
            typescript = { "prettier" },
            -- html = { "prettier" },
        },

        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
