return {
    "romgrk/barbar.nvim",
    version = "^1.0.0",

    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    init = function()
        vim.g.barbar_auto_setup = false
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

        --------------------------------------------------
        -- BUFFER NAVIGATION KEYMAPS
        --------------------------------------------------
        vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { silent = true, desc = "Previous Buffer" })
        vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { silent = true, desc = "Next Buffer" })
        vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { silent = true, desc = "Move Buffer Left" })
        vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { silent = true, desc = "Move Buffer Right" })
        vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { silent = true, desc = "Pin Buffer" })
        vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { silent = true, desc = "Close Buffer" })
        vim.keymap.set("n", "<Space>bb", "<Cmd>BufferPick<CR>", { silent = true, desc = "Pick Buffer" })

        --------------------------------------------------
        -- SPLITS (CONFLICT-FREE)
        --------------------------------------------------
        vim.keymap.set("n", "<C-\\>", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
        vim.keymap.set("n", "<C-->", ":split<CR>", { silent = true, desc = "Horizontal Split" })

        --------------------------------------------------
        -- SPLIT NAVIGATION
        --------------------------------------------------
        vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move Left" })
        vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move Right" })
        vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move Down" })
        vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move Up" })
    end,
}
