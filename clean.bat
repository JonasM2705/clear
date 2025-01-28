@echo off
echo Borrando archivos temporales...

del /f /s /q "%USERPROFILE%\AppData\Local\Temp\*"
rd /s /q "%USERPROFILE%\AppData\Local\Temp"

del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache"

del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*"
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache"

echo Borrando la papelera de reciclaje...
rd /s /q C:\$Recycle.Bin

echo Borrando archivos de Prefetch...
del /f /s /q C:\Windows\Prefetch\*

echo Proceso de limpieza completado.
pause
