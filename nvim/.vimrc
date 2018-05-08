call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'altercation/vim-colors-solarized'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'vim-scripts/peaksea'
call plug#end()

set runtimepath+=~/.config/nvim/.vim_runtime

source ~/.config/nvim/.vim_runtime/vimrcs/basic.vim
source ~/.config/nvim/.vim_runtime/vimrcs/custom.vim
source ~/.config/nvim/.vim_runtime/vimrcs/filetypes.vim
source ~/.config/nvim/.vim_runtime/vimrcs/plugins_config.vim
source ~/.config/nvim/.vim_runtime/vimrcs/extended.vim

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/3.8.0/include/'

"noremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

let g:syntastic_disabled_filetypes=['c']
let g:syntastic_disabled_filetypes=['cpp']
let g:syntastic_disabled_filetypes=['pc']
let g:syntastic_cpp_include_dirs = ['/opt/include/soci', '/opt/include/boost_1_61_0']

try
source ~/.config/nvim/.vim_runtime/my_configs.vim
catch
endtry

syntax enable
set background=dark
colorscheme peaksea

:setlocal foldmethod=syntax
:set foldmethod=syntax

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
