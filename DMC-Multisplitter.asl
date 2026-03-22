// Credits Mysterion352 DMC1-4 & putting them together, also fixing bugs when switching games + stopping conditions
// Kuno for providing DMC5 & Reboot
// Update 14.03.2026 by Mysterion352 - Updated DMC1 Splits added; Timer is now stopping when finishing a run, up until starting a new run; DMC3 splits adjusted to be when the bullets hit, not when finishing the level
// Update 16.03.2026 by Mysterion352 - Fallback to prevent double splits for finishing dmc1 and dmc2, also no split when starting dmc3 anymore. 

state("dmc1")
{
    byte roomNumber:    "dmc1.exe", 0x279E6B4;               //Room Number, used for doorsplitting
    ushort missionNumber: "dmc1.exe", 0x00488B60, 0x44;      //Mission Number, used to split chapters
    int menu:           0x5eab88, 0x2a10;            	     //When you are in the menu, used to reset the splitter or start the splitter
    int loadingStatus:  0x5eab88, 0x2780;            	     //A status that shows in what position of the game you are in, helps pause the timer
    byte paused:        0x5EAB88, 0x0c;
    bool cutscene:      "dmc1.exe", 0x04CB3848, 0x154;        
    int pause:          0x4CB3034;                   	     //5 different Values to show that the game is paused, can be used to stop the timer upon pausing
    byte loadingScreen: 0x3F533A0;
    byte fragment:	    "dmc1.exe", 0x0060B158, 0x0, 0x7D4;  //Blue Orb Fragment count
    ushort maxHP:       "dmc1.exe", 0x04CB3340, 0x418;       //Max HP of Dante, used to split for full Blue Orbs
    ushort totalSaves:  "dmc1.exe", 0x00488B60, 0x40;        //unused, feel free to implement if you can find a use for it(anti-cheat measurement)
}

state("dmc2")
{
	int finalCutsceneD:     0xF2A648;	        // Cutscene for Dante's the final boss
	int finalCutsceneL:     0x158AF98;	        // Cutscene for Lucia's the final boss
	int level:              0x157D288;	        // The level number
	int newGameStartD:      0xF12C20; 	        // Start of a New Game run for Dante
	int newGameStartL:      0x1588A30;	        // Start of a New Game run for Lucia
	int nowLoading:         0x7DB46C;		    // The Now Loading screens
	int plusStart:          0x1588BB8; 		    // Start of a New Game+ run for Dante and also Reset value
	int shatter:            0x157D2B0;		    // Shatter screens, but actually bonus points
    int roomID:             0x152BB98, 0x78;    // Room ID Values for all characters
}

// HD
state("dmc3")
{
    int bulletScreen:        0xCF2718;                                                   // Bullet screens at the end of missions
    int level:               0xC8F250;                                                   // Level number
    int mainMenu:            0xC9DDC4;                                                   // The main menu screen
    int menuTransitionHD:    0xC0CBB0;                                                   // Main menu transitions
    int NGStart:             0x5CF9F0;                                                   // New Game start after hitting Gold on the menu
    int plusStart:           0x5D95DC;                                                   // New Game+ start on mission select
    int roomID:              0xC8F258;                                                   // Current Room ID
    int isLoading:           0xCEF8E0;                                                   // The game state, 0 normally, 1 when paused/entering new rooms
    int menu:                0xCF2680, 0xD8, 0x110, 0xC0, 0x2F8, 0xD0;                   // When in the main menu
    int ngPlusReset:         0xC90E50, 0xD4;                                             // Used to reset for NG+
    int NGStartGY:           0xD6E000;                                                   // Detects when gold/yellow is selected for NG
    int killCount:           0xC90DF8, 0x110;                                            // In game kill counter
    int frameCount:          0xC90E30, 0xA8;                                             // Used to calculate mission time for ILs
}

