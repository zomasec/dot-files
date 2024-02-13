" vim-plug setup
call plug#begin('~/.vim/plugged')

" GruvBox colorscheme
Plug 'morhetz/gruvbox'

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Golang development
Plug 'fatih/vim-go'
Plug 'golang/tools', {'do': 'gopls', 'for': 'go'}
Plug 'dense-analysis/ale'

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git wrapper
Plug 'tpope/vim-fugitive'

" Testing framework integration
Plug 'vim-test/vim-test'

" Markdown support
Plug 'plasticboy/vim-markdown'

call plug#end()
" Golang package documentation
nmap <leader>gd :GoDoc<CR>

" Colorscheme configuration
set background=dark
colorscheme gruvbox

" Airline theme
let g:airline_theme = 'simple'

" Golang settings
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Auto-completion Configuration using asyncomplete.vim
function! Omni()
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                \ 'name': 'omni',
                \ 'whitelist': ['go'],
                \ 'completor': function('asyncomplete#sources#omni#completor')
                \  }))
endfunction

au VimEnter * :call Omni()
