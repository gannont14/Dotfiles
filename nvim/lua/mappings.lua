require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- These keybindings allow moving visual selections up and down
-- The '<' and '>' in the mapping represent the start and end of the visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- jump to last file
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Move to prebious file" })

-- markdown
vim.keymap.set("x", "<leader>mb", "c**<C-r>\"**<Esc>", { desc = "highlight markdown"})
vim.keymap.set("x", "<leader>mb", "c*<C-r>\"*<Esc>", { desc = "italics markdown"})
vim.keymap.set("n", "<leader>me", ":RenderMarkdown enable<CR>", { desc = "enable markdown"})
vim.keymap.set("n", "<leader>md", ":RenderMarkdown disable<CR>", { desc = "disable markdown"})
vim.keymap.set("n", "<leader>mt", ":RenderMarkdown toggle<CR>", { desc = "toggle markdown"})

vim.keymap.set("n", "<leader>mo", "yyp^wC", { desc = "O"})

map({ "n" }, "<leader>tt", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts={
        -- row = 0.35,
        -- col = 0.05,
        -- width = 0.9,
        height = 0.25
    }}
end, { desc = "terminal toggle floating term" })


map({ "n", "t" }, "<C-t>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts={
        -- row = 0.35,
        -- col = 0.05,
        -- width = 0.9,
        height = 0.25
    }}
end, { desc = "terminal toggle floating term" })
