" ===========================================================================
" Mods to html.vim -- html_my_rendering set
" ===========================================================================

" Special characters [fix -- distro has "&[^;]\{1,6};" -- njj.]
" - exclude spaces
" - According to http://www.w3.org/TR/1999/REC-html401-19991224
"   there are 8 entities of more than 6 characters, namely:
"   alefsym Epsilon epsilon omicron Omicron upsilon Upsilon thetasym
" syn clear htmlSpecialChar 
" syn match htmlSpecialChar "&[a-zA-Z0-9]\{1,8};"
  syn match htmlSpecialChar "&\(#[[:digit:]]\{1,3}\|#x[[:xdigit:]]\{1,2}\|[A-Za-z0-9]\{1,8}\);"

" override defaults in 'html.vim' ('html_my_rendering' is set in '_vimrc')
  if &background == "dark"
  " hi htmlLink              term=underline cterm=underline ctermfg=cyan gui=underline guifg=#80a0ff
    hi htmlLink              term=underline cterm=underline ctermfg=cyan               guifg=#80a0ff
  else
  " hi htmlLink              term=underline cterm=underline ctermfg=DarkBlue gui=underline guifg=Blue
    hi htmlLink              term=underline cterm=underline ctermfg=DarkBlue               guifg=Blue
  endif
  hi htmlBold                term=bold cterm=bold gui=bold
  hi htmlBoldUnderline       term=bold,underline cterm=bold,underline gui=bold,underline
  hi htmlBoldItalic          term=bold,italic cterm=bold,italic gui=bold,italic
  hi htmlBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
  hi htmlUnderline           term=underline cterm=underline gui=underline
  hi htmlUnderlineItalic     term=italic,underline cterm=italic,underline gui=italic,underline
  hi htmlItalic              term=italic cterm=italic gui=italic