// SE
state("dmc3se")
{
    int bulletScreen:        0x205CF14;           // Bullet screens at the end of missions
    int level:               0x381494;            // Level number
    int isLoading:           0x205BCB8;           // The game state, 0 normally, 1 when paused/entering new rooms
    int NGStart:             0x70D2DC;            // New Game start after hitting Gold on the menu
    int plusStart:           0x188EDB4;           // New Game+ start on mission select
    int roomID:              0x2D3A74, 0x16C;     // Current Room ID               
    int resetNGPlus:         0x76EB30;            // Used to reset when in Chapter/difficulty selection
    int resetNG:             0x188EDC8;           // Used to reset for NG
    int killCount:           0x838B0C;            // In game kill counter
    int frameCount:          0x838AFC;            // Used to calculate mission time for ILs
    int NGStartGY:           0x0;
}

state("DevilMayCry4SpecialEdition")
{
    int missionNumber:      0xF59F00, 0x150;                                //Chapter 1-20 All Characters
    int missionTime:        0xF59F00, 0x264;                                //missionTime for each Chapter
    int cutscene:           0xF59F00, 0x1A4;                                //Cutscenes    
    int playerPos:          0xF59F00, 0x24;                                 //Stops the timer at Loading screens
    int LoadingScreen:      0xF59F00, 0x14C;                                //Used to start the timer when entering the Stage in BP
    int m1LRT:              0xF59F00, 0x140;                                //Used to remove loadings of mission 1
    int bloodyPalace:       0xF23F38, 0x3830, 0x90;                         //Bloody palace stage
    int boss:               0xF23F38, 0x3834, 0x50, 0x0;                    //Used to split for Stage 101 in BP and Mission 20
    int doorsplitter:       0xF23F38, 0x3830, 0x88;                         //Current room Im in, shown in numbers
    int menu:               0xF240A4, 0x2B4;                                //menu to stop the timer at menu screen
    int menu4:              0xF23F84, 0x70, 0x1C;                           //Another menu used to stop the timer at menu screen
    int ngPlusReset:        0xEC9A34, 0x4;                                  //Reset for NG+
    int ngStart:            0xF23F80, 0x4;                                  //Starting timer for NG after the savefile was created
    int KillCount:          0xF59F0C, 0x1D4;                                //Counts all kills throughout the game
}


state("DevilMayCry5", "1.08")
{
    byte missionNum   : 0x07A9B7D8, 0x88;
    byte gameState    : 0x07B54F38, 0x8;
    long playerPtr    : 0x07A72B08, 0x18;
    float playerHP    : 0x07A72B08, 0x18, 0x7C;
    long finalBossPtr : 0x07A74330, 0x140, 0x250, 0x28, 0x88;
    float finalBossHP : 0x07A74330, 0x140, 0x250, 0x28, 0x88, 0x10;
}

state("DevilMayCry5", "1.09") // denuvoless
{
    byte missionNum   : 0x07A9B7D8, 0x88;
    byte gameState    : 0x07B54F38, 0x8;
    long playerPtr    : 0x07A6FAA8, 0x140, 0x1F8, 0x218, 0x40, 0x20; //E 5490
    float playerHP    : 0x07A6FAA8, 0x140, 0x1F8, 0x218, 0x40, 0x20, 0x18; //10 a9 ? ? ? ? 00 c0 7d
    long finalBossPtr : 0x07A74330, 0x140, 0x250, 0x28, 0x88;
    float finalBossHP : 0x07A74330, 0x140, 0x250, 0x28, 0x88, 0x10; //69 c4 ? ? ? ? 3e 30 2f
}

state("DevilMayCry5", "1.10")
{
    byte missionNum   : 0x07E661B0, 0x80;
    byte gameState    : 0x07F482D8, 0x8;
    long playerPtr    : 0x07E6A878, 0x140, 0x1F8, 0x218, 0x40, 0x20;
    float playerHP    : 0x07E6A878, 0x140, 0x1F8, 0x218, 0x40, 0x20, 0x18;
    long finalBossPtr : 0x07E60168, 0x148, 0x250, 0x28, 0x88;
    float finalBossHP : 0x07E60168, 0x148, 0x250, 0x28, 0x88, 0x10;
}

state("DMC-DevilMayCry", "1.0")
{
	int loading : "DMC-DevilMayCry.exe", 0x273F0F8, 0x5B4;
    string20 Checkpoint : 0x111; // I was told not to worry about V1.0 as nobody runs on it, but I have to add this in the code or it won't init 
}

