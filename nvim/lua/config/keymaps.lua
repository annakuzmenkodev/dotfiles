-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Unmap LazyVim's default keymaps
vim.keymap.del("n", "<leader>bd")

-- Custom buffer delete function
local function smart_buffer_delete()
  local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })
  vim.cmd("bd")
  if buf_count == 1 then
    vim.cmd("quit")
  end
end

-- Set new buffer delete keymap
vim.keymap.set("n", "<leader>bd", smart_buffer_delete, { desc = "Delete Buffer & Close Window if Last" })

-- Unmap LazyVim's default <leader>l binding
vim.keymap.del("n", "<leader>l")
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

vim.keymap.set("n", "<leader>la", ":Ask vsplit %<CR>", { noremap = true, desc = "Ask LLM about current buffer" })
vim.keymap.set("v", "<leader>la", ":Ask vsplit<CR>", { noremap = true, desc = "Ask LLM about selection" })

-- Code with LLM
vim.keymap.set(
  "n",
  "<leader>lc",
  ":Code vsplit %<CR>",
  { noremap = true, desc = "Start coding with LLM on current buffer" }
)
vim.keymap.set("v", "<leader>lc", ":Code vsplit<CR>", { noremap = true, desc = "Start coding with LLM on selection" })
vim.keymap.set(
  "n",
  "<leader>ld",
  ":Code vsplit %:h<CR>",
  { noremap = true, desc = "Start coding with LLM on files in current directory" }
)

-- Apply LLM changes
vim.keymap.set("n", "<leader>lp", ":Apply all<CR>", { noremap = true, desc = "Apply all LLM changes" })

-- Add context to LLM
vim.keymap.set("n", "<leader>ad", ":Add<CR>", { noremap = true, desc = "Add context to LLM" })
vim.keymap.set("v", "<leader>ad", ":Add<CR>", { noremap = true, desc = "Add selected context to LLM" })

-- Fast coding with Yolo mode
vim.keymap.set("n", "<leader>ly", ":Yolo vsplit %<CR>", {
  noremap = true,
  desc = "Fast coding with LLM on current buffer. Automatically applies changes and closes the chat buffer",
})
vim.keymap.set("v", "<leader>ly", ":Yolo vsplit<CR>", {
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
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-a>"] = function(prompt_bufnr)
          local action_state = require("telescope.actions.state")

          local picker = action_state.get_current_picker(prompt_bufnr)
          local multi_selections = picker:get_multi_selection()

          if vim.tbl_isempty(multi_selections) then
            local selected_entry = action_state.get_selected_entry()
            if selected_entry and selected_entry.path then
              local filepath = selected_entry.path
              vim.cmd("Add " .. filepath)
            else
              vim.notify("No selection")
            end
          else
            local files = vim.tbl_map(function(s)
              return s.path
            end, multi_selections)
            vim.cmd("Add " .. table.concat(files, " "))
          end

          return true
        end,
      },
    },
  },
})
-- i18n translation
vim.keymap.set("n", "gt", ":I18nGoto	<CR>", { noremap = true, desc = "Go to translation or create one" })
