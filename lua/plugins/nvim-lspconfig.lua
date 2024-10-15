return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
        local attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, desc = "Go to definition"})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, desc = "Show references"})
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {buffer = bufnr, desc = "Auto-format code"})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr, desc = "Hover"})
        end

        local lsp = require("lspconfig")
        if vim.fn.executable("pylsp") then
            lsp["pylsp"].setup {
                settings = {
                    pylsp = {
                        plugins = {
                            flake8 = {
                                maxLineLength = 250
                            },
                            pycodestyle = {
                                maxLineLength = 250
                            }
                        }
                    }
                },
                on_attach = on_attach
            }
        end
        if vim.fn.executable("clangd") then
            lsp["clangd"].setup { filetypes = {"c", "cpp", "cc", "h" }, on_attach = attach }
        end
    end,
}
