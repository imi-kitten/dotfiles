-- ============================================================================
-- Neovim Configuration (init.lua)
-- Converted from init.vim to use lazy.nvim instead of vim-plug
-- ============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Configuration
-- ============================================================================

require("lazy").setup({
  -- Ruby support
  { "vim-ruby/vim-ruby" },

  -- File tree explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "imi-kitten/nvim-web-devicons", branch = "gitlab-ft-testing" },
      "MunifTanjim/nui.nvim",
    },
  },

  -- Git integration
  { "airblade/vim-gitgutter" },
  { "tpope/vim-fugitive" },
  { "rhysd/git-messenger.vim" },
  { "FabijanZulj/blame.nvim" },

  -- Status line and bufferline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { { "imi-kitten/nvim-web-devicons", branch = "gitlab-ft-testing" } },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { { "imi-kitten/nvim-web-devicons", branch = "gitlab-ft-testing" } },
  },

  -- Editing utilities
  { "tpope/vim-endwise" },
  { "tpope/vim-dotenv" },
  { "numToStr/Comment.nvim" },

  -- Language support
  { "hashivim/vim-hashicorp-tools" },
  { "vim-scripts/bats.vim" },
  { "junegunn/vader.vim" },
  { "pearofducks/ansible-vim" },
  {
    "arouene/vim-ansible-vault",
    ft = { "yaml", "yaml.ansible" },
  },
  { "buoto/gotests-vim" },
  { "mtdl9/vim-log-highlighting" },
  { "towolf/vim-helm", ft = { "helm" } },
  { "pedrohdz/vim-yaml-folds" },
  { "cuducos/yaml.nvim" },
  { "someone-stole-my-name/yaml-companion.nvim" },

  -- LSP and completion
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },

  -- Linting and formatting
  { "mfussenegger/nvim-lint" },
  { "mhartington/formatter.nvim" },
  {
    "creativenull/efmls-configs-nvim",
    version = "v1.*",
  },
  { "nvimtools/none-ls.nvim" },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown", "vim-plug" },
  },
  { "jakewvincent/mkdnflow.nvim" },

  -- Colorschemes
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "AmberLehmann/candyland.nvim" },
  { "tssm/fairyfloss.vim" },
  { "theacodes/witchhazel" },
  { "Mofiqul/dracula.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Shadorain/shadotheme" },
  { "beikome/cosme.vim" },
  { "neko-night/nvim", name = "neko-night" },
  { "Yazeed1s/oh-lucy.nvim" },
  { "anAcc22/sakura.nvim" },
  { "hyperb1iss/silkcircuit-nvim" },
  { "sts10/vim-pink-moon" },
  { "bringsrain/strawberry" },
  { "Integralist/hart-foundation" },
  { "ray-x/aurora" },
  { "rktjmp/lush.nvim" },

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Lua development
  {
    "folke/lazydev.nvim",
    ft = { "lua" },
    opts = {},
  },

  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Tmux integration
  { "aserowy/tmux.nvim" },

  -- Utilities
  { "dstein64/vim-startuptime" },

  -- Claude Code integration
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

-- ============================================================================
-- General Settings
-- ============================================================================

vim.opt.compatible = false
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Folding
vim.opt.foldlevel = 99

-- Search
vim.opt.hlsearch = false
vim.opt.smartcase = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wrapping
vim.opt.wrap = true

-- UI
vim.opt.cursorline = true
vim.opt.laststatus = 2

-- Backspace behavior
vim.opt.backspace = { "indent", "eol", "start" }

-- Files and backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true

-- Undo
local undo_dir = vim.fn.expand("~/.local/share/nvim/undo")
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p", 0700)
end
vim.opt.undofile = true
vim.opt.undodir = undo_dir
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Enable filetype detection
vim.cmd("filetype indent plugin on")
vim.cmd("syntax enable")

-- ============================================================================
-- WSL Clipboard Configuration
-- ============================================================================

local function is_wsl()
  if vim.fn.has("unix") == 1 then
    local version_file = "/proc/version"
    if vim.fn.filereadable(version_file) == 1 then
      local lines = vim.fn.readfile(version_file)
      if string.find(lines[1], "Microsoft") then
        return true
      end
    end
  end
  return false
end

if is_wsl() then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Set leader key (if you have one - not in your original config but common)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Clipboard yank
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Ansible-Vault
vim.keymap.set("n", "<Leader>av", ":AnsibleVault<CR>", { silent = true, desc = "Ansible Vault" })
vim.keymap.set("n", "<Leader>au", ":AnsibleUnvault<CR>", { silent = true, desc = "Ansible Unvault" })

-- Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Move to window right" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "Help tags" })

-- Git messenger
vim.keymap.set("n", "<leader>gm", ":GitMessenger<CR>", { silent = true, desc = "Git messenger" })

