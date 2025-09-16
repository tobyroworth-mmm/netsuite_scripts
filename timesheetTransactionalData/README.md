# TransactionalData.bat Documentation

## Purpose
`TransactionalData.bat` automates the download and relocation of a NetSuite Saved Search CSV export for timesheet transactional data. It uses Google Chrome to access a specific NetSuite search, waits for the download, and moves the resulting file to a designated folder for further use.

## How It Works
1. **Sets up environment variables:**
  - Saves the current working directory.
  - Sets the path to Chrome and the Chrome profile to use.
  - Sets the NetSuite Saved Search ID (default: 4149).
2. **Launches Chrome:**
  - Opens the NetSuite Saved Search export URL in Chrome using the specified profile and search ID.
3. **Waits for download:**
  - Waits 120 seconds to allow the CSV file to download.
4. **Finds the newest downloaded file:**
  - Changes directory to the user's Downloads folder.
  - Finds the most recently downloaded file matching `TimesheetTransactionalData*.*`.
5. **Moves the file:**
  - Moves the newest file to the `Merlin Entertainments Group\LEGO Production Planning and Analysis - Data` folder as `TransactionalData.csv`.
6. **Restores the original working directory.**

## Setup
1. Ensure Google Chrome is installed at `C:\Program Files\Google\Chrome\Application\chrome.exe`, or update `CHROME_PATH` variable accordingly.
2. If you use multiple Chrome profiles set `CHROME_PROFILE` to the profile you use for NetSuite. See below for assistance in finding the profile name.
3. Sync the https://attractions.sharepoint.com/sites/LEGOProductionPlanningandAnalysis/Data library using OneDrive
4. Log in to NetSuite and switch role to one with access to the selected saved search, such as "Time Edit".
5. Update the `SEARCH_ID` variable in the script if you need a different NetSuite Saved Search.

## Usage
1. Double-click `TransactionalData.bat` or run it from the command prompt.
2. After completion, the latest transactional data will be available at:
  - `%USERPROFILE%\Merlin Entertainments Group\LEGO Production Planning and Analysis - Data\TransactionalData.csv`
  - which syncs to
  - https://attractions.sharepoint.com/sites/LEGOProductionPlanningandAnalysis/Data/TransactionalData.csv

## Running Regularly
It's suggested to add a scheduled task using "Task Scheduler". An [XML file](./TransactionalData.xml)! is provided that can be imported into Task Scheduler.

_Note that the Task assumes that `TransactionalData.bat` has been placed in the user's profile directory `%USERPROFILE%`._

## Notes
- The script assumes the NetSuite export filename starts with `TimesheetTransactionalData`.
- Adjust the timeout if your download speed is significantly different. Two minutes has generally been enough.
- You may need to update folder paths if your environment differs.

## Find Chrome Profile Name
1. Open Chrome and ensure the profile you want to find is the currently active one. 
2. Type `chrome://version` into the address bar and press Enter. 
3. Locate the line that says "Profile Path" on the page. 
4. The last part of this path: (e.g., Default, Profile 1, Profile 2) is the name of your profile folder. 