local M = {}

M.setup = function(user_config)
    local auto_exec_group = vim.api.nvim_create_augroup("auto-executable", { clear = true })

    vim.api.nvim_create_autocmd(
        "BufWritePre",
        {
            pattern = "*",
            callback = function()
                vim.b.auto_executable_file_is_new = true
                local d = vim.fn.getreg('%')
                if (d ~= '') then
                    local f = io.open(d, "r")
                    if (f) then
                        io.close(f)
                        vim.b.auto_executable_file_is_new = false
                    end
                end
            end,
            desc = "Make file executable if it has a shebang",
            group = auto_exec_group
        }
    )

    vim.api.nvim_create_autocmd(
        "BufWritePost",
        {
            pattern = "*",
            callback = function()
                local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
                local has_shebang = first_line:sub(1, 2) == "#!"

                if (vim.b.auto_executable_file_is_new == true and has_shebang) then
                    vim.cmd("silent !chmod u+x %")
                end
            end,
            desc = "Make file executable if it has a shebang",
            group = auto_exec_group
        }
    )
end

return M