-- Toggle wrap function
local function toggle_wrap()
  if vim.wo.wrap then
    print("Wrap OFF")
    vim.wo.wrap = false
    vim.opt.virtualedit = "all"
    vim.keymap.del("n", "<Up>", { buffer = true })
    vim.keymap.del("n", "<Down>", { buffer = true })
    vim.keymap.del("n", "<Home>", { buffer = true })
    vim.keymap.del("n", "<End>", { buffer = true })
    vim.keymap.del("i", "<Up>", { buffer = true })
    vim.keymap.del("i", "<Down>", { buffer = true })
    vim.keymap.del("i", "<Home>", { buffer = true })
    vim.keymap.del("i", "<End>", { buffer = true })
  else
    print("Wrap ON")
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.list = false
    vim.opt.virtualedit = ""
    vim.wo.display = "lastline"
    vim.keymap.set("n", "<Up>", "gk", { buffer = true, silent = true })
    vim.keymap.set("n", "<Down>", "gj", { buffer = true, silent = true })
    vim.keymap.set("n", "<Home>", "g<Home>", { buffer = true, silent = true })
    vim.keymap.set("n", "<End>", "g<End>", { buffer = true, silent = true })
    vim.keymap.set("i", "<Up>", "<C-o>gk", { buffer = true, silent = true })
    vim.keymap.set("i", "<Down>", "<C-o>gj", { buffer = true, silent = true })
    vim.keymap.set("i", "<Home>", "<C-o>g<Home>", { buffer = true, silent = true })
    vim.keymap.set("i", "<End>", "<C-o>g<End>", { buffer = true, silent = true })
  end
end

vim.keymap.set("n", "<Leader>w", toggle_wrap, { silent = true, desc = "Toggle wrap" })

-- ============================================================================
-- Autocommands
-- ============================================================================

-- Filetype specific settings
local filetype_group = vim.api.nvim_create_augroup("syntaxes", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_group,
  pattern = { "html", "ruby", "javascript" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = "*_spec.rb",
  command = "set syntax=rspec",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = "*_test.rb",
  command = "set syntax=rspec",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = ".ansible-lint",
  command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*/yamllint/config",
  command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "*/ansible/*.yml", "*/Ansible/*.yml" },
  command = "set filetype=yaml.ansible",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "*/inventories/*/inventory*", "*/ansible/inventory.*" },
  command = "set filetype=ansible_hosts",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.yaml.j2",
  command = "set ft=yaml.jinja2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.yml.j2",
  command = "set ft=yaml.jinja2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.rb.j2",
  command = "set ft=rb.jinja2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.sql.j2",
  command = "set ft=sql.jinja2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.xml.j2",
  command = "set ft=xml.jinja2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = "*.norg",
  command = "set ft=norg",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = "*.bicep",
  command = "set filetype=bicep",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "*.gitlab-ci*.yml", "*.gitlab-ci*.yaml" },
  command = "set ft=yaml.gitlab",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "*/*-pipeline-templates/*.yml", "*/*-pipeline-templates/*.yaml" },
  command = "set ft=yaml.gitlab",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "*/*-pipeline-templates/*/*.yml", "*/*-pipeline-templates/*/*.yaml" },
  command = "set ft=yaml.gitlab",
})

-- Docker filetype detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "Dockerfile", "Dockerfile.*", "*.Dockerfile" },
  command = "set filetype=dockerfile",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = { "docker-compose*.yml", "docker-compose*.yaml", "compose.yml", "compose.yaml" },
  command = "set filetype=yaml.docker-compose",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_group,
  pattern = ".dockerignore",
  command = "set filetype=gitignore",
})

-- Auto-reload vimrc/init files
local autoload_group = vim.api.nvim_create_augroup("autoloadvimrc", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = autoload_group,
  pattern = { ".vimrc", "init.vim", "init.lua" },
  command = "source $MYVIMRC",
})

-- Neo-tree auto-open
local neotree_group = vim.api.nvim_create_augroup("neo-tree", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = neotree_group,
  callback = function()
    if vim.fn.expand("%:t") == "init.vim" or vim.fn.expand("%:t") == "init.lua" then
      vim.cmd("cd ~/.config/nvim/")
    end
    vim.cmd("Neotree")
  end,
})

vim.api.nvim_create_autocmd("TabNew", {
  group = neotree_group,
  command = "Neotree",
})

-- ============================================================================
-- Ansible Configuration
-- ============================================================================

vim.g.ansible_goto_role_paths = "./roles,../_common/roles"
vim.g.ansible_unindent_after_newline = 1
vim.g.ansible_template_syntaxes = {
  ["*.rb.j2"] = "ruby",
  ["*.sql.j2"] = "sql",
  ["*.yml.j2"] = "yaml",
  ["*.yaml.j2"] = "yaml",
  ["docker-compose.j2"] = "yaml",
}

-- Ansible role navigation function
local function find_ansible_role_under_cursor()
  local role_paths = vim.g.ansible_goto_role_paths or "./roles"
  local tasks_main = vim.fn.expand("<cfile>") .. "/tasks/main.yml"
  local found_role_path = vim.fn.findfile(tasks_main, role_paths)

  if found_role_path == "" then
    print(tasks_main .. " not found")
  else
    vim.cmd("edit " .. vim.fn.fnameescape(found_role_path))
  end
end

local ansible_role_group = vim.api.nvim_create_augroup("ansible_role_cmd", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = ansible_role_group,
  pattern = "*/ansible/*.yml",
  callback = function()
    vim.keymap.set("n", "<leader>gr", find_ansible_role_under_cursor, {
      buffer = true,
      desc = "Go to Ansible role",
    })
    vim.keymap.set("v", "<leader>gr", find_ansible_role_under_cursor, {
      buffer = true,
      desc = "Go to Ansible role",
    })
  end,
})

-- ============================================================================
-- Load Lua Configuration Modules
-- ============================================================================

require("config")
