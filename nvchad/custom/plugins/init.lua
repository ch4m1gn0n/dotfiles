-- /lua/custom/plugins/init.lua
return {
    { "stevearc/aerial.nvim",
        config = function()
            require'custom.plugins.aerial'.setup()
        end

    },
    { "ahmedkhalf/project.nvim",
        config = function()
            require'custom.plugins.project'.setup()
        end
    },
    -- {"nvim-telescope/telescope-project.nvim"},
    -- {"nvim-treesitter/nvim-treesitter-textobjects"},
    -- {"romgrk/nvim-treesitter-context"},
    { "mg979/vim-visual-multi" },
    {
        "folke/which-key.nvim",
        config = function()
            require'custom.plugins.which-key'.setup()
	    end
    },
    { 'williamboman/nvim-lsp-installer' },
    { "preservim/vim-markdown" },
    { "kevinhwang91/rnvimr" },
    { "ZSaberLv0/ZFVimJob"},
    { "iamcco/markdown-preview.nvim" },
    -- { "vimwiki/vimwiki" },
    { "ferrine/md-img-paste.vim" },
    { "ZSaberLv0/ZFVimIM" },
    { "dhruvasagar/vim-table-mode" },
    { "mzlogin/vim-markdown-toc" },
    { "easymotion/vim-easymotion" }
}
-- just an example!
