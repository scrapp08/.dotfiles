vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

----------------------------------------
---				General				 ---
----------------------------------------

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.matchtime = 2
opt.scrolloff = 8
opt.updatetime = 50

----------------------------------------
---				Visual				 ---
----------------------------------------

opt.termguicolors = true -- true colour terminal
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.relativenumber = true -- show relative line numbers
opt.number = true -- show absolute line number on cursor line
opt.cursorline = true -- highlight the current cursor line

opt.ruler = true -- add ruler
opt.showmode = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true
opt.incsearch = true

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

----------------------------------------
---		  	Backup & Undo	     	 ---
----------------------------------------

opt.swapfile = false
opt.backup = false
