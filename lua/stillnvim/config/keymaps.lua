-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", {
    desc = "Save file"})

-- Quit Neovim
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", {
    desc = "Quit Neovim"})

-- Save and quit
vim.keymap.set("n", "<leader>x", "<cmd>wq<CR>", {
    desc = "Save and quit"})

-- Clear search highlights
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlights"})

-- Toggle file explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer"})
