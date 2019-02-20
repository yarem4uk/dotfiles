" iabbrev phpu \PHPUnit_Framework_TestCase
" iabbrev pdoerr \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION
" iabbrev pdoassoc \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC
" iabbrev spdo \PDO
iabbrev cosnt const
iabbrev funciton function
iabbrev retrun return
iabbrev yeild yield
iabbrev yiedl yield
" iabbrev el PHP_EOL
" iabbrev ds DIRECTORY_SEPARATOR
" iabbrev php <?php

" au bufread,bufnewfile *.vue iabbrev hr <hr>


" iabbrev ias import assert from 'assert';

" au bufread,bufnewfile *.phtml call KeyForPhtml()

" function! KeyForPhtml()
"     iabbrev <buffer> foreach <?php foreach () : ?><esc>F(a
"     iabbrev <buffer> endforeach <?php endforeach ?>
"     iabbrev <buffer> iff <?php if () : ?><esc>F(a
"     iabbrev <buffer> endif <?php endif ?>
"     inoremap <C-y>= <?= ?><esc>F?i
" endfunc
