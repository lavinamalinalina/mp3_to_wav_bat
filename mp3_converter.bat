set "sourcef=F:\bat scripts\mustest"
set "dest=F:\bat scripts\wawtest"
set "archive=F:\bat scripts\archive"

mkdir "%sourcef%"
mkdir "%dest%"
cd /d "%sourcef%"
del /q "%dest%\*"
for %%F in (*.mp3) do (
    ffmpeg -i "%%F" "%%~nF.wav" && move /y "%%~nF.wav" "%dest%"
)
echo %ERRORLEVEL%
cd /d "%dest%"
for %%F in (*.mp3.wav) do (
    ren "%%F" "%%~nF.wav"
)
echo %ERRORLEVEL%
powershell -Command "Compress-Archive -Path '%dest%\*' -DestinationPath '%archive%\wav_archive.zip'"
