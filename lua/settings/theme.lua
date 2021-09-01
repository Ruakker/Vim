vim.cmd('syntax on')
vim.cmd('let g:nvcode_termcolors=256')

if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end

-- Load the colorscheme

vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_show_eob = 0
vim.cmd 'color gruvbox-material'
