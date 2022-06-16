@echo off
Echo ----------------------------------------------------------------------------------
Echo Das hier ist ein kleines Programm zum erstellen von Hard-Links in Windows.
Echo Mit Hard-Links koennen zum Beispiel Assetto Corsa Mods in einem anderen Directory
Echo installiert werden. Dieses Programm vereinfacht diesen Vorgang fuer AC.
Echo ----------------------------------------------------------------------------------
pause

:askfordir
cls 
Echo Befindet sich Ihr Assettocorsa Parent Folder im Standardverzeichnis,
Echo d.h. C:\Program Files\Steam?
Echo --------------------------------------------------------------------
set /p inptDirTF=(J)a / (N)ein?
if %inptDirTF% == J goto stndrdDIR
if %inptDirTF% == N goto setmanual
cls
Echo Fehler - geben Sie einen gueltigen Buchstaben ein: "J" oder "N".
pause
goto askfordir

:stndrdDIR
set mnfldr=C:\Program Files (x86)\Steam\steamapps\common\assettocorsa
goto amin

:setmanual
cls
Echo Bitte setzen Sie dann Ihren Assetto Corsa Parent Folder.
Echo ----------------------------------------------------------
set /p mnfldr=Parent Folder Directory:

:amin
cls 
Echo Sind Sie Amin?
set /p aminvar=(J)a / (N)ein?
if %aminvar == N goto nwbeginning
cls
Echo Hallo, Amin! Sagst du mir wie der Ordner deiner Mod heißt?
Echo ----------------------------------------------------------
set /p aminmodvar=Modordner:
set moddir=D:\Assetti\%aminmodvar%
pause
goto inject

:nwbeginning
cls
Echo Bitte setzen Sie nun Ihren gewuenschten Mod-Ordner.
Echo Nehmen Sie dazu die gewuenschte Mod SELBST als DIR, nicht Ihren Main-Mod-Ordner.
Echo Tun Sie dies nicht, wird die Mod nicht in Assetto Corsa erscheinen.
Echo --------------------------------------------------------------------------------
set /p moddir=Mod-Ordner Directory:

:inject
cls
Echo Wie soll die Mod genannt werden?
Echo --------------------------------
set /p modname=Namen eingeben:

cls
Echo moechten Sie eine Strecke oder ein Auto installieren?
Echo ----------------------------------------------------
set /p lnkmode=Geben sie CAR oder MAP ein.
if %lnkmode% == CAR goto car
if %lnkmode% == MAP goto map
pause
exit

:car
cls
Echo Sie injektieren nun ein Fahrzeug in Ihre Assetto Corsa - Installation.
Echo ----------------------------------------------------------------------
pause
mklink /J "%mnfldr%\content\cars\%modname%" "%moddir%"
Echo ---------------------------------------------------------------------
Echo Moechten Sie noch eine Mod injektieren?
Echo ---------------------------------------------------------------------
set /p inpt=(J)a / (N)ein?
if %inpt% == J goto nwbeginning
if %inpt% == N exit

:map
cls 
Echo Sie injektieren nun eine Strecke in Ihre Assetto Corsa - Installation.
Echo ----------------------------------------------------------------------
mklink /J "%mnfldr%\content\tracks\%modname%" "%moddir%"
Echo ---------------------------------------------------------------------
Echo Moechten Sie noch eine Mod injektieren?
Echo ---------------------------------------------------------------------
set /p inpt=(J)a / (N)ein?
if %inpt% == J goto nwbeginning
if %inpt% == N exit


















