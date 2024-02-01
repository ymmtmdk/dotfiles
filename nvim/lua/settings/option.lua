local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  --	completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  --	backupskip = { "/tmp/*", "/private/tmp/*" },
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "yes",
  --	wrap = false,
  --	winblend = 0,
  --	wildoptions = "pum",
  --	pumblend = 5,
  --	scrolloff = 8,
  --	sidescrolloff = 8,
}

vim.opt.shortmess:append("c")
vim.opt.fillchars = {eob = " "}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.pumblend = 0
