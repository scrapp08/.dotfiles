local opt = vim.opt -- for conciseness

--- Visual
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.showmatch = true
opt.matchtime = 2
opt.colorcolumn = "80"
opt.scrolloff = 8

--- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

opt.wrap = false

--- Search
opt.ignorecase = true
opt.hlsearch = true
opt.smartcase = true
opt.incsearch = true

--- Backup & Undo
opt.swapfile = false
opt.backup = false

opt.undofile = true
opt.undodir = "/Users/edporter/.vim/undodir"

--- Windows
opt.splitright = true
opt.splitbelow = true

--- Commands
opt.showcmd = true
opt.history = 100

--- Misc
vim.cmd("let g:netrw_liststyle = 3")
opt.mouse = "a"
opt.updatetime = 50
