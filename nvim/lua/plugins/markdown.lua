return {
    'MeanderingProgrammer/render-markdown.nvim',
    cmd = { 'RenderMarkdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    config = function()
        -- First clear any existing Obsidian UI settings
        require('obsidian').get_client().opts.ui.enable = false
        vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()['ObsidianUI'], 0, -1)

        -- Setup the plugin
        require('render-markdown').setup({
            highlight = {
                enable = true,
                bold = '@markup.strong',
                italic = '@markup.italic',
            },
            heading = {
                enable = true,
                sign = false,
            }
        })

        -- Set up an autocmd to apply highlights after the colorscheme is loaded
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.api.nvim_command('highlight @markup.strong guifg=#d19a66 gui=bold')
                vim.api.nvim_command('highlight @markup.italic guifg=#98c379 gui=italic')
            end,
        })

        -- Also apply the highlights immediately
        vim.api.nvim_command('highlight @markup.strong guifg=#d19a66 gui=bold')
        vim.api.nvim_command('highlight @markup.italic guifg=#98c379 gui=italic')

        -- Add keymaps for markdown files only
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                -- Map for bolding text in visual mode using vim's built-in text objects
                vim.keymap.set("x", "<leader>mb", "c**<C-r>\"**<Esc>",
                    { buffer = true, desc = "Make text bold", silent = true })
            end
        })
    end,
}
