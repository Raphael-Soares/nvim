return {
    {
        "navarasu/onedark.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            style = "darker",
        },
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            -- Estilo mais próximo do Gruvbox original
            vim.g.gruvbox_material_background = "medium" -- opções: 'hard', 'medium', 'soft'
            vim.g.gruvbox_material_foreground = "original" -- opções: 'material', 'mix', 'original'
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_statusline_style = "default"
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            vim.g.gruvbox_material_sign_column_background = "none"
            vim.g.gruvbox_material_visual = "grey background"
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox-material",
        },
    },
}
