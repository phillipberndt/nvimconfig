-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- My personal configuration
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = "unnamed"
vim.o.autochdir = true
vim.o.ruler = true
vim.o.number = true
vim.o.hid = true
vim.o.fo = "tcrqn"
vim.o.ts = 4
vim.o.sw = 4
vim.o.et = true
vim.o.wrap = true
vim.o.fdm = "marker"
vim.o.signcolumn = "yes"
vim.g.mapleader = ","

vim.keymap.set({"v", "n", "o"}, "P", "\"+p")
vim.keymap.set({"v", "n", "o"}, "Y", "\"+y")

vim.cmd [[
unmenu PopUp.How-to\ disable\ mouse
]]


-- Load plugins
require("lazy").setup({
  spec = { import = "plugins" },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})


require("auto-executable").setup()
