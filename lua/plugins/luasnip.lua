return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = {
    {
      "honza/vim-snippets",
      config = function()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end
    }
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  }
}
