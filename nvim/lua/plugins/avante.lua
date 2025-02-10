return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
  opts = {
    provider = 'openai',
    openai = {
      -- endpoint = "https://api.openai.com/v1/chat/completions", -- The full endpoint of the provider
      model = "gpt-4o-mini", -- The model name to use with this provider
      -- model = "o1-mini", -- The model name to use with this provider
      api_key_name = "OPENAI_API_KEY", -- The name of the environment variable that contains the API key
    }
  },
  -- opts = {
  --   provider = 'claude',
  --   model = "anthropic.claude-3-5-sonnet-20240620-v1:0",
  --   api_key_name = "CLAUDE3_API_KEY"
  --
  -- }
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
