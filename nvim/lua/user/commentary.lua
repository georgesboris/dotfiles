vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.ex", "*.exs" },
    callback = function()
        vim.bo.commentstring = "# %s"
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.elm",
    callback = function()
        vim.bo.commentstring = "-- %s"
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.roc",
    callback = function()
        vim.bo.commentstring = "# %s"
    end,
})
