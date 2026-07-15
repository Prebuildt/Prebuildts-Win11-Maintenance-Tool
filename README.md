1. It must be ran as an admin. Right click the "Run As Admin.bat" and select run as administrator. Elevation is NOT implemented.

2. Making a backup of your data and a restore point before running anything at this level is best practice.

3. Folder structure matters. Moving anything out of the Cleanup or Final folders will break it.

4. Some features around the windows store cleanup (wsreset.exe) may not work on windows 10, but everything else is compatible.

5. chkdsk will run as a scan only and should schedule a repair automatically if errors are found. If it doesn't please let me know.

Process: 
SFC > DISM (Restore Health) > SFC Again > Clear Temp Files > Flush DNS > Drive Optimization (Trim/defrag) > DISM Component Cleanup (Update Leftovers) > Driver Store Cleanup > Windows Update Reset > Store, Icon & Thumbnail Cache Reset > Check Disk Health (chkdsk)
