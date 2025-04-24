return {
    -- LazyVim (escolher tema padrão aqui)
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        },
    },
    --
    -- One Dark
    { "navarasu/onedark.nvim", opts = { style = "darker" } },

    -- Gruvbox
    { "ellisonleao/gruvbox.nvim" },

    -- Gruvbox Material
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- Estilo mais próximo do Gruvbox original
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_disable_italic_comment = false
        end,
    },

    -- Everforest
    { "neanias/everforest-nvim" },

    -- Kanagawa
    { "rebelot/kanagawa.nvim" },

    -- TokyoNight
    { "folke/tokyonight.nvim" },

    -- Catppuccin
    { "catppuccin/nvim" },

    -- Nightfox (com todas as variantes)
    { "EdenEast/nightfox.nvim" },

    -- Monokai Pro
    { "tanvirtin/monokai.nvim" },

    -- Oxocarbon
    { "nyoom-engineering/oxocarbon.nvim" },

    -- Rose Pine
    { "rose-pine/neovim" },
}
