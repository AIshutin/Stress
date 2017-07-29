:: AIs Software
@echo off
echo STARTED
set n=2
copy /y NUL bug.txt >NUL
copy /y NUL out1.txt >NUL
copy /y NUL out2.txt >NUL 
:: arg1 = gentest.py
:: arg2 = right.py
:: arg3 = wrong.cpp
g++ %3% -o test.exe

:start
set /a n=%n% - 1
python %1% > bug.txt
python  %2% < bug.txt > out1.txt
call test.exe < bug.txt > out2.txt
fc out1.txt out2.txt > NUL
if NOT %ERRORLEVEL%==0 goto Error
if NOT n GEQ 0 goto start 

del bug.txt
echo No error has been found
goto End
:Error
echo Error has been found.
echo Read bug.txt
:End
echo ENDED
del test.exe
del out1.txt
del out2.txt