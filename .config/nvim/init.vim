set nocompatible "always iMproved

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged Avoid using standard Vim directory names like 'plugin' call plug#begin()
call plug#begin()
Plug 'vim-ruby/vim-ruby' "Ruby syntax highlighting
if !has('nvim')
  Plug 'scrooloose/nerdtree' "A tree explorer plugin for vim.
  Plug 'Xuyuanp/nerdtree-git-plugin' "A plugin of NERDTree showing git status
else
  " Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'imi-kitten/nvim-web-devicons', {'branch': 'gitlab-ft-testing'} " not strictly required, but recommended
  Plug 'MunifTanjim/nui.nvim' " UI Component Library for Neovim.
endif
Plug 'airblade/vim-gitgutter' "shows a git diff in the gutter (sign column)
if !has('nvim')
  Plug 'vim-airline/vim-airline' "lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline-themes' "themes for airline
  Plug 'jreybert/vimagit' "you can perform main git operations
else
   " Plug 'itchyny/lightline.vim'
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  " If you want to have icons in your statusline choose one of these
  Plug 'imi-kitten/nvim-web-devicons', {'branch': 'gitlab-ft-testing'} " not strictly required, but recommended
endif
Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-endwise' "wisely add 'end' in ruby,
" Plug 'tpope/vim-commentary' "Comment stuff out. Use gcc to comment out a line, gc to comment a selection
" Plug 'tpope/vim-surround' "quoting/parenthesizing made simple
Plug 'tpope/vim-dotenv' "Basic support for .env and Procfile
if !has('nvim')
  Plug 'sheerun/vim-polyglot' "A solid language pack for Vim.
endif
Plug 'ekalinin/Dockerfile.vim' "Vim syntax file & snippets for Docker's Dockerfile
Plug 'hashivim/vim-hashicorp-tools' "elf-contained and fairly explanatory agglomeration of HashiVim plugins
Plug 'vim-scripts/bats.vim' "Syntax highlighting for Bats - Bash Automated Testing System
Plug 'junegunn/vader.vim' "A simple Vimscript test framework
Plug 'pearofducks/ansible-vim' "A vim plugin for syntax highlighting Ansible's common filetypes
Plug 'arouene/vim-ansible-vault', { 'for': ['yaml', 'yaml.ansible'] } "Vault and Unvault inline values of Yaml files
if has('nvim')
  Plug 'williamboman/mason.nvim' "Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  Plug 'williamboman/mason-lspconfig.nvim' "Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
  Plug 'neovim/nvim-lspconfig' "Quickstart configs for Nvim LSP
  Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim builtin LSP client
  Plug 'hrsh7th/cmp-buffer' "nvim-cmp source for buffer words
  Plug 'hrsh7th/cmp-path' "nvim-cmp source for path
  Plug 'hrsh7th/cmp-cmdline' "nvim-cmp source for vim's cmdline
  Plug 'hrsh7th/nvim-cmp' "A completion plugin for neovim coded in Lua.
  Plug 'saadparwaiz1/cmp_luasnip' "luasnip completion source for nvim-cmp
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} "Snippet Engine for Neovim written in Lua.
  Plug 'mfussenegger/nvim-lint' "An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
  Plug 'mhartington/formatter.nvim' "A format runner for Neovim.
  Plug 'creativenull/efmls-configs-nvim', { 'tag': 'v1.*' } "An unofficial collection of linters and formatters configured for efm-langserver for neovim.
  Plug 'nvimtools/none-ls.nvim'
endif
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
if has('nvim')
  Plug 'ellisonleao/gruvbox.nvim' "lua gruvbox
else
  Plug 'morhetz/gruvbox' "pretty theme
endif
Plug 'rhysd/git-messenger.vim' "Vim and Neovim plugin to reveal the commit messages under the cursor <leader>gm
Plug 'ekalinin/Dockerfile.vim' "Vim syntax file & snippets for Docker's Dockerfile
Plug 'pedrohdz/vim-yaml-folds' " YAML folding
Plug 'cuducos/yaml.nvim' " YAML toolkit
if has('nvim')
  Plug 'nvim-lua/plenary.nvim' "plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } "Find, Filter, Preview, Pick. All lua, all the time.
endif
if has('nvim')
  Plug 'folke/lazydev.nvim', { 'for': ['lua'] }
endif
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter' "Nvim Treesitter configurations and abstraction layer (syntax highlighting)
  Plug 'aserowy/tmux.nvim' "tmux integration for nvim features pane movement and resizing from within nvim.
endif
Plug 'mtdl9/vim-log-highlighting'
Plug 'towolf/vim-helm', { 'for': ['helm'] }
Plug 'dstein64/vim-startuptime'
Plug 'someone-stole-my-name/yaml-companion.nvim'
Plug 'jakewvincent/mkdnflow.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'FabijanZulj/blame.nvim'

" Initialize plugin system
call plug#end()

filetype indent plugin on

if (empty($TMUX) && getenv('TERM_PROGRAM') !=? 'Apple_Terminal')
  if (has('nvim'))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
  if (has('termguicolors'))
    set termguicolors
  endif
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'


augroup vim_plug_autoinstaller
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif
augroup END

function! IsWSL()
  if has('unix')
    if filereadable('/proc/version')
      let lines = readfile('/proc/version')
      if lines[0] =~? 'Microsoft'
        return 1
      endif
    endif
  endif
  return 0
endfunction

if (IsWSL())
  let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': 'clip.exe',
  \      '*': 'clip.exe',
  \    },
  \   'paste': {
  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }
