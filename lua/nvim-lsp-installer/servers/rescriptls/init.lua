local server = require "nvim-lsp-installer.server"
local path = require "nvim-lsp-installer.path"
local std = require "nvim-lsp-installer.installers.std"

return function(name, root_dir)
    return server.Server:new {
        name = name,
        root_dir = root_dir,
        installer = std.unzip_remote "https://github.com/rescript-lang/rescript-vscode/releases/download/1.1.3/rescript-vscode-1.1.3.vsix",
        default_options = {
            cmd = { "node", path.concat { root_dir, "extension", "server", "out", "server.js" }, "--stdio" },
        },
    }
end