local M = {}

function M.get_sessions()
  local items = {}
  local current_session = vim.fn.system("tmux display-message -p '#S'"):gsub("\n", "")
  local sessions_output = vim.fn.system("tmux list-sessions -F '#S'")
  if sessions_output then
    for session in sessions_output:gmatch("[^\n]+") do
      if session ~= current_session then
        table.insert(items, {
          title = string.format("%s ", session),
          action = function()
            vim.fn.system(string.format("tmux switch-client -t %s", session))
          end,
          key = tostring(#items + 1),
          indent = 2,
        })
      end
    end
  end
  return items
end

return M