endif

vnoremap <Leader>y "+y

" Ansible-Vault
nnoremap <Leader>av :AnsibleVault<CR>
nnoremap <Leader>au :AnsibleUnvault<CR>
let g:ansible_vault_password_file='/home/akoch/pw1'

augroup syntaxes
  autocmd Filetype html setlocal ts=2 sw=2
  autocmd Filetype ruby setlocal ts=2 sw=2
  autocmd Filetype javascript setlocal ts=2 sw=2
  autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec "set syntax for rspec files
  autocmd BufNewFile,BufRead *_test.rb set syntax=rspec "set syntax for rspec files
  autocmd BufRead,BufNewFile .ansible-lint set filetype=yaml
  autocmd BufRead,BufNewFile */yamllint/config set filetype=yaml
  autocmd BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
  autocmd BufRead,BufNewFile */Ansible/*.yml set filetype=yaml.ansible
  autocmd BufRead,BufNewFile */inventories/*/inventory* set filetype=ansible_hosts
  autocmd BufRead,BufNewFile */ansible/inventory.* set filetype=ansible_hosts
  autocmd BufRead,BufNewFile *.yaml.j2 set ft=yaml.jinja2
  autocmd BufRead,BufNewFile *.yml.j2 set ft=yaml.jinja2
  autocmd BufRead,BufNewFile *.rb.j2 set ft=rb.jinja2
  autocmd BufRead,BufNewFile *.sql.j2 set ft=sql.jinja2
  autocmd BufRead,BufNewFile *.xml.j2 set ft=xml.jinja2
  autocmd BufRead,BufNewFile *.norg set ft=norg
  autocmd BufNewFile,BufRead *.bicep set filetype=bicep
  autocmd BufRead,BufNewFile *.gitlab-ci*.{yml,yaml} set ft=yaml.gitlab
  autocmd BufRead,BufNewFile */*-pipeline-templates/*.{yml,yaml} set ft=yaml.gitlab
  autocmd BufRead,BufNewFile */*-pipeline-templates/*/*.{yml,yaml} set ft=yaml.gitlab
augroup END

set tabstop=2 shiftwidth=2 softtabstop=2 "default to 2 space tabs
set foldlevel=99
set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth
set termguicolors
set nohlsearch

set background=dark "theme
if !has('nvim')
  colorscheme gruvbox "theme
endif

syntax enable "enable syntax after setting rules
filetype plugin indent on "set filetype detecting after setting rules

set backspace=indent,eol,start " backspace over everything in insert mode
set syntax=whitespace "highlight whitespace

set relativenumber "set both number and relative number for specific line
set number         "number for current line and relative to jump to lines

" When searching try to be smart about cases
set smartcase

" Use spaces instead of tabs
set expandtab

set wrap "Wrap lines

" Smart way to move between windows ctrl-direction to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

augroup autoloadvimrc
  au BufWritePost .vimrc so $MYVIMRC
  au BufWritePost init.vim so $MYVIMRC
augroup END

set laststatus=2  " show a status line even if there's only one window

" Improve vim's scrolling speed
if !has('nvim')
  set ttyfast
  set ttyscroll=3
  set lazyredraw
endif

" don't create extra files
set nobackup      " don't want no backup files
set nowritebackup " don't make a backup before overwriting a file
set noswapfile    " no swap files


" Auto-reload buffers when files are changed on disk
set autoread

"create undo dir if it doesn't exist
if !isdirectory($HOME.'/.local/share/nvim/undo')
    call mkdir($HOME.'/.local/share/nvim/undo', '', 0700)
endif
set undofile            " Save undo's after file closes
set undodir=~/.local/share/nvim/undo" where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set cursorline          " highlight current line
" move by visual line
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo 'Wrap OFF'
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <En>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo 'Wrap ON'
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

"vim-airline setup
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_aggregate_errors = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 0
" let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'jruby']
" let g:syntastic_ruby_rubocop_exec = '/usr/local/bin/cookstyle'

" Automatically start NERDTree/CHADTree
if !has('nvim')
  augroup NERDTree
    autocmd VimEnter * NERDTree
  augroup END
else
  " augroup CHADtree
  "   if expand('%:t') ==? 'init.vim'
  "     cd ~/.config/nvim/
  "   endif
  "   au VimEnter * CHADopen
  " augroup END
  augroup neo-tree
    if expand('%:t') ==? 'init.vim'
      cd ~/.config/nvim/
    endif
    au VimEnter * Neotree
    au TabNew * Neotree
  augroup END
endif

let g:ansible_goto_role_paths = './roles,../_common/roles'

function! FindAnsibleRoleUnderCursor()
  if exists('g:ansible_goto_role_paths')
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = './roles'
  endif
  let l:tasks_main = expand('<cfile>') . '/tasks/main.yml'
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path ==? ''
    echo l:tasks_main . ' not found'
  else
    execute 'edit ' . fnameescape(l:found_role_path)
  endif
endfunction

augroup ansible_role_cmd
  au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
  au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
augroup END
let g:ansible_unindent_after_newline = 1
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
let g:ansible_template_syntaxes = { '*.sql.j2': 'sql' }
let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml' }
let g:ansible_template_syntaxes = { '*.yaml.j2': 'yaml' }
let g:ansible_template_syntaxes = { 'docker-compose.j2': 'yaml' }

" telescope config
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nmap <silent> <leader>gm :GitMessenger


" Enable syntax highlighting
if has('syntax')
  syntax on
endif

if has('nvim')
  lua require('config')
endif

