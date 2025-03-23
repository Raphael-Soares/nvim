return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python",
    },
    lazy = false,
    branch = "regexp",
    keys = {

        { "<leader>vs", "<cmd>VenvSelect<cr>" },
        { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
}
