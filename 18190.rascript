// Where is my Heart?
// #ID = 18190

// $9E6538 - [32-bit] Orange Rotating World
// 0x00000000 = Not Rotating
// 0x00000001 = Rotating
function OrangePowerupRotating() => dword( 0x009e6538 )

// $A43A40 - [32-bit] Key Pressed
function KeyPressed() => dword( 0x00a43a40 )

// $B16038 - [32-bit] Game Pointer
//
// Notes: Anything other than 0x00000000 is an address to the currently playing chapters data
//
// ```text
// 0x00000000 = In Main Menu
// (use & value 0x01ffffff)
// +0x88
// .+0x0
// ..+0x14
// ...+0x08 = Current Chapter Score
// ...+0x0c = Hearts Collected
// ...+0x10 = Dark Hearts Collected
// ...+0x14 = Hearts Available
// +0x244 = Current Character 0x00000000 = Brown, 0x00000001 = Orange, 0x00000002 = Black
// +0x284 = Current Chapter Timer
// ```
function GamePointer() => dword( 0x00b16038 )

function GamePointer2() => dword( ( GamePointer() & 0x01ffffff ) + 0x88 )

// The character currently being used in game 0x00000000 = Brown, 0x00000001 = Orange, 0x00000002 = Black
function Character() => dword( ( GamePointer() & 0x01ffffff ) + 0x244 )

// The Current Chapter Timer
function CurrentChapterTimer() => dword( ( GamePointer() & 0x01ffffff ) + 0x284 )

function GamePointer3() => dword( GamePointer2() & 0x01ffffff )

function GamePointer4() => dword( ( GamePointer3() & 0x01ffffff ) + 0x14 )

function CurrentChapterScore() => dword( ( GamePointer4() & 0x01ffffff ) + 0x08 )

function HeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0x0c )

function DarkHeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0x10 )

// This can be inaccurate, I think this was ported and the available hearts may have been miscounted on a few levels
function AvailableHearts() => dword( ( GamePointer4() & 0x01ffffff ) + 0x14 )

// $B16044 - [32-bit] Game State
// 0x00000000 = Playing Chapter
// 0x00000001 = In Start Menu
function GameState() => dword( 0x00b16044 )

function Chapter() => dword( 0x00b160d4 )

// I think its 60 frames * 10 for miliseconds
function ChapterTimer() => dword( 0x00b160e4 )

// $E679C8 - [32-bit] Brown State
// 0x00000000 = Idle
// 0x00000001 = Left or Right
// 0x00000002 = Jumping
// 0x00000003 = Falling
// 0x00000004 = End Jump
// 0x00000006 = Entering End Chapter Tree
// 0x00000007 = Inside End Chapter Tree
// 0x00000008 = Powered Up (if entering End Tree powereed up it stays this value)
function BrownState() => dword( 0x00e679c8 )

function BrownPoweredUpState() => dword( 0x00b17f18 )

// $E67EC8 - [32-bit] Orange State
// 0x00000000 = Idle
// 0x00000001 = Left or Right
// 0x00000002 = Jumping
// 0x00000003 = Falling
// 0x00000004 = End Jump
// 0x00000006 = Entering End Chapter Tree
// 0x00000007 = Inside End Chapter Tree
// 0x00000008 = Powered Up (if entering End Tree powereed up it stays this value)
function OrangeState() => dword( 0x00e67ec8 )

function OrangePoweredUpState() => dword( 0x00e7b9c8 )

// $B1F0F8 - [32-bit] Black State
// 0x00000000 = Idle
// 0x00000001 = Left or Right
// 0x00000002 = Jumping
// 0x00000003 = Falling
// 0x00000004 = End Jump
// 0x00000006 = Entering End Chapter Tree
// 0x00000007 = Inside End Chapter Tree
// 0x00000008 = Powered Up (if entering End Tree powered up it stays this value)
function BlackState() => dword( 0x00b1f0f8 )

function BlackPoweredUpState() => dword( 0x00b23d78 )

// 0x00 = not double Jumping
// 0x01 = double jumping
function BrownDoubleJump() => byte( 0x00b17f71 )

function AnimationCounter() => dword( 0x009e7130 )

function LeftBumperButton() => bit0( 0x00a43a41 )
function RightBumperButton() => bit1( 0x00a43a41 )

CHAPTER25 = 0x00000018
END = 0x00000063

