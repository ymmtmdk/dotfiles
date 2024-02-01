return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end
}

--  "williamboman/mason-lspconfig.nvim",
--  "hrsh7th/cmp-nvim-lsp",
--	"hrsh7th/cmp-buffer",
--	"hrsh7th/cmp-path",
--	"hrsh7th/cmp-cmdline",
