return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.rvm/wrappers/default/ruby-lsp") },
        settings = {
          rubocop = {
            lint = {
              exclude = { "**/*.erb" }
            }
          }
        }
      },
    },
  },
}
