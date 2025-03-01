
return {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
          -- set default picker theme to ivy for all pickers
          opts.defaults = require("telescope.themes").get_ivy({
            layout_config = { height = 0.95 },
          })
        end,
  }
