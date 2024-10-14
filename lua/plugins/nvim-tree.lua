return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
        local nt = require("nvim-tree")
        nt.setup()

        vim.keymap.set("n", "<C-e>", require("nvim-tree.api").tree.toggle, {
            silent = true,
            desc = "toggle nvim-tree",
        })
    end
}
