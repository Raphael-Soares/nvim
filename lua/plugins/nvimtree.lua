return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },

    config = function()
        local api = require("nvim-tree.api")

        local function custom_on_attach(bufnr)
            local opts = { buffer = bufnr }

            api.config.mappings.default_on_attach(bufnr)

            local function lefty()
                local node = api.tree.get_node_under_cursor()
                if not node then
                    return
                end

                if node.nodes and node.open then
                    api.node.open.edit()

                else
                    api.node.navigate.parent()
                    api.node.open.edit()
                end
            end

            local function righty()
                local node = api.tree.get_node_under_cursor()
                if not node then
                    return
                end

                    api.node.open.edit()
            end

            vim.keymap.set("n", "h", lefty, opts)
            vim.keymap.set("n", "<Left>", lefty, opts)
            vim.keymap.set("n", "l", righty, opts)
            vim.keymap.set("n", "<Right>", righty, opts)
        end

        dofile(vim.g.base46_cache .. "nvimtree")

        require("nvim-tree").setup({
            on_attach = custom_on_attach,
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = { enable = true },
            },
        })
    end,
}
