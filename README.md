1. It must be ran as an admin. right click the "Run As Admin.bat" and select run as administrator. I did not implement elevation.

2. I'd advise making a backup of your data and a restore point before running anything at this level as best practice.

3. Folder structure matters btw. Moving anything out of the Cleanup or Final folders will break it.

Process: 
SFC > DISMRestoreHealth > SFC Again > ClearTempFiles > FlushDNS > DriveOptimization (Trim/defrag) > DISMComponentCleanup (Update Leftovers) > DriverStoreCleanup > WindowsUpdateReset > Store, Icon & Thumbnail Cache Reset > CheckDiskHealth (chkdsk)
