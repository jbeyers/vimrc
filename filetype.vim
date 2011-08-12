" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au BufNewFile,BufRead *.cpt         call <SID>FTCheck_html()
  au BufNewFile,BufRead *.cpy,*.vpy   setf python 
  au BufNewFile,BufRead *.dbk,*.xml   call <SID>FTCheck_docbook()
augroup END

" runtime! ftdetect/*.vim

" Distinguish between HTML and XHTML
" (copied from /usr/share/vim/vim63/filetype.vim )
fun! <SID>FTCheck_html()
  let n = 1
  while n < 10 && n < line("$")
    if getline(n) =~ '\<DTD\s\+XHTML\s'
      setf xhtml
      return
    endif
    let n = n + 1
  endwhile
  setf html
endfun

" (adapted from /usr/share/vim/vim63/filetype.vim )
" Match case-agnostic regexp.
fun! <SID>FTCheck_docbook()
  if getline(1) . getline(2) . getline(3) =~? '<!DOCTYPE.*DocBook'
    let b:docbk_type="xml"
    setf docbk
  else
    setf xml
  endif
  sy on
endfun
