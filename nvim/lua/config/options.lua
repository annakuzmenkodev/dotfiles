-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"
vim.g.copilot_node_command = "/Users/annakuzmenko/.nvm/versions/node/v18.20.5/bin/node"
vim.g.copilot_filetypes = vim.tbl_extend("force", vim.g.copilot_filetypes or {}, {
  TelescopePrompt = false,
  TelescopeResults = false,
})
