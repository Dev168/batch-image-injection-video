@echo off
echo -------------------------
echo Welcome 
echo Program Logo Injection
echo By Dev168
echo https://github.com/Dev168
echo -------------------------

pause

cls
:start
set /p inputfolder="Please enter your input folder name and put your video to folder (input0x): "
mkdir %inputfolder%

set /p outputfolder="Please put your output folder name (output0x): "
mkdir %outputfolder%

set /p logo="Please put your logo name (logo.png): "

echo Please select position of logo?
echo 1 - [1]
echo 2 - [2]
echo 1 - [3]
echo 2 - [4]

echo -------------------------
echo ^| [1]               [2] ^|
echo ^|                       ^| 
echo ^|                       ^|
echo ^|                       ^|
echo ^| [3]               [4] ^|
echo -------------------------


set /p position="Please select position of logo: "

if %position%==1 (.
    for %%a in ("%inputfolder%\*.mp4") do ffmpeg -i "%%a" -vf "movie=%logo%[logo];[in][logo]overlay=10:10 [out]" -vcodec libx264 "%outputfolder%\%%~na.mp4"	
) else if %position%==2 (
    for %%a in ("%inputfolder%\*.mp4") do ffmpeg -i "%%a" -vf "movie=%logo%[logo];[in][logo]overlay=main_w-overlay_w-10:10 [out]" -vcodec libx264 "%outputfolder%\%%~na.mp4"
) else if %position%==3 (
    for %%a in ("%inputfolder%\*.mp4") do ffmpeg -i "%%a" -vf "movie=%logo%[logo];[in][logo]overlay=10:main_h-overlay_h-10 [out]" -vcodec libx264 "%outputfolder%\%%~na.mp4"
) else if %position%==4 (
    for %%a in ("%inputfolder%\*.mp4") do ffmpeg -i "%%a" -vf "movie=%logo%[logo];[in][logo]overlay=main_w-overlay_w-10:main_h-overlay_h-10[out]" -vcodec libx264 "%outputfolder%\%%~na.mp4"
) else (
    echo invalid choice
)

set choice=
set /p choice="Press 'y' and enter for goto start or Press any key to exit: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto start