state("DMC-DevilMayCry", "Current")
{
	int loading : "DMC-DevilMayCry.exe", 0x2759300, 0x5B4;
    string20 Checkpoint : 0x02733378, 0x560, 0x0;
}

startup{
    settings.Add("NoSF", false, "No Save File for DMC1");
    settings.Add("2D", false, "DMC2 Dante");
    settings.Add("2L", false, "DMC2 Lucia");
    settings.Add("DMCReboot");
    settings.CurrentDefaultParent = "DMCReboot";
    settings.Add("DMC", true, "Devil May Cry");
    settings.Add("Ver", true, "Vergil's Downfall");
    var tB = (Func<string, string, string, Tuple<string, string, string>>) ((elmt1, elmt2, elmt3) => { return Tuple.Create(elmt1, elmt2, elmt3); });
    var sB = new List<Tuple<string, string, string>> 
    {
        tB("DMC", "ch1_main", "Found"),
        tB("DMC", "ch2_main", "Home Truths"),
        tB("DMC", "ch4_main", "Bloodline"), 
        tB("DMC", "ch5_main", "Under Watch"),
        tB("DMC", "ch6_main", "Virility"),
        tB("DMC", "ch7_main", "Secret Ingredient"),
        tB("DMC", "ch8_main", "Overturn"),
        tB("DMC", "ch9A_main", "Eyeless"),
        tB("DMC", "ch9B_main", "Devil Inside"),
        tB("DMC", "ch10_main", "Bad News"),
        tB("DMC", "ch11_main", "The Order"),
        tB("DMC", "ch12_main", "Under Siege"),
        tB("DMC", "ch13_main", "Devil's Dalliance"),
        tB("DMC", "ch14_main", "Last Dance"),
        tB("DMC", "ch15_main", "The Trade"),
        tB("DMC", "ch16_main", "The Plan"),
        tB("DMC", "ch17_main", "Furnace of Souls"),
        tB("DMC", "ch18_main", "Demon's Den"),
        tB("DMC", "ch19_main", "Face of The Demon"),
        tB("DMC", "ch20_main", "The End"),
        tB("Ver", "DLC1_ch1_main", "Personal Hell"),
        tB("Ver", "DLC1_ch2_main", "Hollow"),
        tB("Ver", "DLC1_ch3_main", "Power Struggle"),
        tB("Ver", "DLC1_ch4_main", "Heartless"),
        tB("Ver", "DLC1_ch5_main", "Own Shadow"),
        tB("Ver", "DLC1_ch6_main", "Another Chance"),
    };
    foreach (var s in sB) settings.Add(s.Item2, true, s.Item3, s.Item1);
}

init
{
    vars.killCount = 0;
    vars.DMC1Split = 0;
    vars.DMC2DSplit = 0;
    vars.DMC2LSplit = 0;
    vars.bulletSplit = 0;
    vars.doneMaps = new List<string>();
    vars.DMC1Start = false;
    vars.DMC2Start = false;
    vars.DMC3Start = false;
    vars.DMC4Start = false;
    vars.DMC5Start = false;
    vars.DMCDMCStart = false;
    vars.isLoading = false;
    vars.gameWasPaused = false;
    vars.playerLoadedCurrent = false;
    vars.playerLoadedOld = false;
    vars.DMC1Finish = false;
    vars.DMC2Finish = false;
    vars.DMC3Finish = false;
    vars.DMC4Finish = false;
    vars.DMC5Finish = false;

    switch(modules.First().ModuleMemorySize){
        //Reboot
        case 47788032:
			version = "1.0";
			break;
        case 47902720:
            version = "Current";
            break;
		default:
            break;
        //DMC5
        case 501411840:
            version = "1.08";
            break;
        case 135524352:
            version = "1.09";
            break;
        case 140038144:
            version = "1.10";
            break;
    }
}

