vim.cmd [[
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
  
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!

    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown let g:vim_markdown_follow_anchor = 1
    autocmd FileType markdown let g:vim_markdown_no_extensions_in_markdown = 1
    autocmd FileType markdown xnoremap <buffer> <A-l> :HeaderIncrease<cr>
    autocmd FileType markdown xnoremap <buffer> <A-h> :HeaderDecrease<cr>
    autocmd FileType markdown nnoremap <buffer> H g^
    autocmd FileType markdown nnoremap <buffer> L g$
    autocmd FileType markdown nnoremap <buffer> j gj
    autocmd FileType markdown nnoremap <buffer> k gk
    autocmd FileType markdown nnoremap <buffer> J 5gj
    autocmd FileType markdown nnoremap <buffer> K 5gk
    autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
    autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
    autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
    autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
    autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
    autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
    autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
    autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
    autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
    autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
    autocmd Filetype markdown inoremap <buffer> ,. 。
    autocmd Filetype markdown inoremap <buffer> ,, ，
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end



]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
