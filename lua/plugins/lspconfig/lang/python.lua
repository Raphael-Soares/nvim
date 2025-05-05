local M = {}

local function set_python_path(path)
    local clients = vim.lsp.get_clients({
        bufnr = vim.api.nvim_get_current_buf(),
        name = "pyright",
    })
    for _, client in ipairs(clients) do
        if client.settings then
            client.settings.python = vim.tbl_deep_extend("force", client.settings.python, { pythonPath = path })
        else
            client.config.settings =
                vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
        end
        client.notify("workspace/didChangeConfiguration", { settings = nil })
    end
end

M.setup = function()
    local lspconfig = require("lspconfig")
    local nvlsp = require("nvchad.configs.lspconfig")

    lspconfig.pyright.setup({
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern(
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git"
        ),
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "openFilesOnly",
                },
            },
        },
        on_attach = function(client, bufnr)
            nvlsp.on_attach(client, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
                client:request("workspace/executeCommand", {
                    command = "pyright.organizeimports",
                    arguments = { vim.uri_from_bufnr(bufnr) },
                })
            end, { desc = "Organize Imports" })

            vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", function(opts)
                set_python_path(opts.args)
            end, {
                desc = "Reconfigure pyright with the provided python path",
                nargs = 1,
                complete = "file",
            })
        end,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

return M
