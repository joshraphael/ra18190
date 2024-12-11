// Where is my Heart?
// #ID = 18190

// $B16038 - Game Pointer
function GamePointer() => dword( 0x00b16038 )

function GamePointer2() => dword( ( GamePointer() & 0x01ffffff ) + 0x88 )

function GamePointer3() => dword( GamePointer2() & 0x01ffffff )

function GamePointer4() => dword( ( GamePointer3() & 0x01ffffff ) + 0x14 )

function HeartsCollected() => dword( ( GamePointer4() & 0x01ffffff ) + 0x8 )

rich_presence_display(
    "Hearts Collected: {0}",
    rich_presence_value( "valueFormat", HeartsCollected(), "VALUE" )
)