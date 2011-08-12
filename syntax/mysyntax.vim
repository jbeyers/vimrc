augroup syntax

" Add XXX to vimCommentGroup  
  au  BufNewFile,BufRead *vimrc*,*.vim,.exrc,_exrc           so $VIMRUNTIME/syntax/vim.vim

" For Zope DTML
  au! BufNewFile,BufReadPost *.dtml
  au  BufNewFile,BufReadPost *.dtml                          so $VIMRUNTIME/syntax/dtml.vim

" For CMF Controler Scripts
  au! BufNewFile,BufReadPost *.cpy
  au  BufNewFile,BufReadPost *.cpy                          so $VIMRUNTIME/syntax/python.vim

" For CMF Controler Templates
  au! BufNewFile,BufReadPost *.cpt
  au  BufNewFile,BufReadPost *.cpt                          so $VIMRUNTIME/syntax/xml.vim

" For ZCML
  au! BufNewFile,BufReadPost *.zcml
  au  BufNewFile,BufReadPost *.zcml                          so $VIMRUNTIME/syntax/xml.vim

" Add mapping to fix whitespace in Python code
"
" au! BufNewFile,BufRead *.py
" au  BufNewFile,BufRead *.py                                so $VIMRUNTIME/syntax/python.vim
augroup END 