chapterConfigs = [
    {
        "id":               0x0000001b,
        "name":             "Chapter 1",
        "description":      "The Heart Tree",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "hasLeaderboard":   true,
        "challengeName":    "Totem Spirit",
        "challengeDesc":    "Complete chapter 1 in no more than 15 jumps",
        "limitJumps":       15,
        "type":             "progression"
    },
    {
        "id":               0x00000000,
        "name":             "Chapter 2",
        "description":      "We're On Our Way",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "timeTrialSeconds": 15,
        "hasLeaderboard":   true,
        "challengeName":    "Gotta Go Fast",
        "challengeDesc":    "Complete chapter 2 in under 15 seconds",
        "type":             "progression"
    },
    {
        "id":               0x00000003,
        "name":             "Chapter 3",
        "description":      "Wilderness",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "hasLeaderboard":   true,
        "challengeName":    "Mind The Gap",
        "challengeDesc":    "With both orange and black inside the end tree, use brown to collect one heart then complete chapter 3",
        "characterCollect": {
            "character": "brown",
            "hearts":    1
        },
        "type":             "progression"
    },
    {
        "id":               0x00000004,
        "name":             "Chapter 4",
        "description":      "A Little Cave",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Rock Tunnel",
        "challengeDesc":    "Collect 3 hearts in no more than 14 jumps then complete chapter 4",
        "heartsCollected":  true,
        "limitJumps":       14,
        "type":             "progression"
    },
    {
        "id":               0x00000005,
        "name":             "Chapter 5",
        "description":      "Antler Ancestor",
        "hearts":           3,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Gallup Jingle",
        "challengeDesc":    "Collect 3 hearts in no more than 6 double jumps then complete chapter 5",
        "heartsCollected":  true,
        "limitDoubleJumps": 6,
        "type":             "progression"
    },
    {
        "id":               0x00000008,
        "name":             "Chapter 6",
        "description":      "Rainbow Spirit",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "A Slight Breeze",
        "challengeDesc":    "Collect 2 hearts in no more than 1 world rotation then complete chapter 6",
        "heartsCollected":  true,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x0000000a,
        "name":             "Chapter 7",
        "description":      "Wall in the Meadow",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Great Wall",
        "challengeDesc":    "With both orange and brown inside the end tree, use black to collect one heart then complete chapter 7",
        "characterCollect": {
            "character": "black",
            "hearts":    1
        },
        "type":             "progression"
    },
    {
        "id":               0x00000016,
        "name":             "Chapter 8",
        "description":      "Bridge",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Rainbow Bridge",
        "challengeDesc":    "Without dying collect 4 hearts in no more than 1 world rotation then complete chapter 8",
        "deathless":        true,
        "heartsCollected":  true,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x00000006,
        "name":             "Chapter 9",
        "description":      "Islands",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Island Hopping",
        "challengeDesc":    "Collect 5 hearts in no more than 4 double jumps then complete chapter 9",
        "heartsCollected":  true,
        "limitDoubleJumps": 4,
        "type":             "progression"
    },
    {
        "id":               0x00000013,
        "name":             "Chapter 10",
        "description":      "Serpentine",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "timeTrialSeconds": 20,
        "hasLeaderboard":   true,
        "challengeName":    "Zig Zag",
        "challengeDesc":    "Collect 7 hearts and complete chapter 10 in under 20 seconds",
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x0000000b,
        "name":             "Chapter 11",
        "description":      "Flying Rocks",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Rock of Terror",
        "challengeDesc":    "Without dying collect 8 hearts in no more than 6 world rotations then complete chapter 11",
        "deathless":        true,
        "heartsCollected":  true,
        "worldRotations":   6,
        "type":             "progression"
    },
    {
        "id":               0x00000007,
        "name":             "Chapter 12",
        "description":      "Little Fern Track",
        "hearts":           12,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Glowing Fern",
        "challengeDesc":    "Without dying collect 12 hearts in no more than 3 double jumps then complete chapter 12",
        "deathless":        true,
        "heartsCollected":  true,
        "limitDoubleJumps": 3,
        "type":             "progression"
    },
    {
        "id":               0x0000000c,
        "name":             "Chapter 13",
        "description":      "Sky and Cave",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Descent Into Bat Kings Cave",
        "challengeDesc":    "Collect 2 hearts in no more than 3 world rotations then complete chapter 13",
        "heartsCollected":  true,
        "worldRotations":   3,
        "type":             "progression"
    },
    {
        "id":               0x0000000d,
        "name":             "Chapter 14",
        "description":      "Fall",
        "hearts":           53,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Falling In Love",
        "challengeDesc":    "Without dying collect 53 hearts then complete chapter 14",
        "deathless":        true,
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x0000000e,
        "name":             "Chapter 15",
        "description":      "Bat King",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Beady Eyed",
        "challengeDesc":    "Without dying collect 4 hearts in no more than 6 jumps then complete chapter 15",
        "deathless":        true,
        "heartsCollected":  true,
        "limitJumps":       6,
        "type":             "progression"
    },
    {
        "id":               0x0000000f,
        "name":             "Chapter 16",
        "description":      "Secret Passage",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "timeTrialSeconds": 45,
        "hasLeaderboard":   true,
        "challengeName":    "I Sense A Connection",
        "challengeDesc":    "Collect 3 hearts and complete chapter 16 in under 45 seconds",
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x00000010,
        "name":             "Chapter 17",
        "description":      "Delicious Spores",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Strange Pollen",
        "challengeDesc":    "Complete chapter 17 in no more than 7 jumps",
        "limitJumps":       7,
        "type":             "progression"
    },
    {
        "id":               0x00000012,
        "name":             "Chapter 18",
        "description":      "Beneath the Roots",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Individual Tasks",
        "challengeDesc":    "Without dying collect 8 hearts then complete chapter 18",
        "deathless":        true,
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x00000001,
        "name":             "Chapter 19",
        "description":      "Gates Of Hades",
        "hearts":           5,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "The Pit",
        "challengeDesc":    "Without dying and both brown and orange inside the end tree, use black to collect five hearts then complete chapter 19",
        "deathless":        true,
        "characterCollect": {
            "character": "black",
            "hearts":    5
        },
        "type":             "progression"
    },
    {
        "id":               0x00000002,
        "name":             "Chapter 20",
        "description":      "Chasm",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Take Aim",
        "challengeDesc":    "Without dying, or double jumping as Antler Ancestor collect 4 hearts then complete chapter 20",
        "deathless":        true,
        "heartsCollected":  true,
        "limitDoubleJumps": 0,
        "type":             "progression"
    },
    {
        "id":               0x00000014,
        "name":             "Chapter 21",
        "description":      "Crystal Caves",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Climb The Ladder",
        "challengeDesc":    "Without dying and in no more than 2 world rotations complete chapter 21",
        "deathless":        true,
        "worldRotations":   2,
        "type":             "progression"
    },
    {
        "id":               0x00000015,
        "name":             "Chapter 22",
        "description":      "Labyrinth",
        "hearts":           8,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "timeTrialSeconds": 40,
        "hasLeaderboard":   true,
        "challengeName":    "Steady Jumps",
        "challengeDesc":    "Complete chapter 22 in under 40 seconds",
        "type":             "progression"
    },
    {
        "id":               0x0000001d,
        "name":             "Chapter 23",
        "description":      "Rock Pool",
        "hearts":           7,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "It Takes Two",
        "challengeDesc":    "Without dying and in no more than 6 world rotations complete chapter 23",
        "deathless":        true,
        "worldRotations":   6,
        "type":             "progression"
    },
    {
        "id":               0x00000017,
        "name":             "Chapter 24",
        "description":      "Old Willow Tree",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "Trust Your Family",
        "challengeDesc":    "Without dying and with both brown and black inside the end tree, use orange to collect five hearts then complete chapter 24",
        "deathless":        true,
        "characterCollect": {
            "character": "orange",
            "hearts":    5
        },
        "type":             "progression"
    },
    {
        "id":               CHAPTER25,
        "name":             "Chapter 25",
        "description":      "Fortress",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    true,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "We're Coming, Mother!",
        "challengeDesc":    "Complete chapter 25 in no more than 7 double jumps and 1 world rotation",
        "limitDoubleJumps": 7,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x00000019,
        "name":             "Chapter 26",
        "description":      "Family Trees",
        "hearts":           1,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "",
        "type":             "progression"
    },
    {
        "id":               0x0000001a,
        "name":             "Credits",
        "description":      "Here Is My Heart!",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true,
        "challengeName":    "",
        "type":             "win_condition"
    }
]

