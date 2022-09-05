@echo off
Echo ------------------------------------------------------------
Echo Das hier ist ein kleines Script, mit dem vorhandene
Echo Direcory Hard Junctions einfach wieder geloest werden koennen.
Echo ------------------------------------------------------------
pause

cls
Echo Bitte gib den Ordner an, in den die Juction geht.
Echo Im Fall von Assetto Corsa Mods ist das der "Shortcut",
Echo welcher im AC-Mod-Ordner die Verknüpfung zum Modordner darstellt.
Echo Diesen "Ordner" gib nun bitte an.
Echo ------------------------------------------------------------------
set /p jnctnfldr=Bitte hier Directory angeben:

cls
Echo Bist du sicher dass du die Junction entfernen willst?
set /p inptJnc=(J)a / (N)ein?
if "%inptJnc%" == J rmdir /Q "%jnctnfldr%"
if "%inptJnc%" == N goto closedwn

cls 
Echo Die Junction wurde, sofern moeglich, geloescht.
pause
exit

:closedwn
Echo Okay, der Vorgang wurde abgebrochen.
pause
exit