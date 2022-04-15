-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
-- /lua/custom/chadrc.lua
local userPlugins = require "custom.plugins" -- path to table

M.options = {
   -- custom = {}
   -- general nvim/vim options , check :h optionname to know more about an option

   clipboard = "unnamedplus",
   cmdheight = 1,
   ruler = false,
   hidden = true,
   ignorecase = true,
   smartcase = true,
   mapleader = " ",
   mouse = "a",
   number = true,
   numberwidth = 2,
   relativenumber = false,
   expandtab = true,
   shiftwidth = 4,
   smartindent = true,
   tabstop = 4,
   timeoutlen = 400,
   updatetime = 250,
   undofile = true,
   fillchars = { eob = " " },
   shadafile = vim.opt.shadafile,

   -- NvChad options
   nvChad = {
      copy_cut = true, -- copy cut text ( x key ), visual and normal mode
      copy_del = true, -- copy deleted text ( dd key ), visual and normal mode
      insert_nav = true, -- navigation in insertmode
      window_nav = true,
      terminal_numbers = false,

      -- updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}


---- UI -----

M.ui = {
   hl_override = "", -- path of your file that contains highlights
   italic_comments = false,
   theme = "gruvbox", -- default theme

   -- Change terminal bg to nvim theme's bg color so it'll match well
   -- For Ex : if you have onedark set in nvchad, set onedark's bg color on your terminal
   transparency = false,
}

---- PLUGIN OPTIONS ----

M.plugins = {

   install = userPlugins,
   -- enable/disable plugins (false for disable)
   status = {
      blankline = true, -- indentline stuff
      bufferline = true, -- manage and preview opened buffers
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      alpha = true, -- dashboard
      better_escape = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true,
      lspsignature = true, -- lsp enhancements
      vim_matchup = true, -- improved matchit
      cmp = true,
      nvimtree = true,
      autopairs = true,
   },
   options = {
      packer = {
         init_file = "plugins.packerInit",
      },
      autopairs = { loadAfter = "nvim-cmp" },
      cmp = {
         lazy_load = true,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of file containing setups of different lsps
      },
      nvimtree = {
         -- packerCompile required after changing lazy_load
         lazy_load = true,
      },
      luasnip = {
         snippet_path = {},
      },
      statusline = {
         -- hide, show on specific filetypes
         hidden = {
            "help",
            "NvimTree",
            "terminal",
            "alpha",
         },
         shown = {},

         -- truncate statusline on small screens
         shortline = true,
         style = "default", -- default, round , slant , block , arrow
      },
      esc_insertmode_timeout = 300,
   },
   default_plugin_config_replace = {
       nvim_tree = {
         view = {
           mappings = {
             custom_only = false,
             list = {
                 { key = {"<2-RightMouse>", "l"},    action = "cd" },
                 { key = "h",                        action = "dir_up" },
             },
           },
         },
       },
   },
   default_plugin_remove = {},
   install = nil,
}

-- Don't use a single keymap twice

--- MAPPINGS ----

-- non plugin
M.mappings = {
   -- custom = {}, -- custom user mappings

   misc = {
      cheatsheet = "<leader>hk",
      close_buffer = "<leader>bd",
      cp_whole_file = "<leader>a", -- copy all contents of current buffer
      lineNR_toggle = "", -- toggle line number
      lineNR_rel_toggle = "<leader>n",
      update_nvchad = "<leader>uu",
      new_buffer = "<leader>ba",
      new_tab = "<C-t>b",
      save_file = "<leader>s", -- save file using :w
   },

   -- navigation in insert mode, only if enabled in options

   insert_nav = {
      backward = "<C-h>",
      end_of_line = "<C-e>",
      forward = "<C-l>",
      next_line = "<C-j>",
      prev_line = "<C-k>",
      beginning_of_line = "<C-b>",
   },

   -- better window movement
   window_nav = {
      moveLeft = "<C-h>",
      moveRight = "<C-l>",
      moveUp = "<C-k>",
      moveDown = "<C-j>",
   },

   -- terminal related mappings
   terminal = {
      -- multiple mappings can be given for esc_termmode, esc_hide_termmode

      -- get out of terminal mode
      esc_termmode = { "jk" },

      -- get out of terminal mode and hide it
      esc_hide_termmode = { "JK" },
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "",

      -- spawn terminals
      new_horizontal = "<leader>;",
      new_vertical = "",
      spawn_window = "<leader>tw",
   },
}

-- plugins related mappings
-- To disable a mapping, equate the variable to "" or false or nil in chadrc
M.mappings.plugins = {
   bufferline = {
      next_buffer = "<TAB>",
      prev_buffer = "<S-Tab>",
   },
   comment = {
      toggle = "<leader>/",
   },

   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = { "jk" }, -- multiple mappings allowed
   },

   lspconfig = {
      declaration = "gD",
      definition = "gd",
      hover = "gK",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>wa",
      remove_workspace_folder = "<leader>wr",
      list_workspace_folders = "<leader>ws",
      type_definition = "<leader>D",
      rename = "<leader>lr",
      code_action = "<leader>ca",
      references = "gr",
      float_diagnostics = "ge",
      goto_prev = "[d",
      goto_next = "]d",
      set_loclist = "<leader>ll",
      formatting = "<leader>lf",
   },

   nvimtree = {
      toggle = "<leader>e",
      focus = "<leader>i",
   },

   telescope = {
      buffers = "<leader>bb",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>cm",
      git_status = "<leader>gt",
      help_tags = "<leader>fh",
      live_grep = "<leader>fw",
      oldfiles = "<leader>fo",
      themes = "<leader>th", -- NvChad theme picker
   },
}

return M
