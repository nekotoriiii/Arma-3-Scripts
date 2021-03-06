# All these scripts work with this folder structure

- **A3Master** - Main Server Files of Arma 3
- **_A3Files** - server.cfg, basic.cfg, keys, _linkMods, _lowercaseModsInDir, _deleteDupeDirectories
- **_mods** - 
  - **mods** - The folder in which _linkMods will get mods from
  - **mods_caseinsensitive** - The folder in which the program will update mods from (I use rclone to update mods, and ciopfs [Case Insensitive Operating File System])

Root Folder Structure

![](https://i.imgur.com/3dxZ2PU.png)

\_A3Files Folder Structure

![](https://i.imgur.com/XyXDbKD.png)

\_mods Folder Structure

![](https://i.imgur.com/fm7iwYf.png)


# What the scripts will do
- _UpdateArma3 - Update Arma 3 (A3Master) with SteamCMD (SteamCMD files can be in the same folder)
- _UpdateServer.txt - Called by _UpdateArma3
- Export IDs.py - Export Steam Workshop IDs of Preset File generated by Arma 3 Launcher **REQUIRES PYTHON 3.X**
- _makeNewServer - Makes new server making Symbolic Link of files in A3Master and makes a keys, mpmissions folder. Also copies files from _A3Files and places it at root server folder, takes 1 argument which is the folder name of the server
  - Usage: _makeNewServer folderName

- **_A3Files**
  - _StartA3 - Start Arma 3 server with parameters
  - _deleteDupeDirectories - Symbolic Linking sometimes links itself in the folder, which can cause issues, this hopes to resolve that
  - _linkMods - Link mods with IDs listed in mods_regular.txt and mods.txt
