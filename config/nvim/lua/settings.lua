local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  number = true,
  wrap = false,
  linebreak = true,
  hidden = true,
  showmode = false,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  title = true,
  mouse = "a",
  cursorline = true,
  wildignorecase = true,
  wildmode = "longest:full",
  pumheight = 12,
  signcolumn = "no",
  splitright = true,
  splitbelow = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
