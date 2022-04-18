local present, alpha = pcall(require, "alpha")

if not present then
   return
end

local function button(sc, txt, keybind)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "AlphaButtons",
   }

   if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
   end

   return {
      type = "button",
      val = txt,
      on_press = function()
         local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
         vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
   }
end

local default = {}

default.ascii = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
default.header = {
   type = "text",
   val = default.ascii,
   opts = {
      position = "center",
      hl = "AlphaHeader",
   },
}

default.buttons = {
   type = "group",
   val = {
      button("f", "  Find file", ":Telescope find_files <CR>"),
      button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      button("p", "  Find project", ":Telescope projects <CR>"),
      button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      button("t", "  Find text", ":Telescope live_grep <CR>"),
      button("c", "  Configuration", ":e $MYVIMRC | :cd %:p:h <CR>"),
      button("q", "  Quit Neovim", ":qa<CR>"),
   },
   opts = {
      spacing = 1,
   },
}

local M = {}

M.setup = function()
   alpha.setup {
      layout = {
         { type = "padding", val = 9 },
         default.header,
         { type = "padding", val = 2 },
         default.buttons,
      },
      opts = {},
   }
end

return M
