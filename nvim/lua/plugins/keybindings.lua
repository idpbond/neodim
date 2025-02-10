return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<c-j>"] = { "<cmd>bn<cr>", desc = "Next Buffer" },
          ["<c-k>"] = { "<cmd>bp<cr>", desc = "Prev Buffer" },
          ["<Leader>wc"] = { "<cmd>wincmd c<cr>", desc = "Close" },
          ["<Leader>ws"] = { "<cmd>split<cr>", desc ="Split" },
          ["<Leader>wv"] = { "<cmd>vsplit<cr>", desc ="Split (Vertical)" },
          ["<Leader>wh"] = { "<cmd>wincmd h<cr>", desc ="Pane Left" },
          ["<Leader>wj"] = { "<cmd>wincmd j<cr>", desc ="Pane Down" },
          ["<Leader>wk"] = { "<cmd>wincmd k<cr>", desc ="Pane Up" },
          ["<Leader>wl"] = { "<cmd>wincmd l<cr>", desc ="Pane Right" },
          ["<Leader>wL"] = { "<cmd>wincmd 15><cr>", desc ="Increase Size" },
          ["<Leader>wH"] = { "<cmd>wincmd 15<<cr>", desc ="Decrease Size" },
          ["<Leader>gw"] = { "<cmd>lua require 'gitsigns'.toggle_word_diff()<cr>", desc = "Toggle Word Diff" },
          ["<Leader>gj"] = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
          ["<Leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
          ["<Leader>gx"] = function()
            local buffers = vim.api.nvim_list_bufs()
            local filtered_buffers = {}
            for _, buffer in ipairs(buffers) do
              local name = vim.api.nvim_buf_get_name(buffer)
              if name:sub(1, 11) == "gitsigns://" then
                table.insert(filtered_buffers, buffer)
              end
            end
            if #filtered_buffers == 0 then
              require('gitsigns').diffthis()
            else
              for _, buffer in ipairs(filtered_buffers) do
                vim.api.nvim_buf_delete(buffer, {})
              end
            end
          end
        },
      },
    },
  },
}
