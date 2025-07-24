return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
        -- Markdown Preview Keymap
        vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
    end,
}

