local opt = vim.opt -- for conciseness

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Maintain undo history between sessions
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"

-- Spell Checking
opt.spell = true
opt.spelllang = "en,cjk"

-- line numbers
-- opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- test undo
-- tab & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
-- opt.cursorline = true -- highlight the current cursor line

-- Highlight cursorline and colorcolumn applied in the current window
vim.cmd([[
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=120
  au WinLeave * setlocal colorcolumn=
augroup END)
]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]])

-- Keep folds on save
vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- disable --INSERT-- message
opt.showmode = false
