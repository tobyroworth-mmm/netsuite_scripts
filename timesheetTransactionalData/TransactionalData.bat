@ECHO OFF
@REM Save current working directory
set CWD=%CD%

@REM Set chrome path and profile
set CHROME_PATH="C:\Program Files\Google\Chrome\Application\chrome.exe"
set CHROME_PROFILE="Default"

@REM Netsuite Saved Search ID:
@REM   - 4149 for TimesheetTransactionalDataBusinessOperationfromTimeResults (recommended)
@REM   - 2279 for TimesheetTransactionalData
set SEARCH_ID=4149

@REM Proper Business etc
%CHROME_PATH% --profile-directory=%CHROME_PROFILE% "https://3784219.app.netsuite.com/app/common/search/searchresults.csv?searchid=%SEARCH_ID%&frame=be&csv=Export"

@REM Wait for download to complete (120 seconds)
timeout /T 120 /NOBREAK

cd %USERPROFILE%"\Downloads"
FOR /F "delims=" %%I IN ('DIR "TimesheetTransactionalData*.*" /A-D /B /O:D') DO SET "NewestFile=%%I"

move /y %NewestFile% %USERPROFILE%"\Merlin Entertainments Group\LEGO Production Planning and Analysis - Data\TransactionalData.csv"

cd %CWD%