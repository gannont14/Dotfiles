-- -- Add this to your Neovim configuration
-- local function CleanupBuffer()
--   local current_buffer = vim.fn.bufnr "%"
--   local buffers = vim.fn.getbufinfo { buflisted = 1 }
--   local to_keep = {}
--
--   for _, buf in ipairs(buffers) do
--     -- Use the modern way to get buffer options
--     local buf_type = vim.bo[buf.bufnr].buftype
--     local buf_name = vim.api.nvim_buf_get_name(buf.bufnr)
--
--     -- Keep buffers that are:
--     -- 1. Currently displayed
--     -- 2. Modified and need saving
--     -- 3. The current buffer
--     -- 4. Special buffers (like Harpoon)
--     if
--       buf.hidden == 0
--       or buf.changed == 1
--       or buf.bufnr == current_buffer
--       or buf_type == "prompt"
--       or buf_name:match "harpoon"
--       or buf_type == "nofile"
--     then
--       to_keep[buf.bufnr] = true
--     end
--   end
--
--   for _, buf in ipairs(buffers) do
--     if not to_keep[buf.bufnr] and vim.api.nvim_buf_is_valid(buf.bufnr) then
--       pcall(vim.api.nvim_buf_delete, buf.bufnr, { force = false })
--     end
--   end
-- end
--
-- -- Set up an autocommand to clean up buffers after jumping
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     -- Don't run cleanup for special buffers
--     local buf_type = vim.bo.buftype
--     local buf_name = vim.fn.expand "%"
--
--     if buf_type == "" and not buf_name:match "harpoon" then
--       vim.defer_fn(CleanupBuffer, 100)
--     end
--   end,
-- })
--
-- -- Add a keybinding to manually clean up buffers
-- vim.keymap.set("n", "<leader>bc", CleanupBuffer, { noremap = true, silent = true })
