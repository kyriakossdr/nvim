return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function ()
      require("noice").setup({
        views = {
          hover = { border = { style = "rounded" }, max_width = 100, max_height = 70, win_options = { wrap = true } },
          split = { enter = true, win_options = { wrap = true } },
          notify = { max_width = 80 },
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        routes = {
          {
            filter = {
              event = "notify",
              find = "No information available",
            },
            opts = { skip = true },
          }
        },
        opts = function(_, opts)
          local focused = true
          vim.api.nvim_create_autocmd("FocusGained", {
            callback = function()
              focused = true
            end,
          })
          vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
              focused = false
            end,
          })
          table.insert(opts.routes, 1, {
            filter = {
              cond = function()
                return not focused
              end,
            },
            view = "notify_send",
            opts = { stop = false },
          })
          opts.commands = {
            all = {
              view = "split",
              opts = { enter = true, format = "details" },
              filter = {},
            },
          }
          opts.presets.lsp_doc_border = true
        end,
      })

    end
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 4000,
      background_colour = "#0a0a0a",
      animation = "fade_in_slide_out",
      render = "wrapped-compact",
      top_down = false,
    },
    config = function(_, opts)
      require("notify").setup(opts)
    end,
  },
}
