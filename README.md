# DuollisonFixMod
UE4SS Mod for Clair Obscur: Expedition 33 that makes Foretell consumed while the level 20 passive of the Duollison weapon is active correctly empower End Slice, which is not current behavior.  
The passive reads "*During Twilight, any Foretell consumed is not removed.*" which makes me think the current behavior is a bug since it says Foretell is still being **consumed**, just not removed.

> [!NOTE]
> **There are other quirks this weapon has that are NOT currently addressed by this mod:**
> - Free aim shots give a Sun charge (once per turn), Base Attack gives a Moon charge (once per turn).
> - Successive Base Attacks in the same turn do NOT increase the Foretell consumed count for End Slice. Only first hit does. 
> 
> I can add an option to fix these too if there's demand though.

## Installation  
This mod is based on the [UE4SS Scripting System](https://github.com/UE4SS-RE/RE-UE4SS), as such, you need to install that first.

#### Installing UE4SS  
Step 1: Download UE4SS ([UE4SS_v3.0.1-823-g3e2d111.zip](https://github.com/UE4SS-RE/RE-UE4SS/releases/download/experimental/UE4SS_v3.0.1-823-g3e2d111.zip)).  
Step 2: Locate the directory containing the E33 **actual** executable, aka the install directory. **IMPORTANT:** The executable you're looking for should be called `SandFall-Win64-Shipping.exe`. If you've installed the game from Steam, the directory should be `C:\Program Files (x86)\Steam\steamapps\common\Expedition 33\Sandfall\Binaries\Win64`.  
Step 3: Once you have located the install directory, extract the contents of the zip you downloaded in Step 1 in there. The install directory should now have a new ue4ss folder and a dwmapi.dll file. If you did everything correctly, good! UE4SS is installed.

#### Installing MartenonFixMod  
For clarity purposes, I'll refer to the path to the directory you located in the previous phase as `InstallDirectory`.  
Step 1: Download the [latest release of DuollisonFixMod](https://github.com/Reagent0/DuollisonFixMod/releases/latest/download/DuollisonFixMod.zip).  
Step 2: Open the zip folder you just downloaded and extract its content (a DuollisonFixMod folder) to `InstallDirectory\ue4ss\Mods`.  
Step 3: Open the file `InstallDirectory\ue4ss\Mods\mods.txt` and add in a new line `DuollisonFixMod : 1`. This will tell UE4SS to load the mod.

##### All done. If you did everything correctly and UE4SS is injected, a log file should generate in path `InstallDirectory\ue4ss\UE4SS.log` after launching the game. Look for `[Lua] DuollisonFixMod loaded!` to ensure the mod is loaded.

### For those who come after.
