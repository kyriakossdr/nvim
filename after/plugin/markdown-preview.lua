-- Set to 1, nvim will open the preview window after entering the Markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 0

-- Set to 1, the nvim will auto close the current preview window when changing
-- from the Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- Set to 1, Vim will refresh Markdown when saving the buffer or
-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
-- move the cursor
-- default: 0
vim.g.mkdp_refresh_slow = 0

-- Set to 1, the MarkdownPreview command can be used for all files,
-- by default, it can be used in Markdown files only
-- default: 0
vim.g.mkdp_command_for_global = 0

-- Set to 1, the preview server is available to others in your network.
-- By default, the server listens on localhost (127.0.0.1)
-- default: 0
vim.g.mkdp_open_to_the_world = 0

-- Use custom IP to open the preview page.
-- Useful when you work in remote Neovim and preview on a local browser.
-- For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
vim.g.mkdp_open_ip = ''

-- Specify the browser to open the preview page
-- for a path with space
-- valid: `/path/with\ space/xxx`
-- invalid: `/path/with\\ space/xxx`
-- default: ''
vim.g.mkdp_browser = ''

-- Set to 1, echo the preview page URL in the command line when opening the preview page
-- default is 0
vim.g.mkdp_echo_preview_url = 0

-- A custom Neovim function name to open the preview page
-- This function will receive URL as a parameter
-- default is empty
vim.g.mkdp_browserfunc = ''

-- Options for Markdown rendering
-- mkit: markdown-it options for rendering
-- katex: KaTeX options for math
-- uml: markdown-it-plantuml options
-- maid: mermaid options
-- disable_sync_scroll: whether to disable sync scroll, default 0
-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
--   middle: means the cursor position is always at the middle of the preview page
--   top: means the Neovim top viewport always shows up at the top of the preview page
--   relative: means the cursor position is always at the relative position of the preview page
-- hide_yaml_meta: whether to hide YAML metadata, default is 1
-- sequence_diagrams: js-sequence-diagrams options
-- content_editable: if enabled, content editable for the preview page, default: v:false
-- disable_filename: if disable filename header for the preview page, default

