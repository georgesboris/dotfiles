local telescope = require("telescope")

telescope.setup({
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = true,
        },
    }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('project')
