return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", desc = "Buscar arquivos (Find Files)" },
    },
    opts = function(_, conf)
        conf.defaults = vim.tbl_deep_extend("force", conf.defaults or {}, {
            mappings = {
                i = {
                    ["<C-j>"] = require("telescope.actions").move_selection_next,
                    ["<Esc>"] = require("telescope.actions").close,
                },
            },
            file_ignore_patterns = {
                "target", -- Ignorar a pasta `target`
                "%.class", -- Ignorar arquivos `.class`
                "%.git", -- Ignorar arquivos `.git`
                "%.jar", -- Ignorar arquivos `.jar`
            },
        })

        return conf
    end,
}
