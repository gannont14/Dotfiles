-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
  -- transparency = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.ui = {
  telescope = { 
    enabled = false 
  },

  tabufline = {
    enabled = false,
  },
}
-- M.plugins = {
--     {
--       "nvim-telescope/telescope.nvim",
--       opts = {
--         defaults = {
--             layout_strategy = "vertical",
--             layout_config = {
--                 height = 0.95,
--                 prompt_position = "bottom",
--                 vertical = {
--                     mirror = true,
--                     preview_cutoff = 0,
--                 },
--             },
--         },
--       },
--     },
-- }

return M
