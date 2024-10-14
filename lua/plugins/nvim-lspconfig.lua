return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
        local lsp = require("lspconfig")
        if vim.fn.executable("pylsp") then
            lsp["pylsp"].setup { settings = {} }
        end
        if vim.fn.executable("clangd") then
            lsp["clangd"].setup { filetypes = {"c", "cpp", "cc", "h" } }
        end
    end,
}
