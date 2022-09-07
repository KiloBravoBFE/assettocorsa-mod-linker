@echo off
Echo MK-Linker fuer:
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
Echo   |||||             |||||ssetto   |||||||||||||||||||orsa
Echo
Echo
Echo ----------------------------------------------------------------------------------
Echo Das hier ist ein kleines Programm zum erstellen von Hard-Links in Windows.
Echo Mit Hard-Links koennen zum Beispiel Assetto Corsa Mods in einem anderen Directory
Echo installiert werden. Dieses Programm vereinfacht diesen Vorgang *NUR* fuer AC.
Echo ----------------------------------------------------------------------------------
pause

:askfordir
cls 
Echo Befindet sich dein Assettocorsa Parent Folder im Standardverzeichnis,
Echo d.h. C:\Program Files\Steam?
Echo --------------------------------------------------------------------
set /p inptDirTF=(J)a / (N)ein?
if %inptDirTF% == J goto stndrdDIR
if %inptDirTF% == N goto setmanual
cls
Echo Fehler - gib einen gueltigen Buchstaben ein: "J" oder "N".
pause
goto askfordir

:stndrdDIR
set mnfldr=C:\Program Files (x86)\Steam\steamapps\common\assettocorsa
goto amin

:setmanual
cls
Echo Bitte setze dann hier deinen Asetto Corsa Parent Folder.
Echo ----------------------------------------------------------
set /p mnfldr=Parent Folder Directory:

:amin
cls 
Echo Bist du Amin (faster 'then' you) ?
set /p aminvar=(J)a / (N)ein?
if %aminvar% == N goto nwbeginning
:aminconfirm
cls
Echo Hallo, Amin! Sagst du mir wie der Ordner deiner Mod heisst?
Echo ------------------------------------------------------------
set /p aminmodvar=Modordner:
set moddir=E:\assetti mods\%aminmodvar%
goto inject

:nwbeginning
cls
Echo Bitte setze nun den gewuenschten Mod-Ordner.
Echo NNimm dazu die gewuenschte Mod SELBST als DIR, nicht den Main-Mod-Ordner.
Echo Tust du dies nicht, wird die Mod *nicht in Assetto Corsa erscheinen*.
Echo --------------------------------------------------------------------------------
set /p moddir=Mod-Ordner Directory:

:inject
cls
Echo Wie soll die Mod im Ordner genannt werden?
Echo -------------------------------------------
set /p modname=Namen eingeben:

cls
Echo moechtest du eine Strecke oder ein Auto installieren?
Echo ----------------------------------------------------
set /p lnkmode=Gib CAR oder MAP ein.
if %lnkmode% == CAR goto car
if %lnkmode% == MAP goto map
pause
exit

:car
cls
Echo Du linkst nun ein Fahrzeug in deine Assetto Corsa - Installation.
Echo ----------------------------------------------------------------------
pause
mklink /J "%mnfldr%\content\cars\%modname%" "%moddir%"
Echo ---------------------------------------------------------------------
Echo Moechtest du noch eine Mod linken?
Echo ---------------------------------------------------------------------
set /p inpt=(J)a / (N)ein?
if %inpt% == J goto nwbeginning
if %inpt% == N exit

:map
cls 
Echo Du linkst nun eine Strecke in deine Assetto Corsa - Installation.
Echo ----------------------------------------------------------------------
mklink /J "%mnfldr%\content\tracks\%modname%" "%moddir%"
Echo ---------------------------------------------------------------------
Echo Moechtest du noch eine Mod linken?
Echo ---------------------------------------------------------------------
if %aminvar% == J goto jumperweilbindumm
set /p inpt=(J)a / (N)ein?
if %inpt% == J goto nwbeginning
if %inpt% == N exit
pause
exit

:jumperweilbindumm
set /p inpt=(J)a / (N)ein?
if %inpt% == J goto aminconfirm
if %inpt% == N exit
pause

exit