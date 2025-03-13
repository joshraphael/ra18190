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

CHAPTER1  = 0x0000001b
CHAPTER2  = 0x00000000
CHAPTER3  = 0x00000003
CHAPTER4  = 0x00000004
CHAPTER5  = 0x00000005
CHAPTER6  = 0x00000008
CHAPTER7  = 0x0000000a
CHAPTER8  = 0x00000016
CHAPTER9  = 0x00000006
CHAPTER10 = 0x00000013
CHAPTER11 = 0x0000000b
CHAPTER12 = 0x00000007
CHAPTER13 = 0x0000000c
CHAPTER14 = 0x0000000d
CHAPTER15 = 0x0000000e
CHAPTER16 = 0x0000000f
CHAPTER17 = 0x00000010
CHAPTER18 = 0x00000012
CHAPTER19 = 0x00000001
CHAPTER20 = 0x00000002
CHAPTER21 = 0x00000014
CHAPTER22 = 0x00000015
CHAPTER23 = 0x0000001d
CHAPTER24 = 0x00000017
CHAPTER25 = 0x00000018
CHAPTER26 = 0x00000019
CREDITS = 0x0000001a
END = 0x00000063

// Brown: We are a family of monsters.
// Rainbow Spirit: I can reach the stars and find a way home.
// Antler Ancestor: Hop, hey and farewell!

