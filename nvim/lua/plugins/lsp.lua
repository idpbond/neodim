return {
  "AstroNvim/astrolsp",
  -- we need to use the function notation to get access to the `lspconfig` module
  ---@param opts AstroLSPOpts
  opts = function(plugin, opts)
    -- insert "prolog_lsp" into our list of servers
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "solargraph")

    opts.formatting = {
      disabled = {'cssls', 'html'}
    }

    -- extend our configuration table to have our new prolog server
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      -- this must be a function to get access to the `lspconfig` module
      solargraph_lsp = {
        -- the command for starting the server
        cmd = {
          "bundle",
          "exec",
          "solargraph",
          "stdio"
        },
        -- the filetypes to attach the server to
        filetypes = { "ruby" },
        -- root directory detection for detecting the project root
        root_dir = require("lspconfig.util").root_pattern("Gemfile"),
      },
    })
  end,
}
