local nvim_lsp = require('lspconfig')

nvim_lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
    on_attach = function(client, bufnr)
        local buf_map = function(bufnr, mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Keybindings LSP
        buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        buf_map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    end,
})

