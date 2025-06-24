return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = true,                                                            -- Lazy load for better performance
    cmd = { "Neotree" },                                                    -- Load when these commands are run
    keys = { "<C-b>", "<leader>e" },                                        -- Load when these keys are pressed
    opts = {
        sources = { "filesystem", "buffers", "git_status", "diagnostics" }, -- Enable more sources
        window = {
            position = "left",
            width = 30,
        },
        filesystem = {
            follow_current_file = { enabled = true }, -- Auto-focus on the current file
            filtered_items = {
                visible = true,                       -- Show hidden files by default
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        default_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "",
            },
        },
        event_handlers = {
            {
                event = "file_opened",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)

        -- Toggle Neo-tree
        vim.keymap.set("n", "<C-b>", function()
            vim.cmd("Neotree toggle right")
        end, { desc = "Toggle Neo-tree", noremap = true, silent = true })

        -- Focus Neo-tree quickly
        vim.keymap.set("n", "<leader>e", function()
            vim.cmd("Neotree focus filesystem right")
        end, { desc = "Focus Neo-tree", noremap = true, silent = true })
    end,
}
