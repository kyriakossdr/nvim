return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", config = true },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			enabled = false,
			opts = {
				notification = {
					window = {
						winblend = 0,
						border = "single",
					},
				},
				ignore = {
					"ruff",
					"pyright",
				},
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		"lewis6991/hover.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				-- helper func to define mappings
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", require("hover").open, "Hover Docs")
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>e", vim.diagnostic.open_float, "Show Error/Diagnostic")
				map("<leader>q", vim.diagnostic.setloclist, "Open Quickfix diagnostics")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			ts_ls = {},
			ruff = {},
			ty = {},
			html = {},
			cssls = {},
			tailwindcss = {},
			dockerls = {},
			sqlls = {},
			terraformls = {},
			jsonls = {},
			yamlls = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
						format = {
							enable = false,
						},
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for server, conf in pairs(servers) do
			conf.capabilities = vim.tbl_deep_extend("force", {}, capabilities, conf.capabilities or {})

			vim.lsp.config(server, conf)
			vim.lsp.enable(server)
		end
	end,
}
