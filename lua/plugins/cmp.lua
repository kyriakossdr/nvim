return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ---Render style
      ---@usage 'background'|'foreground'|'virtual'
      render = "background",

      ---Highlight hex colors, e.g. '#FFFFFF'
      enable_hex = true,

      ---Highlight short hex colors e.g. '#fff'
      enable_short_hex = true,

      ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
      enable_rgb = true,

      ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
      enable_hsl = true,

      ---Highlight CSS variables, e.g. 'var(--testing-color)'
      enable_var_usage = true,

      ---Highlight named colors, e.g. 'green'
      enable_named_colors = true,

      ---Highlight tailwind colors, e.g. 'bg-blue-500'
      enable_tailwind = true,
    }
  },
  {
    "L3MON4D3/LuaSnip",
		version = "2.*",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
    build = (function()
			-- Build Step is needed for regex support in snippets.
			-- This step is not supported in many windows environments.
			-- Remove the below condition to re-enable on windows.
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
		config = function()
			local ls = require("luasnip")

			-- Configuration
			ls.config.setup({
				-- Auto-exit snippets when cursor moves outside region
				region_check_events = "CursorMoved,CursorHold,InsertEnter",
				-- Clean up deleted snippets
				delete_check_events = "TextChanged",
				-- Update snippet dependents on text changes
				update_events = "TextChanged,TextChangedI",
				-- Allow jumping back to previous snippet nodes
				history = true,
				-- Enable autosnippets (snippets that expand automatically)
				enable_autosnippets = true,
			})

			-- Load snippet sources
			-- VSCode-style snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

      -- Keymaps
			-- Tab/S-Tab handled by nvim-cmp for expansion and jumping
			-- C-E for cycling through choice nodes
			vim.keymap.set({ "i", "s" }, "<C-e>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { desc = "LuaSnip: Cycle choice node forward" })

			vim.keymap.set({ "i", "s" }, "<C-b>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end, { desc = "LuaSnip: Cycle choice node backward" })
		end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local format_item_with_lspkind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
				menu = {
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					path = "[Path]",
					luasnip = "[Snippet]",
					nvim_lsp_signature_help = "[Signature]",
				},
			})

      cmp.setup({
        snippet = {
          expand = function(args)
            local ok, err = pcall(luasnip.lsp_expand, args.body)
            if not ok then
              vim.notify("Snippet parse error: " .. tostring(err), vim.log.levels.WARN)
            end
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.close(),
          ["<C-c>"] = cmp.mapping.abort(), -- close completion window
          ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select }),
          ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select }),
          ['<tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        completion = { completeopt = "menu,menuone,noinsert" },

        sources = cmp.config.sources({
					{ name = "nvim_lsp", group_index = 1 }, -- lsp
					{ name = "buffer", max_item_count = 5, group_index = 2 }, -- text within current buffer
					{ name = "path", max_item_count = 3, group_index = 3 }, -- file system paths
					{ name = "luasnip", max_item_count = 3, group_index = 5 }, -- snippets
					{ name = "nvim-lsp-signature-help" },
				}),

        formatting = {
          expandable_indicator = true,
          format = function (entry, item)
            local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind }) 
            item = format_item_with_lspkind(entry, item)

            if color_item.abbr_hl_group then
              item.kind_hl_group = color_item.abbr_hl_group
              item.kind = color_item.abbr
            end

            return item
          end
        },

        experimental = {
          ghost_text = true
        }
      })
    end
  }
}