// Detects if any character is jumping
//
// `hasBrownPowerUp`, `hasOrangePowerUp` and `hasBlackPowerUp` are booleans to signal if each of the characters have a powerup in that level.
function CharacterJumps( hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    conditions = [
        ( prev( BrownState() ) != 0x00000002 && BrownState() == 0x00000002 ),
        ( prev( OrangeState() ) != 0x00000002 && OrangeState() == 0x00000002 ),
        ( prev( BlackState() ) != 0x00000002 && BlackState() == 0x00000002 )
    ]
    if( hasBrownPowerUp ) {
        array_push( conditions, ( prev( BrownPoweredUpState() ) != 0x00000002 && BrownPoweredUpState() == 0x00000002 ) )
    }
    if( hasOrangePowerUp ) {
        array_push( conditions, ( prev( OrangePoweredUpState() ) != 0x00000002 && OrangePoweredUpState() == 0x00000002 ) )
    }
    if( hasBlackPowerUp ) {
        array_push( conditions, ( prev( BlackPoweredUpState() ) != 0x00000002 && BlackPoweredUpState() == 0x00000002 ) )
    }
    return conditions
}

function CharacterJumps1( chapter, hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    conditions = [
        ( Chapter() == chapter && prev( BrownState() ) != 0x00000002 && BrownState() == 0x00000002 ),
        ( Chapter() == chapter && prev( OrangeState() ) != 0x00000002 && OrangeState() == 0x00000002 ),
        ( Chapter() == chapter && prev( BlackState() ) != 0x00000002 && BlackState() == 0x00000002 )
    ]
    if( hasBrownPowerUp ) {
        array_push( conditions, ( Chapter() == chapter && prev( BrownPoweredUpState() ) != 0x00000002 && BrownPoweredUpState() == 0x00000002 ) )
    }
    if( hasOrangePowerUp ) {
        array_push( conditions, ( Chapter() == chapter && rev( OrangePoweredUpState() ) != 0x00000002 && OrangePoweredUpState() == 0x00000002 ) )
    }
    if( hasBlackPowerUp ) {
        array_push( conditions, ( Chapter() == chapter && prev( BlackPoweredUpState() ) != 0x00000002 && BlackPoweredUpState() == 0x00000002 ) )
    }
    return conditions
}

