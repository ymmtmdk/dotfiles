-- setup lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'williamboman/mason.nvim',
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  --	"hrsh7th/cmp-buffer",
  --	"hrsh7th/cmp-path",
  --	"hrsh7th/cmp-cmdline",
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = "InsertEnter",
  },
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "folke/neoconf.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd[[colorscheme tokyonight-moon]]
    end,
  },
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    --    keys = {
    --      { "<C-S-f>", "<cmd>Neotree toggle<cr>" }
    --    },
    cmd = {
      "Neotree"
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  "dstein64/vim-startuptime",
})

