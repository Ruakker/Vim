require'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'cpp', 'c', 'toml', 'json', 'lua', 'python', 'bash' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  }
}
