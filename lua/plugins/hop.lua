return {
    "smoka7/hop.nvim",
        event = "VeryLazy",
        config = function()
            local hop = require("hop")
            hop.setup {
                case_insensitive = true,
                char2_fallback_key = "<CR>",
                quit_key = "<Esc>"
            }

            vim.keymap.set({"n", "v", "o"}, "F", "", {
                silent = true,
                noremap = true,
                callback = function()
                    hop.hint_char2()
                end
            })
        end
}
