return {
      event = { "VeryLazy" },
      "ggandor/leap.nvim",
      keys = {
        { "<Plug>(leap-forward-to)", mode = { "n", "x", "o" } },
        { "<Plug>(leap-backward-to)", mode = { "n", "x", "o" } },
        { "<Plug>(leap-from-window)", mode = { "n", "x", "o" } },
      },
      config = function(_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
          leap.opts[k] = v
        end
        vim.keymap.set({ "n", "x", "o" }, ",s", "<Plug>(leap-forward-to)", { desc = "Leap forward" })
        vim.keymap.set({ "n", "x", "o" }, ",S", "<Plug>(leap-backward-to)", { desc = "Leap backward" })
        vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Leap from window" })
      end,
    }
