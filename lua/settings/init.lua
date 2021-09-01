function opt(scope, key, value)
  vim[scope][key] = value
  if scope ~= 'o' then
    vim['o'][key] = value
  end
end

vim.g.mapleader = '\\'                   -- Leaderkey shortcut
vim.cmd('set shortmess+=c')              -- Remove pattern not found compe message

opt('wo', 'number', true)                -- Show absolute line number
opt('wo', 'relativenumber', true)        -- Show line number relative to the cursor's current position
opt('wo', 'cursorline', true)            -- Highlight line on cursor's position
opt('wo', 'wrap', false)                 -- Display long lines as just one line
opt('wo', 'linebreak', true)             -- Wrap long lines at a character in 'breakat'
opt('wo', 'foldenable', false)           -- All folds are open
opt('o', 'showmode', false)              -- Hide current mode like -- INSERT --
opt('o', 'smartcase', true)              -- Ignore the case of normal letters
opt('o', 'ignorecase', true)             -- Ignore case when pattern contains lowercase
opt('o', 'mouse', 'a')                   -- Enable the mouse
opt('o', 'showmatch', true)              -- Briefly jump to the matching bracket
opt('o', 'showtabline', 2)               -- Always show tabs
opt('o', 'tabstop', 4)                   -- Insert 4 spaces for a tab
opt('o', 'softtabstop', 4)
opt('o', 'background', 'dark')           -- Tells vim that the background is dark
opt('o', 'termguicolors', true)          -- Check if terminal has 24-bit color support
opt('o', 'list', true)                   -- Activate 'list' mode
opt('o', 'lazyredraw', true)             -- Screen will not be redrawn while executing macros and other commands
opt('o', 'hidden', true)                 -- Keep multiple buffers open
opt('o', 'conceallevel', 2)              -- How text with 'conceal' syntax is shown
opt('o', 'concealcursor', 'i')           -- Can conceal cursor in insert mode
opt('o', 'splitright', true)             -- Vertical splits will automatically be to the right
opt('o', 'splitbelow', true)             -- Horizontal splits will automatically be below
opt('o', 'inccommand', 'nosplit')        -- Show the effects of a command incrementally
opt('o', 'tagcase', 'smart')             -- How case is handled when searching tags files
opt('o', 'updatetime', 300)              -- How many ms until the swap file will be written to disk
opt('o', 'undofile', true)               -- Saves undo history to an undo file
opt('o', 'swapfile', true)               -- use swapfile for the current buffer
opt('o', 'backup', false)                -- Don't make a backup before overwriting a file
opt('o', 'writebackup', false)           -- Complete backup option
opt('o', 'autoindent', true)
opt('o', 'smartindent', true)
opt('o', 'cindent', true)
opt('o', 'breakindent', true)            -- Wrapped line will continue visually indented
opt('o', 'smartindent', true)            -- Smart autoindenting when starting a new line
opt('o', 'expandtab', false)             -- Converts tabs to spaces
opt('o', 'shiftwidth', 4)                -- Change the number of space characters inserted for indentation
opt('o', 'shiftround', true)             -- Round indent to multiple of 'shiftwidth'
opt('o', 'foldmethod', 'manual')         -- Folding used for the current window
opt('o', 'scrolloff', 3)                 -- Minimal number of screen lines to keep above and below the cursor
opt('o', 'sidescrolloff', 15)            -- Minimal number of screen columns to keep to the left and right of the cursor
opt('o', 'sidescroll', 5)                -- Minimal number of columns to scroll horizontally
opt('o', 'guifont', 'FiraCode NF:h12:cANSI')

-- Option settings for diff mode
opt('o', 'diffopt', vim.o.diffopt..',vertical')
