-- Function for make mapping easier.
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader key to space.
vim.g.mapleader = " "

-- Customs
map('t', '<C-t>', 'exit<CR>')
map('n', '<C-h>', ':bprevious<CR>')
map('n', '<C-l>', ':bnext<CR>')
map('n', '<C-p>', ':Vista!!<CR>') --function names
map('n', '<A-w>', ':bp|bd#') --close buffer
map('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>s', ':belowright split | lua vim.lsp.buf.definition()<CR>')
map("n", '<leader>nh', ':noh<CR>') -- clears highlights after searching word in file.
map('n', '<leader>jf', ':%!python3 -m json.tool') -- format json

-- Split navigations.
map("n", "<A-j>", "<C-w><C-j>")
map("n", "<A-k>", "<C-w><C-k>")
map("n", "<A-l>", "<C-w><C-l>")
map("n", "<A-h>", "<C-w><C-h>")

-- Buffer switching.
map("n", "<A-[>", ":BufferLineCyclePrev<CR>")
map("n", "<A-]>", ":BufferLineCycleNext<CR>")

-- Buffer moving.
map("n", "<leader>bl", ":BufferLineMoveNext<CR>")
map("n", "<leader>bh", ":BufferLineMovePrev<CR>")

-- Telescope.
map("n", "<Leader>fw", ":Telescope live_grep<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
--map("n", "<Leader>ff", ":Telescope find_files find_command=rg,--follow,--hidden,--files<CR>")
map("n", "<Leader>fc", ":Telescope find_files follow=True hidden=True cwd=~/Configuration/Dotfiles/<CR>")
map("n", "<Leader>fs", ":Telescope grep_string<CR>") -- Find string under cursor
map("n", "<Leader>gt", ":Telescope git_status<CR>")
map("n", "<Leader>cm", ":Telescope git_commits<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fo", ":Telescope oldfiles<CR>")
map("n", "<Leader>th", ":Telescope colorscheme<CR>")

-- Dashboard
map("n", "<Leader>db", ":Dashboard<CR>")
map("n", "<Leader>fn", ":DashboardNewFile<CR>")
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>")
map("n", "<C-s>l", ":SessionLoad<CR>")
map("n", "<C-s>s", ":SessionSave<CR>")

--Markdown
map("n", "<Leader>mp", ":MarkdownPreviewToggle<CR>")


-- Lsp
local lsp_opts = { noremap=true, silent=true }
map('n', '<Leader>H', ':lua vim.diagnostic.open_float()<CR>')
--map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')


-- ToggleTerm
map("n", "<C-t>", ":ToggleTerm dir=%:p:h<CR>")
map("t", "<C-t>", "exit<CR>")
map("n", "v:count1 <C-t>", ":v:count1" .. "\"ToggleTerm\"<CR>")
map("v", "v:count1 <C-t>", ":v:count1" .. "\"ToggleTerm\"<CR>")
function _G.set_terminal_keymaps()
  map("t", "<esc>", "<C-\\><C-n>")
  map("t", "<A-h>", "<c-\\><c-n><c-w>h")
  map("t", "<A-j>", "<c-\\><c-n><c-w>j")
  map("t", "<A-k>", "<c-\\><c-n><c-w>k")
  map("t", "<A-l>", "<c-\\><c-n><c-w>l")

 -- map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
 -- map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
 -- map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
 -- map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")


-- Remove unnecessary white spaces.
map("n", "<leader>cw", ":StripWhitespace<CR>")
