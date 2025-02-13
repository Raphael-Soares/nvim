return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvimtools/hydra.nvim",
    },
    opts = {

        hint_config = false,
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
        {
            mode = { "v", "n" },
            "<Leader>d",
            "<cmd>MCstart<cr>",
            desc = "Create a selection for selected text or word under the cursor",
        },
    },
}
