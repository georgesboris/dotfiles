-- Install language servers through 'williamboman/nvim-lsp-installer'

require("nvim-lsp-installer").setup {}

-- Grab autocmd capabilities from cmp_nvim_lsp

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Add nvim-ufo capabilitiers for folding

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- Add key bindings


local on_attach = function(_, buffern)
    local buffer_opts = { noremap = true, silent = true, buffer = buffern }

    vim.api.nvim_create_autocmd("BufWritePre", { command = "silent! lua vim.lsp.buf.formatting()" })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, buffer_opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buffer_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buffer_opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buffer_opts)

    vim.keymap.set('n', '<Leader>lr', "<Cmd>LspRestart<CR>", buffer_opts)
    vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, buffer_opts)
    vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, buffer_opts)
    vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.formatting, buffer_opts)
end

-- Init language servers

require('lspconfig').elmls.setup {
    capabilities = capabilities,
    on_attach = function(a, buffern)
        on_attach(a, buffern)
        local buffer_opts = { noremap = true, silent = true, buffer = buffern }

    end,
}

require('lspconfig').elixirls.setup {
    capabilities = capabilities,
    on_attach = function(a, buffern)
        on_attach(a, buffern)

        local floaterm_name = 'extest'
        local floaterm_settings = '--name=' .. floaterm_name .. ' --autoclose=0'

        --
        -- Run mix test on current cursor
        --
        vim.keymap.set('n', '<Leader>tl', function()
            local line = vim.fn.line('.')
            local filepath = vim.fn.getreg('%')
            vim.cmd('FloatermNew ' .. floaterm_settings .. ' mix test ' .. filepath .. ':' .. line)
        end)

        --
        -- Run mix test on current file
        --
        vim.keymap.set('n', '<Leader>tf', function()
            local filepath = vim.fn.getreg('%')
            vim.cmd('FloatermNew ' .. floaterm_settings .. ' mix test ' .. filepath)
        end)

        --
        -- Run mix test on the whole project
        --
        vim.keymap.set('n', '<Leader>ta', function()
            vim.cmd('FloatermNew ' .. floaterm_settings .. ' mix test')
        end)
    end,
}

require('lspconfig').pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig').sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
                disable = { 'lowercase-global' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

require('lspconfig').tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
