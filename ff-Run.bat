@echo off
cd /d "%~dp0"

echo [93m*   ff-Run.bat[0m v1.00 2024-09-05 Roman Ermakov r.ermakov@emg.fm
echo Script for batch running ff-WebLogger clients.
echo.
:: ******************************************************

set url=https://hls-01-eldoradio.emgsound.ru/4/playlist.m3u8
set station="Eldoradio"
:: use quotes if station name have spaces
set filetype=aac
set storage="D:\STORAGE"
call:callRecorder

set url=https://emgspb.hostingradio.ru/eldoradio128.mp3
set station="Eldoradio"
:: use quotes if station name have spaces
set filetype=mp3
set storage="D:\STORAGE"
call:callRecorder

set url=https://pub0202.101.ru:8000/stream/air/aac/64/100
set station="Autoradio Moscow"
:: use quotes if station name have spaces
set filetype=aac
set storage="D:\STORAGE"
call:callRecorder

set url=https://montecarlo.hostingradio.ru/montecarlo96.aac
set station="Monte Carlo"
set filetype=aac
set storage="D:\STORAGE"
call:callRecorder

set url=https://nashe1.hostingradio.ru:80/jazz-128.mp3
set station="Radio JAZZ"
set filetype=mp3
set storage="D:\STORAGE"
call:callRecorder

::
:: copy and paste here the lines above if you need to start
:: multiple loggers simultaneously.
::
:: ******************************************************


:callRecorder
echo %url% %station% %storage% %filetype%
start "%station:"=% Watchdog" ff-WebLogger.bat %url% %station% %storage% %filetype%
exit /b