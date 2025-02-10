-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "typescript",
      "javascript",
      "json",
      "html",
      "css",
      "ruby",
      "dockerfile",
      "bash",
      "yaml",
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
