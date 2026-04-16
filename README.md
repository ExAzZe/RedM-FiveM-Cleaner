# FiveM & RedM Cache Cleaner

Hey there! Welcome to the FiveM & RedM Cache Cleaner. 

If you play on roleplay servers, you already know the struggle: missing textures, invisible roads, weird UI glitches, or random crashes. 99% of the time, the solution is simple: **clear your cache**. 

I built this interactive batch script to make this process as fast and painless as possible. No more digging through hidden `AppData` folders!

## Features

* **Smart Path Memory:** Did you install your game on your `D:` or `E:` drive? No problem. The script lets you set a custom path and saves it in a tiny `settings.ini` file. You only have to tell it once!
* **Quick Clean:** Fixes minor bugs in 2 seconds without forcing you to redownload everything.
* **Deep Clean:** The ultimate nuke option for major crashes or when you want to free up dozens of Gigabytes of dead server data.

---

## How to use it

1. Download the `FiveM_RedM_Cleaner.bat` file.
2. Double-click it to run.
3. Use your keyboard to select an option (1, 2, 3, or 4) and press **Enter**.
4. *(Optional)* If the script can't find your game, select `1` to paste your custom game path.

---

## What does it actually do?

To keep your game safe, the script offers two distinct modes:

### Option 2: Quick Clean (The Daily Fix)
* **What it cleans:** Only the standard `data\cache` folder.
* **When to use it:** When your game is running fine but you have small visual glitches (like clothes not loading properly or broken minimaps). 
* **Impact:** Instant. You won't have to redownload massive files when rejoining your favorite server.

### Option 3: Deep Clean (The Nuke)
* **What it cleans:** Absolutely everything. 
  * The `cache`, `server-cache`, and `server-cache-priv` (where all the custom cars, clothes, and mappings from servers are stored).
  * `nui-storage` (Fixes broken phone screens, banking menus, or stuck loading screens).
  * Game `logs` and Windows `CrashDumps` (Frees up a lot of dead space).
  * DirectX Shader Cache & Rockstar Social Club Cache (Fixes deep graphical and login loops).
  * `game-storage` (Deletes old game builds).
* **When to use it:** When your game crashes on launch, when you get "fatal errors", or when you want to clean up your hard drive after visiting 20 different servers.
* **⚠️ WARNING:** Because this wipes server assets and game builds, **your next connection to a server will take longer** as it will need to freshly redownload the necessary files. 

---
*Note: This script only uses native Windows commands and does not touch your base GTA V or Red Dead Redemption 2 installation files. It is completely safe to use.*
