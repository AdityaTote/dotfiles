return {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false -- Required for manual setup
    end,
    config = function()
        require("barbar").setup({
            animation = true,
            auto_hide = false,
            tabpages = true,
            clickable = true,
            exclude_ft = { "markdown" },
            exclude_name = { "NvimTree" },
            icons = {
                buffer_index = true,
                filetype = { enabled = true },
                separator = { left = "▎", right = "" },
                modified = { button = "●" },
                pinned = { button = "車", filename = true },
            },
            maximum_padding = 2,
            minimum_padding = 1,
            maximum_length = 30,
            semantic_letters = true,
            letters = "asdfjkl;ghnmxcvbziowerutyqp",
            no_name_title = "[No Name]",
        })

        -- Keymaps (fully working)
        vim.keymap.set(
            "n",
            "<A-,>",
            "<Cmd>BufferPrevious<CR>",
            { noremap = true, silent = true, desc = "Previous Buffer" }
        )
        vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
        vim.keymap.set(
            "n",
            "<A-<>",
            "<Cmd>BufferMovePrevious<CR>",
            { noremap = true, silent = true, desc = "Move Buffer Left" }
        )
        vim.keymap.set(
            "n",
            "<A->>",
            "<Cmd>BufferMoveNext<CR>",
            { noremap = true, silent = true, desc = "Move Buffer Right" }
        )
        vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true, desc = "Pin Buffer" })
        vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true, desc = "Close Buffer" })
        vim.keymap.set("n", "<Space>bb", "<Cmd>BufferPick<CR>", { noremap = true, silent = true, desc = "Pick Buffer" })

        -- split tabs key map's
        -- Vertical split
        vim.keymap.set("n", "<C-s>", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })

        -- Horizontal split
        vim.keymap.set("n", "<C-h>", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })

        -- Navigate splits
        vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to Left Split" })
        vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to Right Split" })
        vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to Bottom Split" })
        vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to Top Split" })
    end,
}