update
{
    if(timer.CurrentPhase == TimerPhase.NotRunning){
        vars.killCount = 0;
        vars.DMC1Split = 0;
        vars.DMC2DSplit = 0;
        vars.DMC2LSplit = 0;
        vars.doneMaps.Clear();
        vars.DMC1Start = false;
        vars.DMC2Start = false;
        vars.DMC3Start = false;
        vars.DMC4Start = false;
        vars.DMC5Start = false;
        vars.DMCDMCStart = false;
        vars.DMC1Finish = false;
        vars.DMC2Finish = false;
        vars.DMC3Finish = false;
        vars.DMC4Finish = false;
        vars.DMC5Finish = false;
        vars.bulletSplit = 0;

        vars.isLoading = false;
        vars.gameWasPaused = false;
        vars.playerLoadedCurrent = false;
        vars.playerLoadedOld = false;
    }

    switch (game.ProcessName)
    {
        case "dmc2":
        {
            if(current.newGameStartD == 32 && old.newGameStartD != 32 || current.newGameStartL == 335675395 && old.newGameStartL == 184680451){
                vars.DMC2Start = true;
	        }
            break;
        }
        case "dmc3": case "dmc3se":
        {
            if(current.NGStart == 44100 && old.NGStart == 22050 && current.level == 1 || current.plusStart == 344 && old.plusStart == 272 && current.mainMenu == 0 && current.menuTransition != 37476 && current.level == 1
            || current.NGStart == 7 && old.NGStart == 0 && current.level == 1 || current.plusStart == 1 && old.plusStart == 0){
                vars.DMC3Start = true;
            }
            break;
        }
        case "DevilMayCry4SpecialEdition":
        {
            if((current.ngPlusReset == 352 && current.ngStart == 0 && old.ngStart > 0 && current.missionNumber == 1)
            || 
            (current.ngPlusReset != 592 && old.ngPlusReset == 592 && current.ngPlusReset != 352)){
                vars.DMC4Start = true;
            }
            break;
        }
        case "DevilMayCry5":
        {
            if ((current.missionNum == 0 || current.missionNum == 1) && vars.playerLoadedCurrent != vars.playerLoadedOld && vars.playerLoadedCurrent)
            {
                vars.DMC5Start = true;
            }
            vars.playerLoadedOld = vars.playerLoadedCurrent;
            vars.playerLoadedCurrent = current.playerPtr > 0 && current.playerHP != -1000;

            if (current.gameState != old.gameState)
            {
                vars.gameWasPaused = old.gameState == 9;
                vars.isLoading = current.gameState == 0 && (!vars.gameWasPaused || !vars.playerLoadedCurrent);
            }

            if (vars.playerLoadedCurrent != vars.playerLoadedOld)
            {
                // ignore M06 as player data is loaded early
                if (vars.playerLoadedCurrent && current.missionNum != 6)
                {
                    vars.isLoading = false;
                }
                else if (current.gameState == 0 && vars.gameWasPaused)
                {
                    // real loading after pausing (checkpoint/retry/quit mission)
                    vars.isLoading = true;
                }
            }
            break;
        }
        case "DMC-DevilMayCry":
        {
            if(current.loading != 0 && vars.DMCDMCStart == false && settings[current.Checkpoint]){
                vars.doneMaps.Add(current.Checkpoint);
                vars.DMCDMCStart = true;
            }
            break;
        }
    }
}


start
{  //Start the timer upon choosing the difficulty and reset split + chapter back to 0
    if(game.ProcessName == "dmc1"){
        if(current.menu != 266 && old.menu == 266){
            return true;
        }
        //Starts the timer if you play without a savefile
        if(current.menu != 517 && old.menu == 517 && settings["NoSF"]){
            return true;
        }
    }
}