// Detects if Antler Spirit is double jumping
function AntlerDoubleJumps( chapter ) {
    return (
        Chapter() == chapter &&
        BrownState() == 0x00000008 &&
        prev( BrownDoubleJump() ) == 0x00 &&
        BrownDoubleJump() == 0x01
    )
}

// Detects if the player is in a chapter or not
function InGame() {
    return (
        GamePointer() != 0x00000000
    )
}

// Detects completion of a chapter based on character power ups in the level
//
// `isChallenge` is a boolean that will show a trigger icon in the corner of the screen for that `chapter` achievement. Using false for leaderboards to prevent the popup
//
// `hasBrownPowerUp`, `hasOrangePowerUp` and `hasBlackPowerUp` are booleans to signal if each of the characters have a powerup in that level.
function CompleteChapter( isChallenge, chapter, hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    brownDone = BrownState() == 0x00000007
    orangeDone = OrangeState() == 0x00000007
    if( hasOrangePowerUp ) {
        orangeDone = orangeDone || OrangePoweredUpState() == 0x00000007
    }
    blackDone = BlackState() == 0x00000007
    if( hasBlackPowerUp ) {
        blackDone = blackDone || BlackPoweredUpState() == 0x00000007 || BlackPoweredUpState() == 0x00000006 // Special Case: Quickly entering end tree with black powered up only animates to 0x06
    }
    done = ( ( brownDone ) && ( orangeDone ) && ( blackDone ) )
    if( hasBrownPowerUp ) {
        done = done || BrownPoweredUpState() == 0x00000007
    }
    if( chapter == CHAPTER25 ) { // Special case: we dont care about orange on chapter 25 because it can finish in any state and brown powered up will never have black as a firefly
        done = ( brownDone || BrownPoweredUpState() == 0x00000007 ) && ( blackDone )
    }
    conds = ( done ) && ( prev( Chapter() ) == chapter && Chapter() != chapter )
    if( isChallenge ) {
        conds = trigger_when( conds )
    }
    return conds
}

// Detects if orange is rotating the world in either direction
function OrangeRotating( chapter ) {
    return (
        Chapter() == chapter &&
        OrangeState() == 0x00000008 &&
        OrangePoweredUpState() != 0x00000008 &&
        (
            LeftBumperButton() == 1 ||
            RightBumperButton() == 1
        ) && 
        prev( AnimationCounter() ) != AnimationCounter()
    )
}

