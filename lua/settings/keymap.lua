vim.api.nvim_set_keymap('n', '<F6>', ':UndotreeToggle<CR>:UndotreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':AsyncRun -save=1 g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lm -Wall -std=c++14 -O2 -DDEBUG -Wl,--stack=134217728<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':AsyncRun -save=1 g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lm -Wall -std=c++14 -O2 -Wl,--stack=134217728<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':cclose<cr>:AsyncRun -mode=term -pos=external -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':call asyncrun#quickfix_toggle(10)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>s', ':HopChar1<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true })