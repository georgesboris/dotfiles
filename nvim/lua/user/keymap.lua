-- Copy and paste from clipboard
vim.keymap.set('v', '<C-c>', '"+y', {})
vim.keymap.set('n', '<C-p>', '"+p', {})

-- Replace all occurrences of visual mode selection
vim.keymap.set('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', {})

-- Telescope Mappings
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', telescope_builtin.git_files, {})
vim.keymap.set('n', '<Leader>fa', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<Leader>fd', telescope_builtin.diagnostics, {})
vim.keymap.set('n', '<Leader>fq', telescope_builtin.quickfix, {})
vim.keymap.set('n', '<Leader>fs', telescope_builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<Leader>fw', telescope_builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<Leader>fp', telescope.extensions.project.project, {})
vim.keymap.set('n', '<Leader>fe', telescope.extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<Leader>fc', '<Cmd>Telescope file_browser path=%p:h<CR>', {})

-- Diagnostics
vim.keymap.set('n', '<Leader>d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<Leader>D', vim.diagnostic.goto_prev, {})

-- Git
vim.keymap.set('n', '<Leader>gg', '<Cmd>FloatermNew --height=0.85 --width=0.8 lazygit<CR>', {})

-- LSP Mappings
-- Are created on the user/lsp.lua file.

-- Utilities
vim.keymap.set('n', '<Leader>o', 'o|> ', {})
vim.keymap.set('n', '<Leader>O', 'O|> ', {})
