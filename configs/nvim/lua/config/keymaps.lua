local keymap = vim.keymap -- for conciseness

--- General
vim.g.mapleader = " " -- set leader key to space

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jh" })

keymap.set("n", "Q", "<Nop>", { desc = "Unbind command mode" })

--- Movement
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "keep cursor at start of line when jumping down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "keep cursor at start of line when jumping up" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection up a line" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection down a line" })

--- Search
keymap.set("n", "n", "nzzzv", { desc = "keep next search term in middle of screen" })
keymap.set("n", "N", "Nzzzv", { desc = "keep previous search term in middle of screen" })
keymap.set("n", "<Leader>nh", ":nohl<CR>", { desc = "clear search highlights" })

--- Copy & Paste
keymap.set("x", "<Leader>p", '"_dP', { desc = "paste over selection whilst maintaining paste buffer" })

keymap.set("n", "<Leader>y", '"+y', { desc = "yank to system clipboard" })
keymap.set("v", "<Leader>y", '"+y', { desc = "yank to system clipboard" })
keymap.set("n", "<Leader>Y", '"+Y', { desc = "yank end of line to system clipboard" })

--- Misc
keymap.set("n", "<Leader>d", '"_d', { desc = "delete to void register" })
keymap.set("v", "<Leader>d", '"_d', { desc = "delete to void register" })

keymap.set("n", "J", "mzJ`z", { desc = "keep cursor at start of line when joining lines" })

keymap.set("n", "<Leader>o", "o<Esc>", { desc = "create new line below without going into insert mode" })
keymap.set("n", "<Leader>O", "O<Esc>", { desc = "create new line above without going into insert mode" })

keymap.set("n", "<Leader>+", "<C-a>", { desc = "increment number" })
keymap.set("n", "<Leader>-", "<C-x>", { desc = "decrement number" })

keymap.set(
	"n",
	"<Leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor" }
)
