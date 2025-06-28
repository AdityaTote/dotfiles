
-- space as a leader key
vim.g.mapleader = " "

-- close file
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- save file
vim.keymap.set({ 'n', 'v' }, '<leader>s', ':w<CR>', { noremap = true, silent = true })

-- save and exit 
vim.keymap.set({'n', 'v'}, '<leader>wq', ':wq<CR>', { noremap = true, silent = true })

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)
