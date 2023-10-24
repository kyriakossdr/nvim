function ToggleWrap()
  if vim.opt.wrap == true then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end