chapterConfigs = [
    {
        "id":               CHAPTER1,
        "name":             "Chapter 1",
        "description":      "The Heart Tree",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER2,
        "name":             "Chapter 2",
        "description":      "We're on our Way",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "isTimeTrial":      true,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER3,
        "name":             "Chapter 3",
        "description":      "Wilderness",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER4,
        "name":             "Chapter 4",
        "description":      "A Little Cave",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER5,
        "name":             "Chapter 5",
        "description":      "Antler Ancestor",
        "hearts":           3,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER6,
        "name":             "Chapter 6",
        "description":      "Rainbow Spirit",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER7,
        "name":             "Chapter 7",
        "description":      "Wall in the Meadow",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER8,
        "name":             "Chapter 8",
        "description":      "Bridge",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER9,
        "name":             "Chapter 9",
        "description":      "Islands",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER10,
        "name":             "Chapter 10",
        "description":      "Serpentine",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      true,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER11,
        "name":             "Chapter 11",
        "description":      "Flying Rocks",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER12,
        "name":             "Chapter 12",
        "description":      "Little Fern Track",
        "hearts":           12,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER13,
        "name":             "Chapter 13",
        "description":      "Sky and Cave",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER14,
        "name":             "Chapter 14",
        "description":      "Fall",
        "hearts":           53,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER15,
        "name":             "Chapter 15",
        "description":      "Bat King",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER16,
        "name":             "Chapter 16",
        "description":      "Secret Passage",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "isTimeTrial":      true,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER17,
        "name":             "Chapter 17",
        "description":      "Delicious Spores",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER18,
        "name":             "Chapter 18",
        "description":      "Beneath the Roots",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER19,
        "name":             "Chapter 19",
        "description":      "Gates Of Hades",
        "hearts":           5,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER20,
        "name":             "Chapter 20",
        "description":      "Chasm",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER21,
        "name":             "Chapter 21",
        "description":      "Crystal Caves",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER22,
        "name":             "Chapter 22",
        "description":      "Labyrinth",
        "hearts":           8,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      true,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER23,
        "name":             "Chapter 23",
        "description":      "Rock Pool",
        "hearts":           7,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER24,
        "name":             "Chapter 24",
        "description":      "Old Willow Tree",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
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
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER26,
        "name":             "Chapter 26",
        "description":      "Family Trees",
        "hearts":           1,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
    },
    {
        "id":               CREDITS,
        "name":             "Credits",
        "description":      "",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "isTimeTrial":      false,
        "hasLeaderboard":   true
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

rich_presence_conditional_display(
    InGame(),
    "Hearts: {0}/{1}, Dark Hearts: {2}, Character: {3} TOTAL COLLECTED: {4}",
    rich_presence_value( "valueFormat", CurrentChapterScore(), "VALUE" ),
    rich_presence_value( "valueFormat", AvailableHearts(), "VALUE" ),
    rich_presence_value( "valueFormat", DarkHeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", Character(), "VALUE" ),
    rich_presence_value( "valueFormat", HeartsCollected(), "VALUE" )
)

rich_presence_display("In Menus")

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

achievement(
    title = "Totem Spirit",
    description = "Complete chapter 1 in no more than 15 jumps",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER1 ) &&
        CompleteChapter( true, CHAPTER1, false, false, false )
    ) &&
    disable_when(
        tally(
            16,
            CharacterJumps( false, false, false )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Gotta Go Fast",
    description = "Complete chapter 2 in under 12 seconds",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER2 && CurrentChapterTimer() > 0x00000000 ) &&
        CompleteChapter( true, CHAPTER2, false, false, false )
    ) &&
    disable_when(
        Chapter() == CHAPTER2 &&
        prev( CurrentChapterTimer() ) < InMilliseconds( 12 ) &&
        CurrentChapterTimer() >= InMilliseconds( 12 )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Mind The Gap",
    description = "With both orange and black inside the end tree, use brown to collect one heart then complete chapter 3",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER3 ) &&
        CollectHeartsUsingCharacter( 1, "brown", false, false, false ) &&
        CompleteChapter( true, CHAPTER3, false, false, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Rock Tunnel",
    description = "Collect 3 hearts in no more than 14 jumps then complete chapter 4",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER4 ) &&
        HeartsCollected() == 3 &&
        CompleteChapter( true, CHAPTER4, false, false, false )
    ) &&
    disable_when(
        tally(
            15,
            CharacterJumps( false, false, false )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Gallup Jingle",
    description = "Collect 3 hearts in no more than 6 double jumps then complete chapter 5",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER5 ) &&
        HeartsCollected() == 3 &&
        CompleteChapter( true, CHAPTER5, true, false, false )
    ) &&
    disable_when(
        tally(
            7,
            AntlerDoubleJumps( CHAPTER5 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "A Slight Breeze",
    description = "Collect 2 hearts in no more than 1 world rotation then complete chapter 6",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER6 ) &&
        HeartsCollected() == 2 &&
        CompleteChapter( true, CHAPTER6, false, true, false )
    ) &&
    disable_when(
        tally(
            2,
            OrangeRotating( CHAPTER6 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Great Wall",
    description = "With both orange and brown inside the end tree, use black to collect one heart then complete chapter 7",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER7 ) &&
        CollectHeartsUsingCharacter( 1, "black", false, true, false ) &&
        CompleteChapter( true, CHAPTER7, false, true, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Rainbow Bridge",
    description = "Without dying collect 4 hearts in no more than 1 world rotation then complete chapter 8",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER8 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 4 &&
        CompleteChapter( true, CHAPTER8, false, true, false )
    ) &&
    disable_when(
        tally(
            2,
            OrangeRotating( CHAPTER8 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Island Hopping",
    description = "Collect 5 hearts in no more than 4 double jumps then complete chapter 9",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER9 ) &&
        HeartsCollected() == 5 &&
        CompleteChapter( true, CHAPTER9, true, false, false )
    ) &&
    disable_when(
        tally(
            5,
            AntlerDoubleJumps( CHAPTER9 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Zig Zag",
    description = "Collect 7 hearts and complete chapter 10 in under 20 seconds",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER10 ) &&
        HeartsCollected() == 7 &&
        CompleteChapter( true, CHAPTER10, true, false, false )
    ) &&
    disable_when(
        Chapter() == CHAPTER10 &&
        prev( CurrentChapterTimer() ) < InMilliseconds( 20 ) &&
        CurrentChapterTimer() >= InMilliseconds( 20 )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Rock of Terror",
    description = "Without dying collect 8 hearts in no more than 6 world rotations then complete chapter 11",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER11 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 8 &&
        CompleteChapter( true, CHAPTER11, false, true, false )
    ) &&
    disable_when(
        tally(
            7,
            OrangeRotating( CHAPTER11 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Glowing Fern",
    description = "Without dying collect 12 hearts in no more than 3 double jumps then complete chapter 12",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER12 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 12 &&
        CompleteChapter( true, CHAPTER12, true, false, false )
    ) &&
    disable_when(
        tally(
            4,
            AntlerDoubleJumps( CHAPTER12 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Descent Into Bat Kings Cave",
    description = "Collect 2 hearts in no more than 3 world rotations then complete chapter 13",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER13 ) &&
        HeartsCollected() == 2 &&
        CompleteChapter( true, CHAPTER13, false, true, false )
    ) &&
    disable_when(
        tally(
            4,
            OrangeRotating( CHAPTER13 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Falling In Love",
    description = "Without dying collect 53 hearts then complete chapter 14",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER14 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 53 &&
        CompleteChapter( true, CHAPTER14, false, false, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Beady Eyed",
    description = "Without dying collect 4 hearts in no more than 6 jumps then complete chapter 15",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER15 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 4 &&
        CompleteChapter( true, CHAPTER15, false, false, true )
    ) &&
    disable_when(
        tally(
            7,
            CharacterJumps( false, false, true )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Secret Passage",
    description = "Collect 3 hearts and complete chapter 16 in under 45 seconds",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER16 ) &&
        HeartsCollected() == 3 &&
        CompleteChapter( true, CHAPTER16, false, false, true )
    ) &&
    disable_when(
        Chapter() == CHAPTER16 &&
        prev( CurrentChapterTimer() ) < InMilliseconds( 45 ) &&
        CurrentChapterTimer() >= InMilliseconds( 45 )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Strange Pollen",
    description = "Complete chapter 17 in no more than 7 jumps",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER17 ) &&
        CompleteChapter( true, CHAPTER17, true, false, false )
    ) &&
    disable_when(
        tally(
            8,
            CharacterJumps1( CHAPTER17, true, false, false )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Individual Tasks",
    description = "Without dying collect 8 hearts then complete chapter 18",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER18 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 8 &&
        CompleteChapter( true, CHAPTER18, false, false, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "The Pit",
    description = "Without dying and both brown and orange inside the end tree, use black to collect five hearts then complete chapter 19",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER19 ) &&
        DarkHeartsCollected() == 0 &&
        CollectHeartsUsingCharacter( 5, "black", false, false, true ) &&
        CompleteChapter( true, CHAPTER19, false, false, true ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Take Aim",
    description = "Without dying, or double jumping as Antler Ancestor collect 4 hearts then complete chapter 20",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER20 ) &&
        DarkHeartsCollected() == 0 &&
        HeartsCollected() == 4 &&
        CompleteChapter( true, CHAPTER20, true, false, false )
    ) &&
    disable_when(
        tally(
            1,
            AntlerDoubleJumps( CHAPTER20 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Climb The Ladder",
    description = "Without dying and in no more than 2 world rotations complete chapter 21",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER21 ) &&
        DarkHeartsCollected() == 0 &&
        CompleteChapter( true, CHAPTER21, false, true, true )
    ) &&
    disable_when(
        tally(
            3,
            OrangeRotating( CHAPTER21 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Steady Jumps",
    description = "Complete chapter 22 in under 40 seconds",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER22 ) &&
        CompleteChapter( true, CHAPTER22, true, false, false )
    ) &&
    disable_when(
        Chapter() == CHAPTER22 &&
        prev( CurrentChapterTimer() ) < InMilliseconds( 40 ) &&
        CurrentChapterTimer() >= InMilliseconds( 40 )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "It Takes Two",
    description = "Without dying and in no more than 6 world rotations complete chapter 23",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER23 ) &&
        DarkHeartsCollected() == 0 &&
        CompleteChapter( true, CHAPTER23, false, true, true )
    ) &&
    disable_when(
        tally(
            7,
            OrangeRotating( CHAPTER23 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Trust Your Family",
    description = "Without dying and with both brown and black inside the end tree, use orange to collect five hearts then complete chapter 24",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER24 ) &&
        DarkHeartsCollected() == 0 &&
        CollectHeartsUsingCharacter( 5, "orange", true, false, false ) &&
        CompleteChapter( true, CHAPTER24, true, false, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "We're Coming, Mother!",
    description = "Complete chapter 25 in no more than 7 double jumps and 1 world rotation",
    points = 5,
    trigger = (
        once( Chapter() == CHAPTER25 ) &&
        CompleteChapter( true, CHAPTER25, true, true, true )
    ) &&
    disable_when(
        tally(
            8,
            AntlerDoubleJumps( CHAPTER25 )
        )
    ) &&
    disable_when(
        tally(
            2,
            OrangeRotating( CHAPTER25 )
        )
    ) && (
        always_false() ||
        never( GameReset() )
    ),
    type = "missable"
)

for index in range( 1, length( chapterConfigs ) ) {
    chapter = chapterConfigs[index - 1]

    leaderboardID = index
    if dictionary_contains_key( chapter, "leaderboardID" ) {
        leaderboardID = chapter["leaderboardID"]
    }
    if chapter["hasLeaderboard"] {
        l = {
            "id":              leaderboardID,
            "title":           format("Speedrun {0}", chapter["name"]),
            "description":     format("Finish {0} as fast as possible", chapter["name"]),
            "value":           CurrentChapterTimer() / 0x0a,
            "format":          "MILLISECS",
            "lower_is_better": true
        }
        if( chapter["isTimeTrial"] ) {
            l["start"] = GameReset() && Chapter() == chapter["id"]
            l["cancel"] = GameReset() && Chapter() != chapter["id"]
            l["submit"] = CompleteChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
        } else {
            l["start"] = CompleteChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] )
            l["cancel"] = always_false()
            l["submit"] = always_true()
        }
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
}