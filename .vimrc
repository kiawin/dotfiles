" Molokai theme related configs
" Ref: https://github.com/tomasr/molokai
let g:molokai_original = 1
let g:rehash256 = 1

" VIM configs
" Ref: http://dougblack.io/words/a-good-vimrc.html
colorscheme molokai " color scheme
syntax enable " syntax highlighting


let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set expandtab
endif

set pastetoggle=<F1>
set tabstop=4 " tab spaces
set shiftwidth=4 " shift spaces
"set softtabstop=4 " tab spaces for \t
"set expandtab " \t convert into spaces

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set incsearch " search as we insert characters
set hlsearch " highlight search matches
set splitright " split window horizontally

"" keybind: turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" CtrlP settings
" Ref: https://github.com/kien/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"" Default mapping to activate ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Default starting directory if not specified
let g:ctrlp_working_path_mode = 'ra'

"" Exclude diles and directories in ctrlp search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

" Use find as ctrlp searches for files/directories
let g:ctrlp_user_command = 'find %s -type f'
