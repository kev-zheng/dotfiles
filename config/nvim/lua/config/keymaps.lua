-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Neo-tree" })

vim.keymap.del("n", "<A-j>") -- Move line down (Normal mode)
vim.keymap.del("n", "<A-k>") -- Move line up (Normal mode)
vim.keymap.del("i", "<A-j>") -- Move line down (Insert mode)
vim.keymap.del("i", "<A-k>") -- Move line up (Insert mode)
vim.keymap.del("v", "<A-j>") -- Move line down (Visual mode)
vim.keymap.del("v", "<A-k>") -- Move line up (Visual mode)
