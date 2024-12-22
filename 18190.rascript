// Where is my Heart?
// #ID = 18190

// $9E6538 - [32-bit] Orange Rotating World
// 0x00000000 = Not Rotating
// 0x00000001 = Rotating
function OrangePowerupRotating() => dword( 0x009e6538 )

// $A43A40 - [32-bit] Key Pressed
function KeyPressed() => dword( 0x00a43a40 )

// $B16038 - [32-bit] Game Pointer
// Notes: Anything other than 0x00000000 is an address to the currently playing chapters data
// 0x00000000 = In Main Menu

function GamePointer() => dword( 0x00b16038 )

function GamePointer2() => dword( ( GamePointer() & 0x01ffffff ) + 0x88 )

// The character currently being used in game 0x00000000 = Brown, 0x00000001 = Orange, 0x00000002 = Black
function Character() => dword( ( GamePointer() & 0x01ffffff ) + 0x244 )

function GamePointer3() => dword( GamePointer2() & 0x01ffffff )

function GamePointer4() => dword( ( GamePointer3() & 0x01ffffff ) + 0x14 )

function CurrentChapterScore() => dword( ( GamePointer4() & 0x01ffffff ) + 0x8 )

function HeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0xc )

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

function BrownHeighLevel() => dword( 0x00e67a18 )

function BlackHeightLevel() => dword( 0x00b1f148 )

function OrangeHeightLevel() => dword( 0x00e67f18 )

// 0x0001 = not double Jumping
// 0x0101 = double jumping
function BrownDoubleJump() => word( 0x00b17f70 )

CHAPTER1 = 0x0000001b
CHAPTER2 = 0x00000000
CHAPTER3 = 0x00000003
CHAPTER4 = 0x00000004
CHAPTER5 = 0x00000005
CHAPTER6 = 0x00000008
CHAPTER7 = 0x0000000a

function InGame() {
    return (
        GamePointer() != 0x00000000
    )
}

function UpgradeChapter( current, next ) {
    return (
        prev( Chapter() ) == current &&
        Chapter() == next &&
        BrownState() == 0x00000007 &&
        OrangeState() == 0x00000007 &&
        BlackState() == 0x00000007
    )
}

rich_presence_conditional_display(
    InGame(),
    "Hearts: {0}/{1}, Dark Hearts: {2}, Character: {3}",
    rich_presence_value( "valueFormat", CurrentChapterScore(), "VALUE" ),
    rich_presence_value( "valueFormat", AvailableHearts(), "VALUE" ),
    rich_presence_value( "valueFormat", DarkHeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", Character(), "VALUE" )
)

rich_presence_display("In Menus")

achievement(
    title = "Score!",
    description = "Win a game with at least 600 points",
    points = 25,
    trigger = InGame() && UpgradeChapter( CHAPTER1, CHAPTER2 ) && disable_when(repeated(6, prev(BrownState()) != 0x00000002 && BrownState() == 0x00000002 ), until = ( ChapterTimer() < prev( ChapterTimer() ) ))
)