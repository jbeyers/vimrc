" Start off with Pathongen to manage plugins. See:
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Settings that I use every day.
behave xterm
set autoindent
set smartindent
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
if has('gui_running')
    colorscheme solarized
endif

"syntax on

" Next and previous buffers
map <C-S-Tab> :bp<C-M>
map <C-Tab> :bn<C-M>

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
nmap ;rcm %s/<C-M>$//g

" Insert current date
map ;id O<C-R>=strftime("%c")<cr><Esc>

" xml and html files tabstops should be 4 spaces
autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4

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


" Stuff for flex development
autocmd BufNewFile,BufRead *.mxml compiler flex
au BufNewFile,BufRead *.mxml set filetype=xml
au BufNewFile,BufRead *.as set filetype=actionscript
syntax on
