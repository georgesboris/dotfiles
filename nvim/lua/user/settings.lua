-- Font for GUI clients
vim.opt.guifont = { 'FiraCode NF' }

-- Folding
-- `zm` fold | `zM` fold all
-- `zr` unfold | `zR` unfold all
-- vim.opt.foldmethod = "indent"

-- Mouse
vim.opt.mouse = 'a'

-- Key Mapping
vim.g.mapleader = " "

-- Tabs as 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Options
-- vim.g.syntax = true
vim.opt.number = true
vim.cmd("set number relativenumber")
vim.opt.hlsearch = false
vim.opt.wrap = false

-- Saves all open buffers in the background and confirms before closing unsaved ones
-- This is useful for preventing the usual annoying confirmation whenever you try to :bd
vim.g.hidden = true
vim.g.confirm = true

-- Autocomplete Options
vim.g.completeopt = "menu, menuone, noselect"

-- Format On Save
vim.api.nvim_create_autocmd("BufWritePre", { command = "lua vim.lsp.buf.formatting_sync()" })

-- ---------------------------------------------------------------------
-- Themes
-- ---------------------------------------------------------------------

-- Nightfox
-- vim.cmd("colorscheme nightfox")

-- Tokio
-- styles : day | night | storm
-- vim.g.tokyonight_style = "storm"
-- vim.cmd("colorscheme tokyonight")

-- Catppuccin
-- styles : latte | frappe | macchiato | mocha
vim.g.catppuccin_flavour = "macchiato"
require("catppuccin").setup()
vim.cmd("colorscheme catppuccin")

-- Make backgrounds transparent
-- vim.cmd("hi Normal guibg=none ctermbg=none")
-- vim.cmd("hi LineNr guibg=none ctermbg=none")
-- vim.cmd("hi Folded guibg=none ctermbg=none")
-- vim.cmd("hi NonText guibg=none ctermbg=none")
-- vim.cmd("hi SpecialKey guibg=none ctermbg=none")
-- vim.cmd("hi VertSplit guibg=none ctermbg=none")
-- vim.cmd("hi SignColumn guibg=none ctermbg=none")
-- vim.cmd("hi EndOfBuffer guibg=none ctermbg=none")

-- ---------------------------------------------------------------------

-- Unrecognized filetypes

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = "*.pcss",
        command = "set syntax=css"
    })

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = "*.roc",
        command = "set syntax=elm"
    })

-- Neovide
vim.g.neovide_remember_window_size = true
vim.g.termguicolors = true
