vim.cmd [[
try
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=light
endtry
]]

-- vim.g.gruvbox_material_background = 'soft'
