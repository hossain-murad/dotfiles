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

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
    -- Override the tokyonight.nvim plugin configuration
    {
      "folke/tokyonight.nvim",
      lazy = false, -- Ensure the plugin is loaded immediately
      priority = 1000, -- High priority to load it first
      config = function()
        require("tokyonight").setup({
          transparent = true, -- Enable transparency
          style = "storm", -- You can choose other styles like "night", "day", etc.
          styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
          },
          sidebars = { "qf", "vista_kind", "terminal", "packer" },
          dim_inactive = false,
          lualine_bold = false,
        })
        vim.cmd("colorscheme tokyonight") -- Set the colorscheme
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
