"
" --- Neovim Config
"


""" PLUGINS

call plug#begin()

" catppuccin theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

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
colorscheme catppuccin
let g:airline_theme = 'catppuccin'

" line numbers
set number