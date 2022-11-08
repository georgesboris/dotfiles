vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "floaterm",
        command = "setlocal winblend=10"
    })
