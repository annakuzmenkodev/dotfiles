-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>io", "o<Esc>", { noremap = true, silent = true, desc = "Add empty line" })

-- Save and exit insert mode
vim.keymap.set("i", "jj", "<Esc><Cmd>w<CR>", { noremap = true, silent = true, desc = "Save and exit insert mode" })
vim.keymap.set("n", "<leader>cf", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path" })

local builtin = require("telescope.builtin")
-- search word or selection
vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "Search word under cursor" })
vim.keymap.set("v", "<leader>w", function()
  local saved_reg = vim.fn.getreg("v")
  vim.cmd('noau normal! "vy"')
  local selection = vim.fn.getreg("v")
  vim.fn.setreg("v", saved_reg)
  builtin.grep_string({ search = selection })
end, { desc = "Search selection" })

-- Run tests
vim.api.nvim_set_keymap(
  "n",
  "<leader>rf",
  "<cmd>TestFile<CR>",
  { noremap = true, silent = true, desc = "Run tests in current file" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>rr",
  "<cmd>TestNearest<CR>",
  { noremap = true, silent = true, desc = "Run nearest test" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>rl",
  "<cmd>TestLast<CR>",
  { noremap = true, silent = true, desc = "Run last test" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ra",
  "<cmd>TestSuite<CR>",
  { noremap = true, silent = true, desc = "Run all tests" }
)

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gf",
  "<cmd>LazyGitFilterCurrentFile<CR>",
  { noremap = true, silent = true, desc = "Open LazyGit with current file filter" }
)

-- Ask LLM about code

vim.keymap.set("n", "<leader>la", ":Ask split %<CR>", { noremap = true, desc = "Ask LLM about current buffer" })
vim.keymap.set("v", "<leader>la", ":Ask split<CR>", { noremap = true, desc = "Ask LLM about selection" })

-- Code with LLM
vim.keymap.set(
  "n",
  "<leader>lc",
  ":Code split %<CR>",
  { noremap = true, desc = "Start coding with LLM on current buffer" }
)
vim.keymap.set("v", "<leader>lc", ":Code split<CR>", { noremap = true, desc = "Start coding with LLM on selection" })
vim.keymap.set(
  "n",
  "<leader>ld",
  ":Code split %:h<CR>",
  { noremap = true, desc = "Start coding with LLM on files in current directory" }
)

-- Apply LLM changes
vim.keymap.set("n", "<leader>lp", ":Apply all<CR>", { noremap = true, desc = "Apply all LLM changes" })

-- Add context to LLM
vim.keymap.set("n", "<leader>ad", ":Add<CR>", { noremap = true, desc = "Add context to LLM" })
vim.keymap.set("v", "<leader>ad", ":Add<CR>", { noremap = true, desc = "Add selected context to LLM" })

-- Fast coding with Yolo mode
vim.keymap.set("n", "<leader>ly", ":Yolo split %<CR>", {
  noremap = true,
  desc = "Fast coding with LLM on current buffer. Automatically applies changes and closes the chat buffer",
})
vim.keymap.set("v", "<leader>ly", ":Yolo split<CR>", {
  noremap = true,
  desc = "Fast coding with LLM on selection. Automatically applies changes and closes the chat buffer",
})
-- Save and run :Stt command
vim.keymap.set("i", "<C-s>", "<cmd>Stt<CR>", { noremap = true, silent = true, desc = "Run :Stt command" })
vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)", {
  -- expr = true,
  -- replace_keycodes = false,
  noremap = true,
})

-- i18n translation
vim.keymap.set("n", "gt", ":I18nGoto	<CR>", { noremap = true, desc = "Go to translation or create one" })
