local M = {}

local separators = {
    default = { left = "", right = "" },
    round = { left = "", right = "" },
    block = { left = "█", right = "█" },
    arrow = { left = "", right = "" },
}

local sep_l = separators["block"].left
local sep_r = separators["block"].right

local function stbufnr()
    return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

-- mensagens do LSP
local function lsp_message()
    if rawget(vim, "lsp") then
        for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[stbufnr()] then
                return (vim.o.columns > 100 and client.name .. " ") or " "
            end
        end
    end
end

-- módulo LSP
M.lsp = function()
    if lsp_message() then
        return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#LSP " .. "%#St_pos_text# " .. lsp_message() .. "%#StText#"
    end
    return ""
end

-- módulo Git branch
M.git_branch = function()
    local branch = vim.b.gitsigns_head or ""
    if branch ~= "" then
        local icon = "%#St_cwd_icon# "
        local name = "%#St_cwd_text# " .. branch .. " "
        return "%#St_cwd_sep#" .. sep_l .. icon .. name .. "%#StText#"
    end
    return ""
end

return M
