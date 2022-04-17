-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/
-- require("custom.plugins.which-key")
-- MAPPINGS
local map = require("core.utils").map
local cmp = require("plugins.configs.cmp")

-- map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("", "H", "^")
map("", "L", "$")
map("", "J", "5j")
map("", "K", "5k")
map("", "<leader>p", ":MarkdownPreviewToggle <CR>")
map("", "<leader>y", ":call mdip#MarkdownClipboardImage()<CR>")
map("", "<leader>wv", "<C-w>v")
map("", "<leader>wh", "<C-w>s")
map("", "<leader>hh", ":Alpha <CR>")
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
-- map("", "<leader>s", "<Plug>(easymotion-s)")
-- map("n", "<leader>bm", ":")
-- map("!", )
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,m - [ ] ]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,. 。]]
vim.cmd[[autocmd Filetype markdown inoremap <buffer> ,, ，]]

vim.g.mkdp_browser = "firefox"
-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
--
-- vim.g.vimwiki_list = vim.api.nvim_eval("[{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
-- vim.g.vimwiki_folding = "expr"
-- vim.cmd[[autocmd FileType vimwiki setlocal foldenable]]
vim.cmd[[autocmd FileType markdown setlocal nofoldenable]]

vim.api.nvim_exec(
[[
function! s:myLocalDb()
    let db = ZFVimIM_dbInit({
                \   'name' : 'Wubi',
                \ })

    if(has("win32") || has("win64") || has("win95") || has("win16"))
        call ZFVimIM_cloudRegister({
                    \   'mode' : 'local',
                    \   'dbId' : db['dbId'],
                    \   'repoPath' : '',  
                    \   'dbFile' : '/wubi.txt', 
                    \ })
    else
        call ZFVimIM_cloudRegister({
                    \   'mode' : 'local',
                    \   'dbId' : db['dbId'],
                    \   'repoPath' : '~/.config/',  
                    \   'dbFile' : '/wubi.txt', 
                    \ })
    endif
endfunction

autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()

map , <Plug>(easymotion-prefix)
" let g:vim_markdown_folding_disabled = 1
]],
false)

-- input method
vim.g.ZFVimIM_keymap = 0
map("n", ",q", "ZFVimIME_keymap_toggle_n()", {expr = true})
map("i", ",q", "ZFVimIME_keymap_toggle_i()", {expr = true})
map("v", ",q", "ZFVimIME_keymap_toggle_v()", {expr = true})

-- vim-table-mode更改为markdown语法
vim.g.table_mode_corner='|'
vim.g.mkdp_markdown_css='https://raw.githubusercontent.com/sindresorhus/github-markdown-css/main/github-markdown.css'
-- vim.g:mkdp_highlight_css = ''

-- 设置 默认 terminal
-- 会影响图片粘贴，所以暂时先不用
-- vim.api.nvim_set_option('shell', 'powershell')

