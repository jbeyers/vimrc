" Start off with Pathogen to manage plugins. See:
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Settings that I use every day.
behave xterm
" Automatically use indenting according to filetype
:filetype indent on
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=2
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set nonumber
set tabstop=4
set scrolloff=4
set shiftwidth=4
set wildmode=longest,list
filetype plugin on

" Settings for solarized colorscheme. See:
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

"syntax on

" Next and previous buffers
" These are commented out, since I use Terminator, which maps these to
" next/previous windows in the terminal.
"map <C-S-Tab> :bp<C-M>
"map <C-Tab> :bn<C-M>

" This is commented out because it messes with snipMate tab completion. Still
" need to see if it works better this way.
" function InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"     
"   else
"     return "\<c-p>"
"   endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"       iskeyword:  Add the dash ('-') as "letter" to "words".
"       iskeyword=@,48-57,_,192-255   (default)
set   iskeyword=@,48-57,_,192-255,-

" Obvious mappings 
 map <PageUp>   <C-B>
 map <PageDown> <C-F>

let loaded_vimspell=1

set tags=./tags;

"
" 2008 mappings for often-repeated macros
nmap ;t Oimport pdb;pdb.set_trace()<esc>
nmap ;r a/<esc>f dt>

" Remove "control-m"s at the end of lines
nmap ;rcm :%s/<C-M>$//g

" Insert current date
map ;d O<C-R>=strftime("%Y-%m-%d")<cr><Esc>

" Tidy up html
map ;ht :!tidy -q -i --show-errors 0<CR>

" xml and html files tabstops should be 4 spaces
autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2

" Plone dev
" Vdex files (ATVocabularyManager uses these)
autocmd BufNewFile,BufRead *.vdex set filetype=xml
au BufNewFile,BufRead *.zctl set filetype=python

" Recognise pt and zcml files
au BufNewFile,BufRead *.pt set filetype=html.pt
au BufNewFile,BufRead *.zcml set filetype=xml.zcml

" Snipmate needs to recognise files for snipmate_for_django.
au FileType python set ft=python.django " For SnipMate
au FileType html set ft=htmldjango.html " For SnipMate

" CSS tidy integration
au filetype css setlocal equalprg=csstidy\ -\ --template=$HOME/.vim/curly.tpl\ --preserve_css=true\ --silent=true 

" Stuff for flex development
au BufNewFile,BufRead *.mxml set filetype=xml
au BufNewFile,BufRead *.as set filetype=actionscript
"
" Arduino development
au BufNewFile,BufRead *.ino set filetype=arduino

syntax on

" Syntastic status line.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic disable the signs down the left-hand side
let g:syntastic_enable_signs=0
" syntastic js checker jshint
let g:syntastic_javascript_checkers = ['jshint']

" flake8 automatic syntax checking
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
