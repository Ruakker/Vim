vim.g.ale_sign_column_always = 1
vim.g.ale_set_highlights = 1
-- vim.g.ale_sign_error = '!>'
-- vim.g.ale_sign_warning = '?>'
vim.g.ale_sign_error = '✗'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_echo_msg_format = '[%severity%] %s'
vim.g.ale_c_cc_executable = 'gcc'
vim.g.ale_cpp_cc_executable = 'g++'
vim.g.ale_c_cc_options = '-std=c11 -Wall'
vim.g.ale_cpp_cc_options = '-std=c++11 -Wall -DDEBUG'
vim.cmd("let g:ale_linters = { 'cpp': ['g++'], 'c': ['gcc'],}")
