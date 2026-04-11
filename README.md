# Neovim Config

Fast, practical Neovim setup for daily coding with LSP, completion, formatting, fuzzy finding, Git tools, and clean defaults.

## Why this config

This is for you if you want:

- A lightweight Lua config that is easy to read and customize
- IDE-like coding features without a heavy framework
- Strong support for JS/TS, Python, Lua, and infra files
- Useful keymaps that stay discoverable and consistent

This may not be for you if you prefer a full prebuilt distro with hundreds of defaults enabled by default.

## At a glance

- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Leader key: `Space`
- Format on save: enabled via `none-ls`
- File explorer: `nvim-tree` on the right
- Fuzzy finding: Telescope (`find_files`, `live_grep`, `buffers`)
- Git workflow: `gitsigns` + `lazygit`
- Markdown reading: `render-markdown.nvim`

## Core plugins (grouped)

### LSP & Tooling

| Plugin | Purpose |
| --- | --- |
| `neovim/nvim-lspconfig` | LSP configuration |
| `mason-org/mason.nvim` | Install/manage LSP servers and tools |
| `mason-org/mason-lspconfig.nvim` | Connect Mason with lspconfig |
| `WhoIsSethDaniel/mason-tool-installer.nvim` | Auto-ensure tools/servers |
| `lewis6991/hover.nvim` | Better hover docs (`K`) |

### Completion & Snippets

| Plugin | Purpose |
| --- | --- |
| `hrsh7th/nvim-cmp` | Completion engine |
| `hrsh7th/cmp-nvim-lsp` | LSP source |
| `hrsh7th/cmp-buffer` | Buffer source |
| `hrsh7th/cmp-path` | Path source |
| `L3MON4D3/LuaSnip` | Snippet engine |
| `rafamadriz/friendly-snippets` | Community snippets |
| `saadparwaiz1/cmp_luasnip` | LuaSnip integration |

### Formatting & Diagnostics

| Plugin | Purpose |
| --- | --- |
| `nvimtools/none-ls.nvim` | External formatter/diagnostic bridge |
| `nvimtools/none-ls-extras.nvim` | Extra none-ls sources |
| `jayp0521/mason-null-ls.nvim` | Install none-ls tools through Mason |

### Navigation, UI & Editing

| Plugin | Purpose |
| --- | --- |
| `nvim-telescope/telescope.nvim` | Fuzzy finder |
| `nvim-tree/nvim-tree.lua` | File explorer |
| `nvim-treesitter/nvim-treesitter` | Better syntax parsing/highlighting |
| `nvim-lualine/lualine.nvim` | Statusline |
| `MeanderingProgrammer/render-markdown.nvim` | Rich markdown rendering in buffer |
| `numToStr/Comment.nvim` | Fast comments |
| `lukas-reineke/indent-blankline.nvim` | Indent guides |
| `nvim-mini/mini.nvim` | Pairs + surround |
| `folke/todo-comments.nvim` | TODO/FIXME navigation |
| `reybits/scratch.nvim` | Scratch buffer toggle |

### Git

| Plugin | Purpose |
| --- | --- |
| `lewis6991/gitsigns.nvim` | Git signs in gutter |
| `kdheepak/lazygit.nvim` | Launch LazyGit in Neovim |

## Features you get

- LSP for `ts_ls`, `pyright`, `ruff`, `html`, `cssls`, `tailwindcss`, `dockerls`, `sqlls`, `terraformls`, `jsonls`, `yamlls`, `lua_ls`
- Format on save with Prettier, Stylua, Ruff format, Terraform fmt
- Snippet-aware autocompletion with docs popup
- Fast project navigation using Telescope and `nvim-tree`
- TODO navigation and list views (`TodoTelescope`, `TodoQuickFix`)
- Markdown rendering enhancements (bullets, checkboxes, tables, links)

## Cheatsheet (daily keybindings)

| Key | Daily action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Search text in project |
| `<C-h>` | Toggle/focus file tree |
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Run code action |
| `<leader>g` | Open LazyGit |
| `<C-c>` | Toggle comment |

## Keymaps

Leader: `Space`

### General editing

| Key | Mode | Description |
| --- | --- | --- |
| `<leader>pv` | Normal | Open netrw explorer (`:Ex`) |
| `J` / `K` | Visual | Move selected lines down/up |
| `>` / `<` | Visual | Indent while keeping selection |
| `<C-c>` | Normal/Visual | Toggle line comment |

### Search & files

| Key | Mode | Description |
| --- | --- | --- |
| `<leader>ff` | Normal | Telescope find files |
| `<leader>fg` | Normal | Telescope live grep |
| `<leader>fb` | Normal | Telescope buffers |
| `<C-h>` | Normal | Focus/toggle `nvim-tree` |

### LSP (buffer-local)

| Key | Mode | Description |
| --- | --- | --- |
| `K` | Normal | Hover docs |
| `gd` / `gD` | Normal | Definition / declaration |
| `gr` / `gi` | Normal | References / implementations |
| `<leader>D` | Normal | Type definition |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>e` | Normal | Diagnostic float |
| `<leader>q` | Normal | Diagnostics to location list |

### Git, TODO, scratch

| Key | Mode | Description |
| --- | --- | --- |
| `<leader>g` | Normal | Open LazyGit |
| `]t` / `[t` | Normal | Next/previous TODO |
| `<leader>ft` | Normal | TODO list in Telescope |
| `<leader>fq` | Normal | TODO list in quickfix |
| `<leader>ts` | Normal | Toggle scratch buffer |

### Completion (insert mode)

| Key | Description |
| --- | --- |
| `<C-Space>` | Trigger completion |
| `<Tab>` | Confirm selected completion |
| `<C-b>` / `<C-f>` | Scroll completion docs |
| `<C-e>` | Abort completion |

## Installation

```bash
# backup old config
mv ~/.config/nvim ~/.config/nvim.bak

# clone
git clone <your-repo-url> ~/.config/nvim

# first start (installs plugins automatically)
nvim
```

Recommended prerequisites: `git`, `ripgrep`, a Nerd Font, and Neovim 0.11+.

## Project structure

```text
~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── lazy.lua
    └── plugins/
        ├── lsp-config.lua
        ├── completion.lua
        ├── formatting.lua
        ├── telescope.lua
        ├── tree.lua
        ├── treesitter.lua
        ├── gits.lua
        ├── lualine.lua
        ├── theme.lua
        └── utils.lua
```

## Update plugins

- `:Lazy update` to update
- `:Lazy sync` to install/remove based on specs
- `:Lazy clean` to remove unused plugins

If this repo is versioned, commit `lazy-lock.json` after updates.

## Custom commands and workflows

- `:LazyGit` / `<leader>g` for Git workflow
- `:ScratchToggle` / `<leader>ts` for temporary notes
- Save buffer to auto-format when formatter is available
- `TodoTelescope` and `TodoQuickFix` for task comments

---

This README is generated from the actual Lua config in `lua/config/` and `lua/plugins/`.
