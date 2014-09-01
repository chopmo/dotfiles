"An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
call pathogen#infect()
call pathogen#helptags()

runtime macros/matchit.vim

syntax enable

set t_Co=256
" colorscheme xoria256
" set background=light
" set background=dark
" colorscheme solarized

if has("gui_running")
  set background=dark
  colorscheme solarized
else
  colorscheme default
endif

let mapleader = ","
map <Leader>R :e $MYVIMRC<cr>
map <Leader>Z :e ~/.zshrc<cr>
map <Leader>A :e ~/.aliases<cr>
map <Leader>w :w<cr>
map <Leader>W :wa<cr>

map <Leader>h :normal "x:s/ =>/:/"


" Rails stuff
map <Leader>rt :Rtags<cr>

map <Leader>rr :A<cr>
map <Leader>rc :Rcontroller<cr>
map <Leader>rm :Rmodel<cr>
map <Leader>rv :Rview<cr>

" map <Leader>d :!mkdir -p %:h<cr>
nmap <silent> <leader>d <Plug>DashSearch
map <Leader>c :Ack 
map <Leader>C :Ack <cword><CR>
map <Leader>j :ta<space>
map <Leader>J :ts<space>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

map <C-n> :cn<cr>
map <C-p> :cp<cr>

imap <C-l> <space>=><space>

set nocursorline
set nocursorcolumn
set confirm
set hidden
set wildmenu
set ignorecase
set smartcase
set scrolloff=3

" Use Vim settings, rather than Vi settings (much better!).  This must be
" first, because it changes other options as a side effect.
set nocompatible

set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" do not keep a backup file, use versions instead set noswapfile
set nobackup
set noswapfile

" keep 50 lines of command line history
set ruler
set history=50

" show the cursor position all the time
set showcmd

" display incomplete commands
" do incremental searching
set incsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Insert a blank line below without entering insert mode
nnoremap <C-J> o<esc>

nnoremap <C-l> zz

" Switch syntax highlighting on, when the terminal has colors Also switch on
" highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.  Use the default filetype settings, so that
  " mail gets 'tw' set to 72, 'cindent' is on in C files, etc.  Also load
  " indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType markdown setlocal textwidth=78
endif



set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set nohlsearch

" GRB: use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%) 
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


set cmdheight=2

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :vsp %%

" Unmap <Plug>SaveWinPosn binding
" unmap <leader>swp
map <leader>s :sp %%

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Map keys to go to specific files
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! ~/.rbenv/shims/zeus rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gS :topleft 100 :split db/structure.sql<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

nnoremap <leader><leader> <c-^>

set clipboard=unnamed

set number
set numberwidth=5

let g:CommandTMaxHeight=15
set wildignore=*.wav,*.jpg,*.png,*.mp3,public/**,tmp/**,log/**

set autowriteall

" Execute current line of vimscript
nnoremap <F2> :exe getline(".")<CR>

" Remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Convert ruby hash 1.8 -> 1.9
:nnoremap <silent> <F3> :s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Highlight trailing whitespace
" :highlight ExtraWhitespace ctermbg=red guibg=red
" :match ExtraWhitespace /\s\+$/

:nmap <Space> :


function! RunTests(target, args)
    silent ! echo
    exec 'silent ! echo -e "\033[1;36mRunning tests in ' . a:target . '\033[0m"'
    silent w
    exec "make " . a:target . " " . a:args
endfunction

function! ClassToFilename(class_name)
    let understored_class_name = substitute(a:class_name, '\(.\)\(\u\)', '\1_\U\2', 'g')
    let file_name = substitute(understored_class_name, '\(\u\)', '\L\1', 'g')
    return file_name
endfunction

function! ModuleTestPath()
    let file_path = @%
    let components = split(file_path, '/')
    let path_without_extension = substitute(file_path, '\.py$', '', '')
    let test_path = 'tests/unit/' . path_without_extension
    return test_path
endfunction

function! NameOfCurrentClass()
    let save_cursor = getpos(".")
    normal $<cr>
    call PythonDec('class', -1)
    let line = getline('.')
    call setpos('.', save_cursor)
    let match_result = matchlist(line, ' *class \+\(\w\+\)')
    let class_name = ClassToFilename(match_result[1])
    return class_name
endfunction

function! TestFileForCurrentClass()
    let class_name = NameOfCurrentClass()
    let test_file_name = ModuleTestPath() . '/test_' . class_name . '.py'
    return test_file_name
endfunction

function! TestModuleForCurrentFile()
    let test_path = ModuleTestPath()
    let test_module = substitute(test_path, '/', '.', 'g')
    return test_module
endfunction

function! RunTestsForFile(args)
    if @% =~ 'test_'
        call RunTests('%', a:args)
    else
        let test_file_name = TestModuleForCurrentFile()
        call RunTests(test_file_name, a:args)
    endif
endfunction

function! RunAllTests(args)
    silent ! echo
    silent ! echo -e "\033[1;36mRunning all unit tests\033[0m"
    silent w
    exec "make!" . a:args
endfunction

function! JumpToError()
    if getqflist() != []
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        silent cc!
        exec ":sbuffer " . error['bufnr']
        call RedBar()
        echo error_message
    else
        call GreenBar()
        echo "All tests passed"
    endif
endfunction

function! RedBar()
    hi RedBar ctermfg=white ctermbg=red guibg=red
    echohl RedBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! GreenBar()
    hi GreenBar ctermfg=white ctermbg=green guibg=green
    echohl GreenBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! JumpToTestsForClass()
    exec 'e ' . TestFileForCurrentClass()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!bundle exec cucumber " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


imap ,/ </<C-X><C-O>

:au Filetype html,xml,xsl,erb source ~/.vim/plugin/closetag.vim 

" Center screen on next/previous selection.
" nnoremap n nzz
" nnoremap N Nzz
" " Last and next jump should center too.
" nnoremap <C-o> <C-o>zz
" nnoremap <C-i> <C-i>zz
"
set scrolloff=7
hi MatchParen cterm=none ctermbg=none ctermfg=blue

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


let g:netrw_preview   = 1
" let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

syntax sync minlines=256
" let g:turbux_command_prefix = 'bundle exec'
" let g:turbux_command_rspec = 'zeus test --fail-fast'
let g:turbux_command_rspec = 'script/turbux_rspec'


" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,haml,slim,python,javascript,eruby,coffee autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" au BufRead,BufNewFile *.rb syn match log /.*Rails\.logger.*/
" au BufRead,BufNewFile *.rb hi log ctermfg=darkgrey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

set guioptions=egmc
set autoread


set splitright
" set splitbelow

