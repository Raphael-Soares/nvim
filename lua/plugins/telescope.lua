return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
        { "<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find Files" },
        { "<leader>p", "<cmd>Telescope registers<CR>", desc = "Mostrar os últimos registros de copiar e colar" },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").oldfiles({
                    cwd_only = true,
                    prompt_title = "Recent Files",
                })
            end,
            desc = "Arquivos Recentes do Projeto",
        },
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
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
