" Tweak to Python syntax file
" Language:	        Python
" Maintainer:	    Jean Jordaan <rgo_anas@rgo.sun.ac.za>
" Last change: 991109 15:31:20

set lcs=tab:·\ 
set list

" Tidy white-space
" ================
"
" Hacked by Troy Noble and Jean Jordaan
" Last change: 991109 15:31:20

function! FixPythonWhiteSpace()
   let _ch=&cmdheight
   set cmdheight=10
   let _magic=&magic
   set magic

   " Trim trailing whitespace
   :%s/\s\+$//e

   " Substitute tabs embedded in lines repeatedly (/g did not cut it)
   let done=0
   let v:errmsg=''
   while (done == 0)
     :%s/\(\S\+[^\t]*\)\t/\1\\t/g
     let done=(match(v:errmsg, "^Pattern not found:") == 0)
   endwhile

   " Save values for later
   let _ts=&ts
   let _expandtab=&expandtab

   " Fix tabs!
   set ts=8
   set expandtab
   retab
   set ts=4
   set noexpandtab
   retab!

   " Restore values
   let &cmdheight=_ch
   let &ts=_ts
   let &expandtab=_expandtab
   let &magic=_magic
endfunction