// Detects heart collection with specific character
//
// `hearts` is the number of hearts to collect using `character`. `character` can only be `brown`, `orange`, or `black` otherwise it will jusut detect number of hearts collected by anyone.
//
// `hasBrownPowerUp`, `hasOrangePowerUp` and `hasBlackPowerUp` are booleans to signal if each of the characters have a powerup in that level.
function CollectHeartsUsingCharacter( hearts, character, hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    base = prev( HeartsCollected() ) == HeartsCollected() - 1
    if character == "brown" {
        base = base && BrownState() != 0x00000007
        if hasBrownPowerUp {
            base = base && BrownPoweredUpState() != 0x00000007
        }
        if hasOrangePowerUp {
            base = base && OrangeState() >= 0x00000007 && OrangeState() <= 0x00000008 && OrangePoweredUpState() >= 0x00000007 && OrangePoweredUpState() <= 0x00000008
        } else {
            base = base && OrangeState() == 0x00000007
        }
        if hasBlackPowerUp {
            base = base && BlackState() >= 0x00000007 && BlackState() <= 0x00000008 && BlackPoweredUpState() >= 0x00000007 && BlackPoweredUpState() <= 0x00000008
        } else {
            base = base && BlackState() == 0x00000007
        }
    }

    if character == "orange" {
        base = base && OrangeState() != 0x00000007
        if hasBrownPowerUp {
            base = base && BrownState() >= 0x00000007 && BrownState() <= 0x00000008 && BrownPoweredUpState() >= 0x00000007 && BrownPoweredUpState() <= 0x00000008
        } else {
            base = base && BrownState() == 0x00000007
        }
        if hasOrangePowerUp {
            base = base && OrangePoweredUpState() != 0x00000007
        }
        if hasBlackPowerUp {
            base = base && BlackState() >= 0x00000007 && BlackState() <= 0x00000008 && BlackPoweredUpState() >= 0x00000007 && BlackPoweredUpState() <= 0x00000008
        } else {
            base = base && BlackState() == 0x00000007
        }
    }

    if character == "black" {
        base = base && BlackState() != 0x00000007
        if hasBrownPowerUp {
            base = base && BrownState() >= 0x00000007 && BrownState() <= 0x00000008 && BrownPoweredUpState() >= 0x00000007 && BrownPoweredUpState() <= 0x00000008
        } else {
            base = base && BrownState() == 0x00000007
        }
        if hasOrangePowerUp {
            base = base && OrangeState() >= 0x00000007 && OrangeState() <= 0x00000008 && OrangePoweredUpState() >= 0x00000007 && OrangePoweredUpState() <= 0x00000008
        } else {
            base = base && OrangeState() == 0x00000007
        }
        if hasBlackPowerUp {
            base = base && BlackPoweredUpState() != 0x00000007
        }
    }
    return repeated( hearts, base )
}

// Detects when the game is reset
function GameReset() {
    return (
        HeartsCollected() == 0x00 &&
        CurrentChapterScore() == 0x00 &&
        DarkHeartsCollected() == 0x00 && (
            (
                prev( GamePointer() ) != GamePointer()
            ) || (
                prev( CurrentChapterTimer() ) > CurrentChapterTimer()
            ) || (
                prev( CurrentChapterTimer() ) == 0x00000000 &&
                CurrentChapterTimer() > 0x00000000
            )
        )
    ) 
}

// Converts seconds into milliseconds
function InMilliseconds( seconds ) {
    return seconds * 1000
}

