-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
require('lspinstall').setup()
local servers = require('lspinstall').installed_servers()
for _, server in pairs(servers) do
  require('lspconfig')[server].setup {}
end

return {}
