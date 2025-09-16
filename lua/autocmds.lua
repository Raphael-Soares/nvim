vim.api.nvim_create_user_command("OilToggle", function()
    local oil_win = nil

    -- procura se alguma janela tem buffer Oil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "oil" then
            oil_win = win
            break
        end
    end

    if oil_win then
        -- se encontrar, fecha a janela
        vim.api.nvim_win_close(oil_win, true)
    else
        -- se não encontrar, abre Oil na sidebar
        vim.cmd("topleft vsplit")
        vim.cmd("vertical resize 30")
        vim.cmd("Oil")
    end
end, {})
