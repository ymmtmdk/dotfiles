--    _      _ __    __
--   (_)__  (_) /_  / /_ _____ _
--  / / _ \/ / __/ / / // / _ `/
-- /_/_//_/_/\__(_)_/\_,_/\_,_/
--

if vim.g.vscode then
  require('core/vscode')
else
  require('core/options')
  require('core/keymaps')
  require('core/autocmd')
  require('core/lazyvim')
end
