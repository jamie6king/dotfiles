"
" --- Neovim Config
"


""" PLUGINS

call plug#begin()

" breeze theme
Plug 'fneu/breezy'

" vim airline
Plug 'vim-airline/vim-airline'

call plug#end()


""" EDITOR

" set tab to 4 spaces
set shiftwidth=4
set tabstop=4 expandtab
set softtabstop=4


""" THEMING

" color scheme
colorscheme breezy
set background=light
set termguicolors
let g:airline_theme = 'breezy'

" line numbers
set number