local options = {
    ensure_installed = {
        "vue",
        "scss",
        "bash",
        "fish",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "java",
        "typescript",
        "javascript",
        "tsx",
        "css",
    },

    highlight = { enable = true },
    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
