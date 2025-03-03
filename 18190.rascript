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

// Brown: We are a family of monsters.
// Rainbow Spirit: I can reach the stars and find a way home.
// Antler Ancestor: Hop, hey and farewell!

chapterConfigs = [
    {
        "id":               CHAPTER1,
        "description":      "The Heart Tree",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER2,
        "description":      "We're on our Way",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER3,
        "description":      "Wilderness",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 1,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER4,
        "description":      "A Little Cave",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER5,
        "description":      "Antler Ancestor",
        "hearts":           3,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER6,
        "description":      "Rainbow Spirit",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER7,
        "description":      "Wall in the Meadow",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER8,
        "description":      "Bridge",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER9,
        "description":      "Islands",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER10,
        "description":      "Serpentine",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER11,
        "description":      "Flying Rocks",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER12,
        "description":      "Little Fern Track",
        "hearts":           12,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER13,
        "description":      "Sky and Cave",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER14,
        "description":      "Fall",
        "hearts":           53,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER15,
        "description":      "Bat King",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER16,
        "description":      "Secret Passage",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     true,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER17,
        "description":      "Delicious Spores",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    {
        "id":               CHAPTER18,
        "description":      "Beneath the Roots",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "blackPowerUp":     false,
        "progressionGroup": 2,
        "hasLeaderboard":   true
    },
    // {
    //     "id":               CHAPTER19,
    //     "description":      "Gates Of Hades",
    //     "hearts":           5,
    //     "brownPowerUp":     false,
    //     "orangePowerUp":    false,
    //     "blackPowerUp":     true,
    //     "progressionGroup": 2,
    //     "hasLeaderboard":   true
    // }
]

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

function AntlerDoubleJumps() {
    return (
        BrownState() == 0x00000008 &&
        prev( BrownDoubleJump() ) == 0x00 &&
        BrownDoubleJump() == 0x01
    )
}

function InGame() {
    return (
        GamePointer() != 0x00000000
    )
}

function UpgradeChapter1( isChallenge, chapter, hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    conds = (
        prev( Chapter() ) == chapter &&
        Chapter() != chapter &&
        prev( GameState() ) != 0x00000001 &&
        GameState() == 0x00000000
    )
    if isChallenge {
        conds = trigger_when( conds )
    }
    return conds
}

function UpgradeChapter( isChallenge, chapter, hasBrownPowerUp, hasOrangePowerUp, hasBlackPowerUp ) {
    brown = prev( BrownState() ) != 0x00000007 && BrownState() == 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000007
    orange = BrownState() == 0x00000007 && prev( OrangeState() ) != 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000007
    black = BrownState() == 0x00000007 && OrangeState() == 0x00000007 && prev( BlackState() ) != 0x00000007 && BlackState() == 0x00000007
    if( isChallenge ) {
        brown = trigger_when( brown )
        orange = trigger_when( orange )
        black = trigger_when( black )
    }
    conds = ( brown ) || ( orange ) || ( black )
    if( hasBrownPowerUp ) {
        // Ideally we would check for browns state to be 0x00000008 but level 10 defaults browns state to 0x00000000 so we need to loosen the requirements
        brownPowerUp = prev( BrownPoweredUpState() ) != 0x00000007 && BrownPoweredUpState() == 0x00000007
        if( chapter != CHAPTER10 ) {
            brownPowerUp = BrownState() == 0x00000008 && brownPowerUp
        }
        if( isChallenge ) {
            brownPowerUp = trigger_when( brownPowerUp )
        }
        conds = conds || ( brownPowerUp )
    }
    if( hasOrangePowerUp ) {
        orangeNewBrown = prev( BrownState() ) != 0x00000007 && BrownState() == 0x00000007 && OrangeState() == 0x00000008 && OrangePoweredUpState() == 0x00000007 && BlackState() == 0x00000007
        orangeNewOrange = BrownState() == 0x00000007 && OrangeState() == 0x00000008 && prev( OrangePoweredUpState() ) != 0x00000007 && OrangePoweredUpState() == 0x00000007 && BlackState() == 0x00000007
        orangeNewBlack = BrownState() == 0x00000007 && OrangeState() == 0x00000008 && OrangePoweredUpState() == 0x00000007 && prev( BlackState() ) != 0x00000007 && BlackState() == 0x00000007
        if( isChallenge ) {
            orangeNewBrown = trigger_when( orangeNewBrown )
            orangeNewOrange = trigger_when( orangeNewOrange )
            orangeNewBlack = trigger_when( orangeNewBlack )
        }
        conds = conds || ( orangeNewBrown ) || ( orangeNewOrange ) || ( orangeNewBlack )
    }
    if( hasBlackPowerUp ) {
        blackNewBrown = prev( BrownState() ) != 0x00000007  && BrownState() == 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000008 && BlackPoweredUpState() == 0x00000007
        blackNewOrange = BrownState() == 0x00000007 && prev( OrangeState() ) != 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000008 && BlackPoweredUpState() == 0x00000007
        // Odd case when Black is powered up and he is the final to enter the end tree: if the characters enter the end tree one at a time and black powered up is last, this should still work since the animation transitions through 0x06
        // The problem happens when all three are stacked in front of the end tree and you quickly enter the end tree. The game will not transition black when hes powered up to 0x07.
        // So we can only account for the animation when they are entering the end tree on this case

        // Normal case: brown and orage securly in tree then you put black in. The game doesnt transition him to 0x07, so check his status changes to 0x06
        blackNewBlack = BrownState() == 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000008 && prev( BlackPoweredUpState() ) != 0x00000006 && BlackPoweredUpState() == 0x00000006

        // Edge case 1: All enter close together in order Brown - Orange - Black. Brown successfully enters all the way, then detect when orange enters all the way as a completion
        blackNewBlack1 = BrownState() == 0x00000007 && prev( OrangeState() ) != 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000008 && BlackPoweredUpState() == 0x00000006

        // Edge case 2: All enter close together in order Orange - Brown - Black. Orange successfully enters all the way, then detect when brown enters all the way as a completion
        blackNewBlack2 = prev( BrownState() ) != 0x00000007  && BrownState() == 0x00000007 && OrangeState() == 0x00000007 && BlackState() == 0x00000008 && BlackPoweredUpState() == 0x00000006
        if( isChallenge ) {
            blackNewBrown = trigger_when( blackNewBrown )
            blackNewOrange = trigger_when( blackNewOrange )
            blackNewBlack = trigger_when( blackNewBlack )
            blackNewBlack1 = trigger_when( blackNewBlack1 )
            blackNewBlack2 = trigger_when( blackNewBlack2 )
        }
        conds = conds || ( blackNewBrown ) || ( blackNewOrange ) || ( blackNewBlack ) || ( blackNewBlack1 ) || ( blackNewBlack2 )
    }
    return conds
}

function OrangeRotating() {
    return (
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

function Test( chapter ) {
    return (
        Chapter() == chapter &&
        BrownState() == 0x00000007 &&
        OrangeState() == 0x00000007 &&
        prev( HeartsCollected() ) == HeartsCollected() - 1
    )
}

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

function GameReset() {
    return (
        HeartsCollected() == 0x00 &&
        CurrentChapterScore() == 0x00 &&
        DarkHeartsCollected() == 0x00 && (
            (
                prev( GamePointer() ) != GamePointer()
            ) || (
                prev( ChapterTimer() ) > ChapterTimer()
            ) || (
                prev( ChapterTimer() ) == 0x00000000 &&
                ChapterTimer() > 0x00000000
            )
        )
    ) 
}

function InSeconds( time ) {
    return time * 1000
}

achievement(
    title = "Totem Spirit",
    description = "Complete chapter 1 in no more than 15 jumps",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER1 &&
        UpgradeChapter( true, CHAPTER1, false, false, false )
    ) &&
    disable_when(
        tally(
            16,
            CharacterJumps( false, false, false )
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Gotta Go Fast",
    description = "Complete chapter 2 in under 11 seconds",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER2 &&
        UpgradeChapter( true, CHAPTER2, false, false, false )
    ) &&
    disable_when(
        Chapter() == CHAPTER2 &&
        prev( ChapterTimer() ) < InSeconds( 11 ) &&
        ChapterTimer() >= InSeconds( 11 ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Mind The Gap",
    description = "With both orange and black inside the end tree, use brown to collect one heart then complete chapter 3",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER3 &&
        CollectHeartsUsingCharacter( 1, "brown", false, false, false ) &&
        UpgradeChapter( true, CHAPTER3, false, false, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Rock Tunnel",
    description = "Without dying collect 3 hearts in no more than 14 jumps then complete chapter 4",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER4 &&
        HeartsCollected() >= 3 &&
        UpgradeChapter( true, CHAPTER4, false, false, false )
    ) &&
    disable_when(
        tally(
            15,
            CharacterJumps( false, false, false )
        ),
        until = GameReset()
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Gallup Jingle",
    description = "Collect 3 hearts in no more than 3 double jumps then complete chapter 5",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER5 &&
        HeartsCollected() >= 3 &&
        UpgradeChapter( true, CHAPTER5, true, false, false )
    ) &&
    disable_when(
        tally(
            4,
            AntlerDoubleJumps()
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "A Slight Breeze",
    description = "Collect 2 hearts in no more than 1 world rotation then complete chapter 6",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER6 &&
        HeartsCollected() >= 2 &&
        UpgradeChapter( true, CHAPTER6, false, true, false )
    ) &&
    disable_when(
        tally(
            2,
            OrangeRotating()
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Great Wall",
    description = "With both orange and brown inside the end tree, use black to collect one heart then complete chapter 7",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER7 &&
        CollectHeartsUsingCharacter( 1, "black", false, true, false ) &&
        UpgradeChapter( true, CHAPTER7, false, true, false ) &&
        never( GameReset() )
    ),
    type = "missable"
)

achievement(
    title = "Rainbow Bridge",
    description = "Without dying collect 4 hearts in no more than 1 world rotation then complete chapter 8",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER8 &&
        HeartsCollected() >= 4 &&
        UpgradeChapter( true, CHAPTER8, false, true, false )
    ) &&
    disable_when(
        tally(
            2,
            OrangeRotating()
        ),
        until = GameReset()
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Island Hopping",
    description = "Collect 5 hearts in no more than 4 double jumps then complete chapter 9",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER9 &&
        HeartsCollected() >= 5 &&
        UpgradeChapter( true, CHAPTER9, true, false, false )
    ) &&
    disable_when(
        tally(
            5,
            AntlerDoubleJumps()
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Zig Zag",
    description = "Collect 7 hearts and complete chapter 10 in under 20 seconds",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER10 &&
        HeartsCollected() >= 7 &&
        UpgradeChapter( true, CHAPTER10, true, false, false )
    ) &&
    disable_when(
        Chapter() == CHAPTER10 &&
        prev( ChapterTimer() ) < InSeconds( 20 ) &&
        ChapterTimer() >= InSeconds( 20 ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Rock of Terror",
    description = "Without dying collect 8 hearts in no more than 6 world rotation then complete chapter 11",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER11 &&
        HeartsCollected() >= 8 &&
        UpgradeChapter( true, CHAPTER11, false, true, false )
    ) &&
    disable_when(
        tally(
            7,
            OrangeRotating()
        ),
        until = GameReset()
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Glowing Fern",
    description = "Without dying collect 12 hearts in no more than 3 double jumps then complete chapter 12",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER12 &&
        HeartsCollected() >= 12 &&
        UpgradeChapter( true, CHAPTER12, true, false, false )
    ) &&
    disable_when(
        tally(
            4,
            AntlerDoubleJumps()
        ),
        until = GameReset()
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Descent Into Bat Kings Cave",
    description = "Collect 2 hearts in no more than 3 world rotation then complete chapter 13",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER13 &&
        HeartsCollected() >= 2 &&
        UpgradeChapter( true, CHAPTER13, false, true, false )
    ) &&
    disable_when(
        tally(
            4,
            OrangeRotating()
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Falling In Love",
    description = "Without dying collect 53 hearts then complete chapter 14",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER14 &&
        HeartsCollected() >= 53 &&
        UpgradeChapter( true, CHAPTER14, false, false, false )
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Beady Eyed",
    description = "Without dying collect 4 hearts in no more than 6 jumps then complete chapter 15",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER15 &&
        HeartsCollected() >= 4 &&
        UpgradeChapter( true, CHAPTER15, false, false, true )
    ) &&
    disable_when(
        tally(
            7,
            CharacterJumps( false, false, true )
        ),
        until = GameReset()
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Secret Passage",
    description = "Collect 3 hearts and complete chapter 16 in under 45 seconds",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER16 &&
        HeartsCollected() >= 3 &&
        UpgradeChapter( true, CHAPTER16, false, false, true )
    ) &&
    disable_when(
        Chapter() == CHAPTER16 &&
        prev( ChapterTimer() ) < InSeconds( 45 ) &&
        ChapterTimer() >= InSeconds( 45 ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Strange Pollen",
    description = "Complete chapter 17 in no more than 7 jumps",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER17 &&
        UpgradeChapter( true, CHAPTER17, true, false, false )
    ) &&
    disable_when(
        tally(
            8,
            CharacterJumps( true, false, false )
        ),
        until = GameReset()
    ),
    type = "missable"
)

achievement(
    title = "Individual Tasks",
    description = "Without dying collect 8 hearts then complete chapter 18",
    points = 5,
    trigger = (
        InGame() &&
        Chapter() == CHAPTER18 &&
        HeartsCollected() >= 8 &&
        UpgradeChapter( true, CHAPTER18, false, false, false )
    ) &&
    disable_when(
        DarkHeartsCollected() - prev( DarkHeartsCollected() ) == 1,
        until = GameReset()
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
        leaderboard(
            id = leaderboardID,
            title = format("Speedrun Chapter {0}", index),
            description = format("Finish chapter {0} as fast as possible", index),
            start = (
                Chapter() == chapter["id"] &&
                GameReset()
            ),
            cancel = (
                (
                    prev( ChapterTimer() ) < 0xffffffff &&
                    ChapterTimer() == 0xffffffff
                ) || (
                    prev( Chapter() ) == chapter["id"] &&
                    Chapter() != chapter["id"]
                ) || (
                    prev( GamePointer() ) != 0x00000000 &&
                    GamePointer() == 0x00000000
                )
            ),
            submit = UpgradeChapter( false, chapter["id"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["blackPowerUp"] ),
            value = ChapterTimer() / 0x0a,
            format = "MILLISECS",
            lower_is_better = true
        )
    }
}