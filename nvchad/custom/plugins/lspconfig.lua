-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--    local lspconfig = require "lspconfig"
--
--    -- lspservers with default config
--    local servers = { "pyright" }
--
--    for _, lsp in ipairs(servers) do
--       lspconfig[lsp].setup {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--       }
--    end
-- end
--
-- return M
-- custom.configs.lspconfig file 

local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟" ,
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      server:setup(opts)
      -- vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
