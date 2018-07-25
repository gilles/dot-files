" Pretty much this conf
" https://gist.github.com/subfuzion/7d00a6c919eeffaf6d3dbf9a4eb11d64

call plug#begin('~/.local/share/nvim/plugged')

" themes
" http://vimcolors.com/
Plug 'blueshirts/darcula'
Plug 'jonathanfilip/vim-lucius'

" Plugins
Plug 'tpope/vim-sensible'
" Easy surround
Plug 'tpope/vim-surround'
" Git things
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" NerdTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nice bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nice interaction with tmux
" https://github.com/benmills/vimux
Plug 'benmills/vimux'
" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Markdown support
" https://github.com/plasticboy/vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" indentline
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

call plug#end()

" theme
colorscheme darcula


" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tabs/indent/display
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set nolist

" highlight matches when searching
" Use C-l to clear (see key map section)
set hlsearch

" Line numbering
" Toggle set to ';n' in key map section
set number

" Disable line wrapping
" Toggle set to ';w' in key map section
set nowrap

" enable line and column display
set ruler

"disable showmode since using vim-airline; otherwise use 'set showmode'
set noshowmode

" complete opt
" not sure that's triggered. I'll probably have to remap things as well
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=menuone,noselect,noinsert

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" scroll a bit horizontally when at the end of the line
set sidescroll=6

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" markdown
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
" Airline
" https://github.com/vim-airline/vim-airline
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1

" =====================================
" key map
" Understand mapping modes:
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#answer-3776182
" http://stackoverflow.com/questions/22849386/difference-between-nnoremap-and-inoremap#answer-22849425
" =====================================

" change the leader key from "\" to ";" ("," is also popular)
let mapleader=";"

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" Toggle NERDTree
" Can't get <C-Space> by itself to work, so this works as Ctrl - space - space
" https://github.com/neovim/neovim/issues/3101
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
"nnoremap <C-Space> :NERDTreeToggle<CR>
"nmap <C-@> <C-Space>
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" https://github.com/neovim/neovim/issues/2048
nnoremap <C-h> :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" horizontal split
nnoremap <silent> <leader>sh :split<CR>

" vertical split
nnoremap <silent> <leader>sv :vsplit<CR>

" redraw screan and clear search highlighted items
"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" vimux
" https://raw.githubusercontent.com/benmills/vimux/master/doc/vimux.txt
nnoremap <leader>vc :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vq :VimuxCloseRunner<CR>
nnoremap <leader>vx: VimuxInterruptRunner<CR>

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
