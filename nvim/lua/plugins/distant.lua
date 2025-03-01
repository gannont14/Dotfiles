return {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    lazy = false,
    enable = false,
    config = function()
        require('distant'):setup()
    end
}
