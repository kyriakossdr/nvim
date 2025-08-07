vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

--yank to the system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set({'n','t'}, '<leader>t', '<cmd>Lspsaga term_toggle<CR>')


vim.keymap.set("n", "<leader>gg", function () require("neogit").open() end, { desc = "Open Neogit" })

vim.keymap.set('n', '<leader>dv', function()
  vim.cmd('vsplit')
  vim.cmd('wincmd l')  -- focus the new split
  vim.cmd('Lspsaga goto_definition')
end, { desc = 'Lspsaga definition in vertical split' })

vim.keymap.set('n', '<leader>dh', function()
  vim.cmd('split')
  vim.cmd('wincmd j')  -- focus the new split
  vim.cmd('Lspsaga goto_definition')
end, { desc = 'Lspsaga definition in horizontal split' })
