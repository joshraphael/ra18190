// Where is my Heart?
// #ID = 18190

// $B16038 - Game Pointer
function GamePointer() => dword( 0x00b16038 ) & 0x01ffffff

function GamePointer2() => dword( GamePointer() + 0x88 ) & 0x01ffffff

function GamePointer3() => dword( GamePointer2() ) & 0x01ffffff

function GamePointer4() => dword( GamePointer3() + 0x14 ) & 0x01ffffff

function HeartsCollected() => dword( GamePointer4() + 0xc )