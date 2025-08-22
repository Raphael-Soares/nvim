return {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp", -- Use o branch com suporte a regex
    lazy = false, -- Carrega o plugin na inicialização
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", -- Opcional, mas útil para debugging
        "mfussenegger/nvim-dap-python", -- Opcional, se você usa DAP com Python
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
        { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
    opts = {
        -- Exemplo de configuração (ajuste conforme seu projeto):
        -- search_venv_managers = { "poetry", "pipenv", "pyenv", "virtualenvs" },
        -- search_workspace = true,
    },
}