achievements = []
leaderboards = []
totalHearts = 0
for index in range( 1, length( chapterConfigs ) ) {
    chapter = chapterConfigs[index - 1]
    if( index != 1 ) { // Count total stars available minus chapter 1 (tutorial)
        totalHearts = totalHearts + chapter["hearts"] // Only 171 hearts https://gamefaqs.gamespot.com/boards/649587-where-is-my-heart/64934662
    }
    trigger = (
        once( Chapter() == chapter["id"] ) &&
        CompleteChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
    )
    progression = {
        "title": chapter["description"],
        "description": format("Complete {0}", chapter["name"]),
        "points": 5,
        "trigger": trigger && (
            always_false() ||
            never( GameReset() )
        ),
        "type": chapter["type"]
    }
    array_push( achievements, progression )

    if( chapter["challengeName"] != "" ) {
        challengeTrigger = once( Chapter() == chapter["id"] )
        if( dictionary_contains_key( chapter, "deathless" ) ) {
            challengeTrigger = challengeTrigger && DarkHeartsCollected() == 0
        }
        if( dictionary_contains_key( chapter, "characterCollect" ) ) {
            collectionDetails = chapter["characterCollect"]
            challengeTrigger = challengeTrigger && CollectHeartsUsingCharacter( collectionDetails["hearts"], collectionDetails["character"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
        }
        if( dictionary_contains_key( chapter, "heartsCollected" ) ) {
            challengeTrigger = challengeTrigger && HeartsCollected() == chapter["hearts"]
        }
        challengeTrigger = challengeTrigger && CompleteChapter( true, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
        if( dictionary_contains_key( chapter, "limitJumps" ) ) {
            challengeTrigger = challengeTrigger &&
            disable_when(
                tally(
                    chapter["limitJumps"] + 1,
                    CharacterJumps( chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
                )
            ) 
        }
        if( dictionary_contains_key( chapter, "limitDoubleJumps" ) ) {
            challengeTrigger = challengeTrigger &&
            disable_when(
                tally(
                    chapter["limitDoubleJumps"] + 1,
                    AntlerDoubleJumps( chapter["id"] )
                )
            )
        }
        if( dictionary_contains_key( chapter, "worldRotations" ) ) {
            challengeTrigger = challengeTrigger &&
            disable_when(
                tally(
                    chapter["worldRotations"] + 1,
                    OrangeRotating( chapter["id"] )
                )
            )
        }
        if( dictionary_contains_key( chapter, "timeTrialSeconds" ) ) {
            challengeTrigger = challengeTrigger &&
            disable_when(
                Chapter() == chapter["id"] &&
                prev( CurrentChapterTimer() ) < InMilliseconds( chapter["timeTrialSeconds"] ) &&
                CurrentChapterTimer() >= InMilliseconds( chapter["timeTrialSeconds"] )
            )
        }
        challenge = {
            "title": chapter["challengeName"],
            "description": chapter["challengeDesc"],
            "points": 5,
            "trigger":  challengeTrigger && (
                always_false() ||
                never( GameReset() )
            ),
            "type": "missable"
        }
        array_push( achievements, challenge )
    }

    if( chapter["hasLeaderboard"] ) {
        leaderboardID = index
        if dictionary_contains_key( chapter, "leaderboardID" ) {
            leaderboardID = chapter["leaderboardID"]
        }
        l = {
            "id":              leaderboardID,
            "title":           format("Speedrun {0}", chapter["name"]),
            "description":     format("Finish {0} as fast as possible", chapter["name"]),
            "value":           CurrentChapterTimer() / 0x0a,
            "format":          "MILLISECS",
            "lower_is_better": true
        }
        if( dictionary_contains_key( chapter, "timeTrialSeconds" ) ) {
            l["start"] = GameReset() && Chapter() == chapter["id"]
            l["cancel"] = GameReset() && Chapter() != chapter["id"]
            l["submit"] = CompleteChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
        } else {
            l["start"] = CompleteChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
            l["cancel"] = always_false()
            l["submit"] = always_true()
        }
        array_push( leaderboards, l )
    }
}

rich_presence_conditional_display(
    InGame(),
    "Hearts: {0}/{1}, Dark Hearts: {2}, Character: {3} TOTAL COLLECTED: {4} TOTAL HEARTS: {5}",
    rich_presence_value( "valueFormat", CurrentChapterScore(), "VALUE" ),
    rich_presence_value( "valueFormat", AvailableHearts(), "VALUE" ),
    rich_presence_value( "valueFormat", DarkHeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", Character(), "VALUE" ),
    rich_presence_value( "valueFormat", HeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", totalHearts, "VALUE" )
)

rich_presence_display("In Menus")


for index in range( 0, length( achievements ) - 1 ) {
    a = achievements[index]
    achievement(
        title       = a["title"],
        description = a["description"],
        points      = a["points"],
        trigger     = a["trigger"],
        type        = a["type"]
)
}

for index in range( 0, length( leaderboards ) - 1 ) {
    l = leaderboards[index]
    leaderboard(
        id =              l["id"],
        title =           l["title"],
        description =     l["description"],
        start =           l["start"],
        cancel =          l["cancel"],
        submit =          l["submit"],
        value =           l["value"],
        format =          l["format"],
        lower_is_better = l["lower_is_better"]
    )
}