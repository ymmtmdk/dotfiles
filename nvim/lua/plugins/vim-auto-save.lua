return {
  'vim-scripts/vim-auto-save',
  lazy = false,
  config = function()
    vim.g.auto_save = 1
    -- vim.g.auto_save_silent = 1
    vim.g.auto_save_no_updatetime = 1  --  " do not change the 'updatetime' option
    vim.opt.updatetime = 1000
    vim.g.auto_save_in_insert_mode = 0 --  " do not save while in insert mode
  end
}
