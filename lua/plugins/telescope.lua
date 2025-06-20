return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim", -- Adicione esta dependência
    },
    keys = {
        { "<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find Files" },
        { "<leader>p", "<cmd>Telescope registers<CR>", desc = "Mostrar os últimos registros de copiar e colar" },
        { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Arquivos Recentes" },
    },
    opts = function(_, conf)
        conf.defaults = vim.tbl_deep_extend("force", conf.defaults or {}, {
            mappings = {
                i = {
                    ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                    ["<Esc>"] = require("telescope.actions").close,
                },
            },
            file_ignore_patterns = {
                "target",
                "%.class",
                "%.git",
                "%.jar",
            },
        })

        return conf
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        -- Carregar a extensão ui-select se disponível
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
