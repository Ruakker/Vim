--tabline
require'tabline'.setup {
   enable = true,
   options = {
      section_separators = {'', ''},
      component_separators = {'', ''},
      always_show_tabs = true,
   }
}
vim.cmd[[
   set guioptions-=e
   set sessionoptions+=tabpages,globals
]]