split
{
    switch(game.ProcessName){
        case "dmc1":
        {
            if(current.missionNumber < old.missionNumber
            || (current.missionNumber == 1 && old.missionNumber == 0))          //pre-M1/reset/Intermission catch
            {
                return false;
            }
            else if(current.missionNumber != old.missionNumber)
            {
                return true;
            }
    
            //M23 final split
            if(vars.DMC1Finish == false && current.roomNumber == 14 && current.missionNumber == 23 && (current.cutscene == false && old.cutscene == true))
            {
                vars.DMC1Finish = true;
                return true;
            }
            break;
        }
        case "dmc2":
        {
            if(current.shatter != 0 && old.shatter == 0 && vars.DMC2DSplit <= 16 && settings["2D"]){
                vars.DMC2DSplit++;
                return true;
            }

            if( current.finalCutsceneD != 0 && old.finalCutsceneD == 0 && current.level == 4609 && vars.DMC2Finish == false){
                vars.DMC2DSplit++;
                vars.DMC2Finish = true;
                return true;
            }

            if(current.shatter != 0 && old.shatter == 0 && vars.DMC2LSplit <= 12 && settings["2L"]){
                vars.DMC2LSplit++;
                return true;
            }

            if(current.finalCutsceneL != 0 && old.finalCutsceneL == 0 && current.level == 3329 && vars.DMC2Finish == false){
                vars.DMC2LSplit++;
                vars.DMC2Finish = true;
                return true;
            }
            break;
        }
        case "dmc3se": case "dmc3":
        {
            if(current.bulletScreen != 0 && old.bulletScreen == 0 && vars.DMC3Start == true){
                vars.bulletSplit = 1;
                return true;
            }
            
            // Split if the level increases
            if(current.level > old.level && vars.bulletSplit == 0 && vars.DMC3Start == true)
                return true;

            if(current.roomID == 411 && current.level == 20 && current.killCount == 1 && old.killCount == 0 && vars.DMC3Start == true && vars.DMC3Finish == false){
                vars.DMC3Finish = true;
                return true;
            }
            break;
        }
        case "DevilMayCry4SpecialEdition":
        {
            // Chapter Split
            if(current.missionNumber > old.missionNumber &&  current.missionNumber != 0 && current.missionNumber != 1){
                return true;
            }
            // Final Boss Split
            if((current.boss == 33620487 && old.boss != 33620487 || current.boss == 265223 && old.boss != 265223) && current.missionNumber == 20){
                vars.DMC4Finish = true;
                return true;
            }
            break;
        }
        case "DevilMayCry5":
        {
            if (current.missionNum == 20 && current.finalBossPtr > 0 && old.finalBossHP > 0)
            {
                vars.DMC5Finish = true;
                return current.finalBossHP == 0;
            }

            if (current.missionNum != old.missionNum)
            {
                return current.missionNum == old.missionNum + 1;
            }
            break;
        }
        case "DMC-DevilMayCry":
        {
            if (settings[current.Checkpoint] && (current.loading != 0) && (!vars.doneMaps.Contains(current.Checkpoint)))
            {
                vars.doneMaps.Add(current.Checkpoint);
                return true;
            }
            break;
        }
    }
}

isLoading
{
    switch(game.ProcessName)
    {
        case "dmc1":
        {
            return current.pause == 1 || current.pause == 257 || current.pause == 513 || current.pause == 769 || current.pause == 1025 || current.loadingStatus == 1 && current.paused != 1 || current.loadingScreen == 16 && current.paused == 0 || vars.DMC1Finish == true;
        }
        case "dmc2":
        {
            return vars.DMC2Start == false || vars.DMC2Finish == true;
        }
        case "dmc3": case "dmc3se":
        {
            return current.isLoading == 1 || vars.DMC3Start == false || vars.DMC3Finish == true;
        }
        case "DevilMayCry4SpecialEdition":
        {
            return (current.playerPos == 00000000 || current.cutscene > 0 ) && current.ngPlusReset != 928 && current.missionNumber != 1 && current.ngPlusReset != 592 || current.cutscene > 0 && current.ngPlusReset != 592
            || 
            (current.menu4 > 0 && current.menu == 0 && current.missionTime == old.missionTime && current.missionNumber != 1 && current.ngPlusReset != 592)
            || 
            (current.m1LRT == 0 && current.missionNumber == 1 && current.missionTime == old.missionTime && current.ngPlusReset != 928 && current.ngPlusReset != 592) || vars.DMC4Start == false || vars.DMC4Finish == true;
            
        }
        case "DevilMayCry5":
        {
            return vars.isLoading || vars.DMC5Start == false || vars.DMC5Finish == true;
        }
        case "DMC-DevilMayCry":
        {
            return current.loading != 0 || vars.DMCDMCStart == false;
        }
    }
}

exit
{
	timer.IsGameTimePaused = true;
}

