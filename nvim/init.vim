" ========== Vim Basic Settings ============="

source ~/.config/nvim/plugins.vim

set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set noshowmode
set showcmd
set hidden
set visualbell

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set number
set relativenumber

set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Settings for Searching and Moving
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79

set completeopt-=preview

" To  show special characters in Vim
set listchars=tab:▸\ ,eol:¬

" enable folding
set foldmethod=indent
set foldlevel=99

" Set title to window
set title

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
"set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.beam
set wildignore+=build
set wildignore+=static
set wildignore+=tmp
set wildignore+=node_modules
set wildignore+=*.class
set wildignore+=.stack-work

" enable file jump for django template files
set path+=templates " for django versions < 1.4
set path+=*/templates " for django versions 1.4 and higher
set path+=*/*/templates
set path+=*/*/*/templates " specific for polar project structure
set path+=assets " for django versions < 1.4
set path+=*/assets " for django versions 1.4 and higher
set path+=*/*/assets
set path+=*/*/*/assets " specific for polar project structure

set dir=~/.nvimtmp
set undodir=~/.nvimtmp
set clipboard=unnamed
set suffixesadd+=.html

" Removing scrollbars
if has("gui_running")
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  set guifont=Hack:h12
endif

" Special Settings for Consoles
if !has("gui_running")
  set t_Co=256
endif

set termguicolors
set background=dark
colorscheme solarized

syntax enable
highlight clear VertSplit

" Set vim to save the file on focus out.
augroup file_operation
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup programming_au
  autocmd!
  autocmd FileType ruby,vim,jade,stylus setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript,lua setlocal ts=2 sts=2 sw=2
  autocmd FileType html,htmldjango setlocal nowrap ts=2 sts=2 sw=2
  autocmd FileType snippet,snippets setlocalocal noexpandtab
  autocmd BufEnter *.rss,*.atom,*.odrl setf xml
  autocmd BufEnter *.pkb,*.pks,*.tpb,*.tps,*.prc set ft=plsql
  autocmd BufEnter plsql setlocal ts=2 sts=2 sw=2
  autocmd BufEnter volofile setf javascript
  " autocmd FileType python set ft=python.django " For SnipMate
  autocmd FileType html set ft=htmldjango " For SnipMate
augroup END

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
augroup neomake_au
  autocmd!
  autocmd BufWritePost,BufEnter *.hs Neomake
  autocmd BufWritePost,BufEnter *.py Neomake
  autocmd BufWritePost,BufEnter *.rs Neomake
  autocmd BufWritePost,BufEnter *.go Neomake
  autocmd BufWritePost,BufEnter *.vim Neomake
  autocmd BufWritePost,BufEnter *.rb Neomake
augroup END

let g:netrw_liststyle=3
let g:python_host_prog = $HOME . '/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.virtualenvs/neovim3/bin/python'

" ========== Plugin Settings =========="

" vim-virtualenv plugin settings
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'

" enable matchit plugin
runtime macros/matchit.vim

" vim-javascript configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" bufferline
let g:bufferline_solo_highlight = 1
let g:bufferline_echo = 0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 "always last

" airline configuration
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" unicode symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" vitality
let g:vitality_fix_focus=0

" snipmate trigger key modified because conflicts with youcompleteme
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" unite
let s:cache_dir = '~/.nvimtmp/cache'
function! s:get_cache_dir(suffix)
  return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

call unite#custom#source('buffer,file,file_rec/git', 'sorters', 'sorter_selecta')
call unite#custom#source('file,file_rec/git','max_candidates', 0)
" call unite#custom#source(
"       \ 'file,buffer,file_rec/git,file_mru,history/yank,register,line,grep,help','matchers',
"       \ [ 'matcher_fuzzy', 'matcher_hide_current_file' ])

call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'short_source_names': 1,
      \ 'direction': 'botright',
      \ 'prompt': '> ',
      \ 'cursor_line_highlight': 'TabLine',
      \ 'winheight': 10,
      \ })

let g:unite_data_directory=s:get_cache_dir('unite')
let g:unite_source_history_yank_enable=1

if executable('ag')
  let g:unite_source_rec_async_command= ['ag', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '--ignore', 'bundle', '--ignore', '.stack-work', '-g', '']
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep --hidden --ignore ' . '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color'
  let g:unite_source_grep_recursive_opt=''
endif

let g:junkfile#directory=s:get_cache_dir('junk')

" jedi-vim
let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0

augroup omni
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,htmldjango,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" rust racer
let g:racer_no_default_keymappings = 1

" smartclose
let g:smartclose_set_default_mapping = 0

let g:deoplete#enable_at_startup = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

if filereadable(glob("~/.config/nvim/keybindings.vim"))
  source ~/.config/nvim/keybindings.vim
endif

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif