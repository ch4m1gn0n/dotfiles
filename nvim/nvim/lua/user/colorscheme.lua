-- local status_ok, onedark = pcall(require, "onedark")
-- if not status_ok then
--   return
-- end
vim.cmd [[
try
  colorscheme onedark
  let g:onedark_termcolors=256
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=light
endtry
]]

-- vim.g.gruvbox_material_background = 'soft'
-- onedark.setup{
--     -- Main options --
--     style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = false,  -- Show/hide background
--     term_colors = false, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--     -- toggle theme style ---
--     toggle_style_key = '<leader>c', -- Default keybinding to toggle
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {}, -- Override highlight groups
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
-- onedark.load()
