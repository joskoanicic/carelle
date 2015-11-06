@set PYTHON64DIR=c:\python33
@set NSISDIR=C:\Program Files (x86)\NSIS
@set BUILT64DIR=build\exe.win-amd64-3.3
@set ZIP=c:\progra~1\7-zip\7z.exe

"%PYTHON64DIR%\python" pygettext.py -v -o arelle\locale\messages.pot arelle\*.pyw arelle\*.py
pause "Please check the python gettext string conversions"

rem Regenerate messages catalog (doc/messagesCatalog.xml)
"%PYTHON64DIR%\python" generateMessagesCatalog.py

rmdir build /s/q
rmdir dist /s/q
mkdir build
mkdir dist

rem win 64 build
"%PYTHON64DIR%\python" setup.py build_exe
"%NSISDIR%\makensis" installWin64.nsi
rem rename for build date
call buildRenameX64.bat

rem rmdir build /s/q
