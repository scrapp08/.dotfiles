vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jh", "<ESC>", { desc = "Exit insert mode with jh" })

keymap.set("n", ";", ":", { desc = "Use ; to trigger command" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }
