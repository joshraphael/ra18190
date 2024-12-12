// Where is my Heart?
// #ID = 18190

// $B16038 - [32-bit] Game Pointer
// Notes: Anything other than 0x00000000 is an address to the currently playing chapters data
// 0x00000000 = In Main Menu

function GamePointer() => dword( 0x00b16038 )

function GamePointer2() => dword( ( GamePointer() & 0x01ffffff ) + 0x88 )

// The character currently being used in game 0x00000000 = Brown, 0x00000001 = Orange, 0x00000002 = Black
function Character() => dword( ( GamePointer() & 0x01ffffff ) + 0x244 )

function GamePointer3() => dword( GamePointer2() & 0x01ffffff )

function GamePointer4() => dword( ( GamePointer3() & 0x01ffffff ) + 0x14 )

function HeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0x8 )

function DarkHeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0x10 )

function AvailableHearts() => dword( ( GamePointer4() & 0x01ffffff ) + 0x14 )

// $B16044 - [32-bit] Game State
// 0x00000000 = Playing Chapter
// 0x00000001 = In Start Menu
function GameState() => dword( 0x00b16044 )

function Chapter() => dword( 0x00b160d4 )

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
rich_presence_conditional_display(
    InGame(),
    "Hearts: {0}/{1}, Dark Hearts: {2}, Character: {3}",
    rich_presence_value( "valueFormat", HeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", AvailableHearts(), "VALUE" ),
    rich_presence_value( "valueFormat", DarkHeartsCollected(), "VALUE" ),
    rich_presence_value( "valueFormat", Character(), "VALUE" )
)

rich_presence_display("In Menus")