return {
    "snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                header = require("config.banner"),
            },
        },
        picker = {
            sources = {
                explorer = {
                    layout = {
                        auto_hide = { "input" },
                    },
                },
            },
        },
    },
}
