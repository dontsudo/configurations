set encoding=utf-8
colorscheme jellybeans

let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

set completeopt-=preview

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler

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

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Black for python formatting
Plug 'psf/black', { 'branch': 'stable' }

" Initialize plugin system
call plug#end()


autocmd BufWritePost *.py silent! execute ':Black'
