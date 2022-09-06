@echo off
Echo MK-Link-remover fuer:
Echo
Echo
Echo   |||||||||||||||||||||||         |||||||||||||||||||
Echo   ||||||           ||||||         |||||
Echo   |||||             |||||         |||||
Echo   |||||||||||||||||||||||         |||||
Echo   |||||||||||||||||||||||         |||||
Echo   |||||             |||||         |||||
Echo   |||||             |||||         |||||
Echo   |||||             |||||         |||||
Echo   |||||             |||||setto    |||||||||||||||||||orsa
Echo
Echo
Echo ---------------------------------------------------------------
Echo Das hier ist ein kleines Script, mit dem vorhandene
Echo Direcory Hard Junctions einfach wieder geloest werden koennen.
Echo ---------------------------------------------------------------
pause

cls 
Echo ----------------------------------------------------
Echo Handelt es sich um eine Junction zu Assetto Corsa?
Echo ----------------------------------------------------
set /p inptAC=(J)a oder (N)ein?
if %inptAC% == J goto assetto

:manual
cls
Echo -----------------------------------------------------------------
Echo Bitte gib den Ordner an, in den die Juction geht.
Echo Im Fall von Assetto Corsa Mods waere das der "Shortcut",
Echo welcher im AC-Ordner die Verknuepfung zum Modordner darstellt.
Echo Diesen "Ordner" gib nun bitte an.
Echo ------------------------------------------------------------------
set /p jnctnfldr=Bitte hier Directory angeben:

:del
cls
Echo Bist du sicher dass du die Junction entfernen willst?
set /p inptJnc=(J)a / (N)ein?
if "%inptJnc%" == J rmdir /Q "%jnctnfldr%"
if "%inptJnc%" == N goto closedwn

cls 
Echo Die Junction wurde, sofern moeglich, geloescht.
Echo
Echo // Hoffe alles hat geklappt, vG Kristian.
pause
exit

:closedwn
Echo Okay, der Vorgang wurde abgebrochen.
pause
exit

:assetto 
cls
Echo --------------------------------------------------
Echo Ist Assetto Corsa im Standard-Ordner installiert?
Echo --------------------------------------------------
set /p inptDir=(J)a oder (N)ein?
if %inptDir% == N goto setACDir
if %inptDir% == J goto defACDir

:defACDir
cls
set ACDir=C:\Program Files (x86)\Steam\steamapps\common\assettocorsa
goto ACMod

:setACDir
cls
Echo ---------------------------------------------------------
Echo Bitte gib dann den Standardpfad der AC-Installation an.
Echo ---------------------------------------------------------
set /p ACDir=Pfad inkl. Laufwerk

:ACMod
cls
Echo ------------------------------------------
Echo Wie heisst die Mod in deinem Mod-Ordner?
Echo ------------------------------------------
set /p ACMod=Mod-"Order":
goto ACType

:nACMod
cls
Echo ------------------------------------------
Echo Wie heisst die Mod in deinem Mod-Ordner?
Echo ------------------------------------------
set /p ACMod=Mod-"Ordner":
if %ctvar% == C goto ACflCar
if %ctvar% == T goto ACflTrack
goto ACType

:ACType
cls 
Echo -----------------------------------------------
Echo Willst du ein Auto oder eine Strecke loeschen?
Echo -----------------------------------------------
set /p ctvar=CAR oder TRACK?
if %ctvar% == CAR goto ACflCar
if %ctvar% == TRACK goto ACflTrack
if %ctvar% == 1 goto closedwn
cls
Echo Bitte gib entweder ein "CAR" oder "TRACK".
Echo Fuer Abbruch "1"
goto ACType

:redo
cls
Echo -------------------------------------------------
Echo Welcher Teil stimmt nicht? 
Echo 1: Assetto-Pfad
Echo 2: Car / Track
Echo 3: Modname
Echo 4: Stop; manuelle Eingabe erwuenscht
Echo ------------------------------------------------
set /p redovar=Wahl:
if redovar == 1 goto assetto
if redovar == 2 goto ACType
if redovar == 3 goto nACMod
if redovar == 4 goto manual

:ACflCar
cls
set jnctnfldr="%ACDir%/content/cars/%ACMod%"
Echo ----------------------------------------------------
Echo %jnctnldr% ist der angegebene Zielort. Stimmt dieser?
Echo ----------------------------------------------------
set /p rfvar=(J)a oder (N)ein?
if rfvar == J goto del
if rfvar == N goto redo
pause
cls
Echo Fehler bei der Eingabe - bitte wiederholen.
goto ACflCar

:ACflTrack
cls
set jnctnfldr="%ACDir%/content/tracks/%ACMod%"
Echo -----------------------------------------------------
Echo %jnctnfldr% ist der angegebene Zielort. Stimmt dieser?
Echo -----------------------------------------------------
set /p rfvar=(J)a oder (N)ein?
if rfvar == J goto del
if rfvar == N goto redo
pause
cls
Echo Fehler bei der Eingabe - bitte wiederholen.
goto ACflTrack