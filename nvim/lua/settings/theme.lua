local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- autocmd("ColorScheme", { pattern="*", command="highlight LineNr ctermbg=none"})
-- autocmd("ColorScheme", { pattern="*", command="highlight Normal ctermbg=none"})
-- autocmd("ColorScheme", { pattern="*", command="highlight NonText ctermfg=Black ctermbg=none"})

-- TabLineSel  active tab page label
-- TabLine     not active tab page label
-- TabLineFill where there are no labels
-- autocmd("ColorScheme", { pattern="*", command="highlight TabLineSel ctermfg=none ctermbg=Blue"})
-- autocmd("ColorScheme", { pattern="*", command="highlight TabLine ctermfg=none ctermbg=none"})
-- autocmd("ColorScheme", { pattern="*", command="highlight TabLineFill ctermfg=Black"})

-- vim.cmd("colorscheme beekai")
vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[AirlineTheme hybrid]]
vim.opt.fillchars = {eob = " "}
