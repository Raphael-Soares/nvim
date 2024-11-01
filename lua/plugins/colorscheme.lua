-- Just my theme

return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    {
        "f4z3r/gruvbox-material.nvim",
        name = "gruvbox-material",
        lazy = false,
        priority = 1000,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
