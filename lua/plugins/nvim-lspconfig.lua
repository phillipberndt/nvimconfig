return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
        local on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, desc = "Go to definition"})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, desc = "Show references"})
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {buffer = bufnr, desc = "Auto-format code"})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr, desc = "Hover"})
        end

        if vim.fn.executable("pylsp") then
            vim.lsp.config("pylsp", {
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
            })
            vim.lsp.enable("pylsp")
        end
        if vim.fn.executable("clangd") then
            vim.lsp.config("clangd", { filetypes = {"c", "cpp", "cc", "h" }, on_attach = attach })
            vim.lsp.enable("clangd")
        end
        if vim.fn.executable("gopls") then
            vim.lsp.config("gopls", { on_attach = attach })
            vim.lsp.enable("gopls")
        end
        if vim.fn.executable("rust-analyzer") then
            vim.lsp.config("rust_analyzer", { on_attach = attach })
            vim.lsp.enable("rust_analyzer")
        end
    end,
}
