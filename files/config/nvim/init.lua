vim.g.mapleader = ","
require("config.lazy")

-- Theme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("base16-gruvbox-dark-pale")
-- vim.cmd.colorscheme("base16-tomorrow-night")
-- vim.cmd.colorscheme("kanagawa-dragon")

-- Text
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↳"
vim.opt.list = true
vim.opt.listchars = { tab = "»»", trail = "•" }
vim.opt.joinspaces = false
vim.opt.ttimeoutlen = 50

-- Indentation
vim.opt.autoindent = true
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Gutter
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.foldenable = false
vim.opt.foldcolumn = "0"
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "quickfix",
  callback = function()
    vim.opt_local.number = false
  end
})

-- Status
vim.opt.laststatus = 3
vim.opt.visualbell = true
vim.opt.scrolloff = 3

-- Tabby
vim.opt.showtabline = 2
require('tabby').setup({
  preset = 'tab_only',
  option = {
    lualine_theme = 'base16'
  },
})

-- Lualine
require('lualine').setup({
  options = {
    theme = 'base16',
    -- theme = 'kanagawa',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_c = {
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if vim.bo.buftype == 'terminal' then
          return ' terminal'
        elseif bufname == '' then
          return '[No Name]'
        else
          return vim.fn.fnamemodify(bufname, ':t')
        end
      end
    }
  }
})

-- Undo
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- Auto-read external changes
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

-- Auto-completion
vim.opt.wildmode = { "longest:full", "list:full" }
vim.opt.wildignore:append({
  "*.so", "*.swp", "*.zip", "*.pyc",
  "*.png", "*.jpg", "*.gif", "*.heic",
  "node_modules", "build", "dist", "public", "cache", "tmp"
})

-- Navigation
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")

vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- Splits
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "vv", "<C-w>v")
vim.keymap.set("n", "zz", "<C-w>s")
vim.keymap.set("n", "Q", vim.cmd.q)

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n><C-w>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
vim.api.nvim_create_autocmd({ 'TermOpen', 'TermEnter' }, {
  callback = function()
    vim.cmd('startinsert')
  end
})
vim.api.nvim_create_user_command('Terminal', function()
  vim.cmd('vsplit | terminal')
end, {})

-- Leader
vim.keymap.set("v", "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", ":pwd<CR>", { silent = true })
vim.keymap.set("n", "<leader><space>", ":let @/=''<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", ":Gblame<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":tabnew | terminal<CR>", { silent = true })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true })

-- Treesitter
require('nvim-treesitter.configs').setup({
  indent = { enable = true },
  highlight = { enable = true },
  playground = { enable = true }
})

-- Telescope
require('telescope').setup({})
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { silent = true })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { silent = true })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { silent = true })

-- Neotree
vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { silent = true })
require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
    }
  },
  window = {
    width = 32
  }
})

-- Coc
vim.keymap.set("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Color column
vim.opt.colorcolumn = "80"
vim.keymap.set("n", "<leader>0", function()
  local col = vim.opt.colorcolumn:get()
  if #col == 0 then
    vim.opt.colorcolumn = { "80" }
  else
    vim.opt.colorcolumn = {}
  end
end)

-- Cursor line highlighting only when window is focused
vim.api.nvim_create_augroup("cursorlines", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "ShellFilterPost", "WinEnter" }, {
  group = "cursorlines",
  callback = function() vim.opt_local.cursorline = true end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave", "WinLeave" }, {
  group = "cursorlines",
  callback = function() vim.opt_local.cursorline = false end,
})

-- Current word highlight
vim.opt.updatetime = 500
vim.api.nvim_set_hl(0, "CursorToken", { ctermbg = 237, bg = "#3a3a3a" })
vim.api.nvim_create_augroup("cursortokens", { clear = true })
local match_id = nil
vim.api.nvim_create_autocmd("CursorHold", {
  group = "cursortokens",
  callback = function()
    pcall(function()
      if match_id then
        vim.fn.matchdelete(match_id)
      end
    end)
    local word = vim.fn.expand("<cword>")
    if word ~= "" then
      match_id = vim.fn.matchadd("CursorToken", "\\<" .. word .. "\\>")
    end
  end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
  group = "cursortokens",
  callback = function()
    pcall(function()
      if match_id then
        vim.fn.matchdelete(match_id)
        match_id = nil
      end
    end)
  end,
})

-- Format options
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.formatoptions:append("nqrcjl1")
    vim.opt.formatoptions:remove({"o", "t"})
  end
})

-- Disable mouse if no GUI or DISPLAY
if not vim.fn.has("gui_running") or vim.fn.getenv("DISPLAY") == "" then
  vim.opt.mouse = ""
end
