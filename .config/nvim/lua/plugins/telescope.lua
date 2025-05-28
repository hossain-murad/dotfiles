return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      winblend = 50, -- Adjust transparency (0 = opaque, 100 = fully transparent)
    })
  end,
}
