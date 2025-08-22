return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = function(_, conf)
        conf.defaults.mappings.i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<Esc>"] = require("telescope.actions").close,
        }

        conf.defaults.file_ignore_patterns = {
            "node_modules/.*",
            "npm%-debug%.log*",
            "yarn%-debug%.log*",
            "yarn%-error%.log*",
            "package%-lock%.json",
            "yarn%.lock",

            "%.git/.*",

            "build/.*",
            "dist/.*",
            "out/.*",
            "target/.*",

            "%.cache/.*",
            "%.next/.*",
            "%.nuxt/.*",
            "%.vuepress/.*",

            "%.log",
            "logs/.*",

            "%.tmp",
            "%.temp",
            "%.swp",
            "%.swo",
            "%.DS_Store",

            "vendor/.*",
            "%.exe",
            "%.dll",
            "%.so",
            "%.dylib",
            "%.class",
            "%.jar",

            "%.png",
            "%.jpg",
            "%.jpeg",
            "%.gif",
            "%.svg",
            "%.ico",

            "%.vscode/.*",
            "%.idea/.*",

            "__pycache__/.*",
            "%.pyc",
            "%.pyo",
            "%.egg%-info/.*",
            "venv/.*",
            "%.venv/.*",
        }

        conf.defaults.hidden = true

        -- 🔑 Adiciona a extensão ui-select
        conf.extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
        }

        return conf
    end,
    config = function(_, conf)
        require("telescope").setup(conf)
        require("telescope").load_extension("ui-select")
    end,
}
