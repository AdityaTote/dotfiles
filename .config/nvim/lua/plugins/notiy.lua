return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        vim.notify = notify

        -- notify ui config
        notify.setup({
            background_colour = "#000000", -- fix transparency issues
            level = "INFO",       -- default minimum level to display
            render = "default",
            stages = "fade_in_slide_out", -- or "slide", "static", "fade_in_slide_out"
            timeout = 800,
            top_down = true,
            fps = 144,
        })

        -- chnage the title if deault title is empty
        vim.notify = function(msg, level, opts)
            opts = opts or {}
            opts.title = opts.title or "buddy!!"
            notify(msg, level, opts)
        end
    end,
}
