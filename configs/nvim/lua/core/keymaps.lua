vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jh", "<ESC>", { desc = "Exit insert mode with jh" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
