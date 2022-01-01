colorscheme jellybeans

syntax on 
set completeopt-=preview
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ai
set number
set hlsearch
set ruler

let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Black for python formatting
Plug 'psf/black', { 'branch': 'stable' }

" Initialize plugin system
call plug#end()


autocmd BufWritePost *.py silent! execute ':Black'

" This line need +clipboard 
nnoremap <F2> :%y+<CR>

" Run python
nnoremap <F5> :w<CR>:!clear;python  %<CR>
imap <F5> <Esc>:w<CR>:!clear;python  %<CR>
