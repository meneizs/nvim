return {
	-- Colorscheme definition.
	{
		"loctvl842/monokai-pro.nvim", -- Colorscheme git path
		lazy = false, -- Load before running
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				devicons = true,
				filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				background_clear = { "toggleterm", "telescope", "notify" },
			})
			vim.cmd([[colorscheme monokai-pro]]) -- setting the colorscheme
			-- Removendo o fundo para o grupo de destaque Normal
			vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none", bg = "none" })
			-- Remover o fundo para a janela não-focada (opcional)
			vim.api.nvim_set_hl(0, "NormalNC", { ctermbg = "none", bg = "none" })
		end,
	},

	{
		-- status line
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("lualine").setup({ options = { theme = "monokai-pro" } })
		end,
	},

	-- LSP-Config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("lspconfig").pyright.setup({})
			require("lspconfig").rust_analyzer.setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Para integrar com LSP
			"hrsh7th/cmp-buffer", -- Para completamento de buffer
			"hrsh7th/cmp-path", -- Para completar caminhos de arquivo
			"hrsh7th/cmp-cmdline", -- Para completar comandos no Neovim
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				-- Configuração básica
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- Se você estiver usando o plugin vsnip para snippets
					end,
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20, -- Tamanho do terminal
				hide_numbers = true, -- Não mostrar números das linhas no terminal
				shade_filetypes = {},
				shade_terminals = true,
				start_in_insert = true, -- Iniciar sempre em modo de inserção
			})
			vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Abrir terminal" })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })
			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
			view = {
				width = 30, -- Largura fixa de 30 colunas
				side = "right", -- Posição (opcional: "left" ou "right")
			},
			renderer = {
				highlight_opened_files = "all",
				background = {
					{ attr = "bg", highlight = "Normal" }
				},
			},
		})

		-- Transparência do fundo
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

		-- Atalho para abrir/fechar (ex: <leader>e)
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
		end,
	},
}
