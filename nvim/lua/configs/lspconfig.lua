-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- First, create a function that will hold all your custom keymaps
local function setup_custom_keymaps(client, bufnr)
  -- Create a shorter helper function to reduce repetition
  local function map(mode, lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end

  -- Your custom keymaps
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("v", "<C-k>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>')
  map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>')

  -- Safely try to set up lsp_signature
  local ok, signature = pcall(require, "lsp_signature")
  if ok then
    signature.on_attach({
      bind = true,
      floating_window_above_cur_line = true,
      max_width = 120,
    }, bufnr)
  end
end

-- EXAMPLE
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "eslint", "ts_ls", "pylsp", "astro", "zls" , "clangd"}
local nvlsp = require "nvchad.configs.lspconfig"

local function combined_on_attach(client, bufnr)
  -- First run NvChad's on_attach
  nvlsp.on_attach(client, bufnr)
  -- Then run your custom keymaps
  setup_custom_keymaps(client, bufnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = combined_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- TypeScript/JavaScript configuration
lspconfig.tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = combined_on_attach,
  capabilities = nvlsp.capabilities,
})

lspconfig.emmet_ls.setup({
  filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx" },
  on_attach = combined_on_attach,
  capabilities = nvlsp.capabilities,
})

require'lspconfig'.clangd.setup{
  cmd = {
    "clangd",
    "--background-index",
  },
  root_dir = function ()
    return vim.fn.cwd()
  end,
  setting = {
    clangd = {
      compilationDatabasePath = vim.fn.getcwd()
    }
  }
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
