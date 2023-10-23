require'ayu'.setup({
  mirage = false,
  overrides = {
    Normal = { bg = "None" },
    ColorColumn = { bg = "None" },
    SignColumn = { bg = "None" },
    Folded = { bg = "None" },
    FoldColumn = { bg = "None" },
    CursorLine = { bg = "None" },
    CursorColumn = { bg = "None" },
    WhichKeyFloat = { bg = "None" },
    VertSplit = { bg = "None" },
  },
})

function Pencils()
  -- Set the color scheme to 'ayu'
  vim.cmd('colorscheme ayu')
end


Pencils()
