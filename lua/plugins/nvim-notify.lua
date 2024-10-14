return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup {
            stages = "fade_in_slide_out",
            timeout = 1500
        }
        vim.notify = notify
    end
}
