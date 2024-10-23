return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus

    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " " -- Statusline vazia até o lualine carregar
    else
      vim.o.laststatus = 0 -- Oculta a statusline na página inicial
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons
    vim.o.laststatus = vim.g.lualine_laststatus

    local function get_diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      return gitsigns
          and {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        or nil
    end

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", padding = { left = -1, right = 0 } },
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return LazyVim.ui.fg("Statement")
            end,
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = function()
              return LazyVim.ui.fg("Constant")
            end,
          },
        },
        lualine_y = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = get_diff_source,
          },
        },
        lualine_z = {
          { "location", padding = { left = 0, right = 1 } },
        },
      },
    }

    return opts
  end,
}
