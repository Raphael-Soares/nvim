return {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
        opts.size = 20
        opts.open_mapping = "<C-/>"
        opts.hide_numbers = true
        opts.shade_terminals = true
        opts.shading_factor = 2
        opts.start_in_insert = true
        opts.persist_size = true
        opts.direction = "horizontal"
        opts.close_on_exit = true
        opts.shell = vim.o.shell
        opts.autochdir = true
        opts.float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                background = "Normal",
                border = "Normal",
            },
        }
    end,
}
