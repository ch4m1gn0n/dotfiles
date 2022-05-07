local options = {
  bg = 'light',
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  autoindent = true,
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop =4,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  equalalways = false,                     -- all windows automatically made the same size
}

-- vim.g.gruvbox_contrast_light = 'soft'
-- vim.g.gruvbox_contrast_dark = 'soft'
vim.opt.shortmess:append "c"
-- vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_no_extensions_in_markdown = 1
vim.g.mkdp_browser = 'firefox'
-- vim-table-mode更改为markdown语法
-- vim.g.table_mode_corner='|'
vim.g.mkdp_markdown_css='https://raw.githubusercontent.com/sindresorhus/github-markdown-css/main/github-markdown.css'

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- vim.cmd [[
-- let s:clip = '/mnt/c/Windows/System32/clip.exe' 
-- if executable(s:clip)
--     augroup WSLYank
--         autocmd!
--         autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
--     augroup END
-- endif
-- ]]
