local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "pylsp"
})

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['pylsp'] = { 'py', 'python' }
    }
})

require('lspconfig').pylsp.setup({
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                flake8 = { enabled = true },
                pyls_black = { enabled = true },
                isort = { enabled = true, profile = "black" }
            }
        }
    }
})

require('lspconfig').tsserver.setup({
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    end
});

lsp.on_attach(function(client, bufnr)
end)

lsp.skip_server_setup({ "rust_analyzer" })

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local rt = require("rust-tools");
rt.setup({
    server = {
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        end
    }
})
