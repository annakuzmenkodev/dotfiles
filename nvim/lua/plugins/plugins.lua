return {
  "github/copilot.vim",
  "kdheepak/lazygit.nvim",
  {
    "default-anton/llm-sidekick.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("llm-sidekick").setup({
        smart_model = "claude-3-5-sonnet-latest",
        fast_model = "claude-3-5-haiku-latest",
        reasoning_model = "claude-3-5-sonnet-latest",
      })
    end,
  },
  {

    "default-anton/llm-sidekick.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("llm-sidekick").setup({
        -- Model aliases configuration
        aliases = {
          -- c = "claude-3-5-sonnet-latest", -- Anthropic's Claude model
          c = "anthropic.claude-3-5-sonnet-20241022-v2:0", -- Amazon's Claude model
          s = "claude-3-5-sonnet-latest", -- Anthropic's Claude model
          g = "gemini-exp-1206", -- Google's Gemini model
          think_g = "gemini-2.0-flash-thinking-exp-01-21",
          d = "deepseek-reasoner", -- DeepSeek's Reasoner model
        },
        default = "c", -- Default model alias to use
      })
    end,
  },
  "slim-template/vim-slim",
  "tpope/vim-rails",
  "vim-test/vim-test",
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    "hat0uma/csvview.nvim",
    config = function()
      require("csvview").setup()
    end,
  },
  {
    dir = "~/projects/rails-i18n.nvim",
    -- config = function()
    --   require("rails-i18n")
    -- end,
  },
  -- "annakuzmenkodev/rails-i18n.nvim",
  -- "hrsh7th/nvim-cmp",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-buffer",
  -- {
  --   "hrsh7th/cmp-cmdline",
  --   config = function()
  --     local cmp = require("cmp")
  --     cmp.setup.cmdline("/", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --       },
  --     })
  --     cmp.setup.cmdline(":", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = cmp.config.sources({
  --         { name = "path" },
  --       }, {
  --         {
  --           name = "cmdline",
  --           option = {
  --             ignore_cmds = { "Man", "!" },
  --           },
  --         },
  --       }),
  --     })
  --   end,
  -- },
}
