-- Simple configs
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugins inserting
require("config.lazy")
require("lsp.python")
require("lsp.rust")

-- Configurações do Telescope
local status, builtin = pcall(require, "telescope.builtin")
if not status then
    vim.notify("Telescope não encontrado!")
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: Buscar arquivos" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: Buscar texto" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope: Buffers abertos" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope: Ajuda" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Telescope: Arquivos recentes" })
vim.keymap.set("i", "<C-d>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true })
-- Copiar para o clipboard com Ctrl+C
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })

-- Colar do clipboard com Ctrl+V
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })

-- Copiar seleção no modo visual
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Colar no modo de inserção
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })

-- Abrir file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
