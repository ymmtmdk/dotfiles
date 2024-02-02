return {
  cmd = "NvimTreeToggle",
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      api.node.open.default_edit = api.node.open.edit
      -- override defualt edit
      api.node.open.edit = api.node.open.tab
    end

    require("nvim-tree").setup({
      view = {
        width = 38,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = false,
        },
        highlight_git = true,
        highlight_opened_files = "name",
        icons = {
          glyphs = {
            git = {
              unstaged = "!",
              renamed = "»",
              untracked = "?",
              deleted = "✘",
              staged = "✓",
              unmerged = "",
              ignored = "◌",
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      on_attach = my_on_attach,
    })
  end,
}
