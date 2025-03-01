return {
  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "htnsueoaidgcrlypmbkjvx",
      uppercase_labels = true,
    },
    keys = {
      {
        "<leader>fj", -- the keybinding
        function() -- the function to be executed
          require("hop").hint_words() -- call the hop.nvim function
        end,
        mode = { "n", "x", "o" }, -- keybinding will work in normal, visual, and operator modes
        desc = "Hop to word", -- description for the keybinding
      },
    },
  },
}
