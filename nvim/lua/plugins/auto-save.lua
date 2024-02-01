return {
  "ymmtmdk/auto-save.nvim",
  lazy = false,
  config = function()
    require("auto-save").setup {
      debounce_delay = 500,
    }
  end
}
