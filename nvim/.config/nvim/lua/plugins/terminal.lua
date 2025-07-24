return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-`>]],
            hide_numbers = true,
            shade_filetypes = {},
            autochdir = false,
            highlights = {
                Normal = { guibg = "#1e1e2e" }, -- example color
                NormalFloat = { link = 'Normal' },
                FloatBorder = { guifg = "#cba6f7", guibg = "#1e1e2e" }, -- example colors
            },
            shade_terminals = true,
            shading_factor = -30,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = true,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
                border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
                width = function()
                    return math.floor(vim.o.columns * 0.7)
                end,
                height = function()
                    return math.floor(vim.o.lines * 0.7)
                end,
                row = function()
                    return math.floor((vim.o.lines - (vim.o.lines * 0.7)) / 2)
                end,
                col = function()
                    return math.floor((vim.o.columns - (vim.o.columns * 0.7)) / 2)
                end,
                winblend = 3,
                zindex = 50,
                title_pos = 'center'
            },
            winbar = {
                enabled = false,
                name_formatter = function(term)
                    return term.name
                end,
            },
            responsiveness = {
                horizontal_breakpoint = 135,
            },
            -- Optional terminal callbacks
            on_create = function(t)
                -- Terminal created
            end,
            on_open = function(t)
                -- Terminal opened
            end,
            on_close = function(t)
                -- Terminal closed
            end,
            on_stdout = function(t, job, data, name)
                -- Process stdout
            end,
            on_stderr = function(t, job, data, name)
                -- Process stderr
            end,
            on_exit = function(t, job, exit_code, name)
                -- Process exit
            end,
        })
    end
}

