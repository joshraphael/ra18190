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
// (use & value 0x01ffffff)
//
// ```text
// 0x00000000 = In Main Menu
// +0x088 = Pointer [32-bit]
// .+0x000 = Pointer [32-bit]
// ..+0x014 = Pointer [32-bit]
// ...+0x008 = Current Chapter Score [32-bit]
// ...+0x00c = Hearts Collected [32-bit]
// ...+0x010 = Dark Hearts Collected [32-bit]
// ...+0x014 = Hearts Available [32-bit]
// +0x244 = Current Character [32-bit]
// 0x00000000 = Brown
// 0x00000001 = Orange
// 0x00000002 = Gray
// +0x284 = Current Chapter Timer [32-bit]
// ```
function GamePointer() => dword( 0x00b16038 )

function GamePointer2() => dword( ( GamePointer() & 0x01ffffff ) + 0x88 )

// The character currently being used in game 0x00000000 = Brown, 0x00000001 = Orange, 0x00000002 = Gray
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

function Score() => dword( 0x00b16048 )

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

// $B1F0F8 - [32-bit] Gray State
// 0x00000000 = Idle
// 0x00000001 = Left or Right
// 0x00000002 = Jumping
// 0x00000003 = Falling
// 0x00000004 = End Jump
// 0x00000006 = Entering End Chapter Tree
// 0x00000007 = Inside End Chapter Tree
// 0x00000008 = Powered Up (if entering End Tree powered up it stays this value)
function GrayState() => dword( 0x00b1f0f8 )

function GrayPoweredUpState() => dword( 0x00b23d78 )

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
        "nextID":           0x00000000,
        "name":             "chapter 1",
        "nameTitle":        "Chapter 1",
        "raID":             509517,
        "raIcon":           "579155",
        "raChallengeIcon":  "579156",
        "description":      "The Heart Tree",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127770,
        "challengeName":    "Totem Spirit",
        "raChallengeID":    509518,
        "challengeDesc":    "Complete chapter 1 in no more than 15 jumps.",
        "limitJumps":       15,
        "type":             "progression"
    },
    {
        "id":               0x00000000,
        "nextID":           0x00000003,
        "name":             "chapter 2",
        "nameTitle":        "Chapter 2",
        "raID":             509519,
        "raIcon":           "579157",
        "raChallengeIcon":  "579158",
        "description":      "We Are on Our Way",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "timeTrialSeconds": 15,
        "hasLeaderboard":   true,
        "leaderboardID":    127771,
        "challengeName":    "Gotta Go Fast",
        "raChallengeID":    509520,
        "challengeDesc":    "Complete chapter 2 in under 15 seconds.",
        "type":             "progression"
    },
    {
        "id":               0x00000003,
        "nextID":           0x00000004,
        "name":             "chapter 3",
        "nameTitle":        "Chapter 3",
        "raID":             509521,
        "raIcon":           "579159",
        "raChallengeIcon":  "579160",
        "description":      "Wilderness",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127772,
        "challengeName":    "Mind the Gap",
        "raChallengeID":    509522,
        "challengeDesc":    "With both Orange and Gray inside the end tree, use Brown to collect one heart, then complete chapter 3.",
        "characterCollect": {
            "character": "brown",
            "hearts":    1
        },
        "type":             "progression"
    },
    {
        "id":               0x00000004,
        "nextID":           0x00000005,
        "name":             "chapter 4",
        "nameTitle":        "Chapter 4",
        "raID":             509523,
        "raIcon":           "579161",
        "raChallengeIcon":  "579162",
        "description":      "A Little Cave",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127773,
        "challengeName":    "Rock Tunnel",
        "raChallengeID":    509524,
        "challengeDesc":    "Collect 3 hearts in no more than 14 jumps, then complete chapter 4.",
        "heartsCollected":  true,
        "limitJumps":       14,
        "type":             "progression"
    },
    {
        "id":               0x00000005,
        "nextID":           0x00000008,
        "name":             "chapter 5",
        "nameTitle":        "Chapter 5",
        "raID":             509525,
        "raIcon":           "579163",
        "raChallengeIcon":  "579164",
        "description":      "Antler Ancestor",
        "hearts":           3,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127774,
        "challengeName":    "Gallup Jingle",
        "raChallengeID":    509526,
        "challengeDesc":    "Collect 3 hearts in no more than 6 double jumps, then complete chapter 5.",
        "heartsCollected":  true,
        "limitDoubleJumps": 6,
        "type":             "progression"
    },
    {
        "id":               0x00000008,
        "nextID":           0x0000000a,
        "name":             "chapter 6",
        "nameTitle":        "Chapter 6",
        "raID":             509513,
        "raIcon":           "579165",
        "raChallengeIcon":  "579166",
        "description":      "Rainbow Spirit",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127775,
        "challengeName":    "A Slight Breeze",
        "raChallengeID":    509514,
        "challengeDesc":    "Collect 2 hearts in no more than 1 world rotation, then complete chapter 6.",
        "heartsCollected":  true,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x0000000a,
        "nextID":           0x00000016,
        "name":             "chapter 7",
        "nameTitle":        "Chapter 7",
        "raID":             509527,
        "raIcon":           "579167",
        "raChallengeIcon":  "579168",
        "description":      "Wall in the Meadow",
        "hearts":           1,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127776,
        "challengeName":    "Great Wall",
        "raChallengeID":    509528,
        "challengeDesc":    "With both Orange and Brown inside the end tree, use Gray to collect one heart, then complete chapter 7.",
        "characterCollect": {
            "character": "gray",
            "hearts":    1
        },
        "type":             "progression"
    },
    {
        "id":               0x00000016,
        "nextID":           0x00000006,
        "name":             "chapter 8",
        "nameTitle":        "Chapter 8",
        "raID":             509515,
        "raIcon":           "579169",
        "raChallengeIcon":  "579170",
        "description":      "Bridge",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127777,
        "challengeName":    "Water Under the Bridge",
        "raChallengeID":    509516,
        "challengeDesc":    "Without dying, collect 4 hearts in no more than 1 world rotation, then complete chapter 8.",
        "deathless":        true,
        "heartsCollected":  true,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x00000006,
        "nextID":           0x00000013,
        "name":             "chapter 9",
        "nameTitle":        "Chapter 9",
        "raID":             509529,
        "raIcon":           "579171",
        "raChallengeIcon":  "579172",
        "description":      "Islands",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127778,
        "challengeName":    "Island Hopping",
        "raChallengeID":    509530,
        "challengeDesc":    "Collect 5 hearts in no more than 4 double jumps, then complete chapter 9.",
        "heartsCollected":  true,
        "limitDoubleJumps": 4,
        "type":             "progression"
    },
    {
        "id":               0x00000013,
        "nextID":           0x0000000b,
        "name":             "chapter 10",
        "nameTitle":        "Chapter 10",
        "raID":             509531,
        "raIcon":           "579173",
        "raChallengeIcon":  "579174",
        "description":      "Serpentine",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "timeTrialSeconds": 20,
        "hasLeaderboard":   true,
        "leaderboardID":    127779,
        "challengeName":    "Zig Zag",
        "raChallengeID":    509532,
        "challengeDesc":    "Collect 7 hearts and complete chapter 10 in under 20 seconds.",
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x0000000b,
        "nextID":           0x00000007,
        "name":             "chapter 11",
        "nameTitle":        "Chapter 11",
        "raID":             509533,
        "raIcon":           "579175",
        "raChallengeIcon":  "579176",
        "description":      "Flying Rocks",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127780,
        "challengeName":    "Rock of Terror",
        "raChallengeID":    509534,
        "challengeDesc":    "Without dying, collect 8 hearts in no more than 6 world rotations, then complete chapter 11.",
        "deathless":        true,
        "heartsCollected":  true,
        "worldRotations":   6,
        "type":             "progression"
    },
    {
        "id":               0x00000007,
        "nextID":           0x0000000c,
        "name":             "chapter 12",
        "nameTitle":        "Chapter 12",
        "raID":             509535,
        "raIcon":           "579177",
        "raChallengeIcon":  "579178",
        "description":      "Little Fern Track",
        "hearts":           12,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127781,
        "challengeName":    "Glowing Fern",
        "raChallengeID":    509536,
        "challengeDesc":    "Without dying, collect 12 hearts in no more than 3 double jumps, then complete chapter 12.",
        "deathless":        true,
        "heartsCollected":  true,
        "limitDoubleJumps": 3,
        "type":             "progression"
    },
    {
        "id":               0x0000000c,
        "nextID":           0x0000000d,
        "name":             "chapter 13",
        "nameTitle":        "Chapter 13",
        "raID":             509537,
        "raIcon":           "579179",
        "raChallengeIcon":  "579180",
        "description":      "Sky and Cave",
        "hearts":           2,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127782,
        "challengeName":    "Descent Into Bat Kings Cave",
        "raChallengeID":    509538,
        "challengeDesc":    "Collect 2 hearts in no more than 3 world rotations, then complete chapter 13.",
        "heartsCollected":  true,
        "worldRotations":   3,
        "type":             "progression"
    },
    {
        "id":               0x0000000d,
        "nextID":           0x0000000e,
        "name":             "chapter 14",
        "nameTitle":        "Chapter 14",
        "raID":             509539,
        "raIcon":           "579181",
        "raChallengeIcon":  "579182",
        "description":      "Fall",
        "hearts":           53,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127783,
        "challengeName":    "Falling in Love",
        "raChallengeID":    509540,
        "challengeDesc":    "Without dying, collect 53 hearts, then complete chapter 14.",
        "deathless":        true,
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x0000000e,
        "nextID":           0x0000000f,
        "name":             "chapter 15",
        "nameTitle":        "Chapter 15",
        "raID":             509541,
        "raIcon":           "579183",
        "raChallengeIcon":  "579184",
        "description":      "Bat King",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      true,
        "hasLeaderboard":   true,
        "leaderboardID":    127784,
        "challengeName":    "Beady Eyed",
        "raChallengeID":    509542,
        "challengeDesc":    "Without dying, collect 4 hearts in no more than 6 jumps, then complete chapter 15.",
        "deathless":        true,
        "heartsCollected":  true,
        "limitJumps":       6,
        "type":             "progression"
    },
    {
        "id":               0x0000000f,
        "nextID":           0x00000010,
        "name":             "chapter 16",
        "nameTitle":        "Chapter 16",
        "raID":             509543,
        "raIcon":           "579185",
        "raChallengeIcon":  "579186",
        "description":      "Secret Passage",
        "hearts":           3,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      true,
        "timeTrialSeconds": 45,
        "hasLeaderboard":   true,
        "leaderboardID":    127785,
        "challengeName":    "I Sense a Connection",
        "raChallengeID":    509544,
        "challengeDesc":    "Collect 3 hearts and complete chapter 16 in under 45 seconds.",
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x00000010,
        "nextID":           0x00000012,
        "name":             "chapter 17",
        "nameTitle":        "Chapter 17",
        "raID":             509545,
        "raIcon":           "579187",
        "raChallengeIcon":  "579188",
        "description":      "Delicious Spores",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127786,
        "challengeName":    "Strange Pollen",
        "raChallengeID":    509546,
        "challengeDesc":    "Complete chapter 17 in no more than 7 jumps.",
        "limitJumps":       7,
        "type":             "progression"
    },
    {
        "id":               0x00000012,
        "nextID":           0x00000001,
        "name":             "chapter 18",
        "nameTitle":        "Chapter 18",
        "raID":             509547,
        "raIcon":           "579189",
        "raChallengeIcon":  "579190",
        "description":      "Beneath the Roots",
        "hearts":           8,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127787,
        "challengeName":    "Individual Tasks",
        "raChallengeID":    509548,
        "challengeDesc":    "Without dying, collect 8 hearts, then complete chapter 18.",
        "deathless":        true,
        "heartsCollected":  true,
        "type":             "progression"
    },
    {
        "id":               0x00000001,
        "nextID":           0x00000002,
        "name":             "chapter 19",
        "nameTitle":        "Chapter 19",
        "raID":             509549,
        "raIcon":           "579191",
        "raChallengeIcon":  "579192",
        "description":      "Gates of Hades",
        "hearts":           5,
        "brownPowerUp":     false,
        "orangePowerUp":    false,
        "grayPowerUp":      true,
        "hasLeaderboard":   true,
        "leaderboardID":    127788,
        "challengeName":    "Cerberus",
        "raChallengeID":    509550,
        "challengeDesc":    "Without dying and both Brown and Orange inside the end tree, use Gray to collect 5 hearts, then complete chapter 19.",
        "deathless":        true,
        "characterCollect": {
            "character": "gray",
            "hearts":    5
        },
        "type":             "progression"
    },
    {
        "id":               0x00000002,
        "nextID":           0x00000014,
        "name":             "chapter 20",
        "nameTitle":        "Chapter 20",
        "raID":             509551,
        "raIcon":           "579193",
        "raChallengeIcon":  "579194",
        "description":      "Chasm",
        "hearts":           4,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127789,
        "challengeName":    "Take Aim",
        "raChallengeID":    509552,
        "challengeDesc":    "Without dying, or double jumping as Antler Ancestor collect 4 hearts, then complete chapter 20.",
        "deathless":        true,
        "heartsCollected":  true,
        "limitDoubleJumps": 0,
        "type":             "progression"
    },
    {
        "id":               0x00000014,
        "nextID":           0x00000015,
        "name":             "chapter 21",
        "nameTitle":        "Chapter 21",
        "raID":             509553,
        "raIcon":           "579195",
        "raChallengeIcon":  "579196",
        "description":      "Crystal Caves",
        "hearts":           4,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      true,
        "hasLeaderboard":   true,
        "leaderboardID":    127790,
        "challengeName":    "Climb the Ladder",
        "raChallengeID":    509554,
        "challengeDesc":    "Without dying and in no more than 2 world rotations complete chapter 21.",
        "deathless":        true,
        "worldRotations":   2,
        "type":             "progression"
    },
    {
        "id":               0x00000015,
        "nextID":           0x0000001d,
        "name":             "chapter 22",
        "nameTitle":        "Chapter 22",
        "raID":             509555,
        "raIcon":           "579197",
        "raChallengeIcon":  "579198",
        "description":      "Labyrinth",
        "hearts":           8,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "timeTrialSeconds": 40,
        "hasLeaderboard":   true,
        "leaderboardID":    127791,
        "challengeName":    "Steady Jumps",
        "raChallengeID":    509556,
        "challengeDesc":    "Complete chapter 22 in under 40 seconds.",
        "type":             "progression"
    },
    {
        "id":               0x0000001d,
        "nextID":           0x00000017,
        "name":             "chapter 23",
        "nameTitle":        "Chapter 23",
        "raID":             509557,
        "raIcon":           "579199",
        "raChallengeIcon":  "579200",
        "description":      "Rock Pool",
        "hearts":           7,
        "brownPowerUp":     false,
        "orangePowerUp":    true,
        "grayPowerUp":      true,
        "hasLeaderboard":   true,
        "leaderboardID":    127792,
        "challengeName":    "It Takes Two",
        "raChallengeID":    509558,
        "challengeDesc":    "Without dying and in no more than 6 world rotations complete chapter 23.",
        "deathless":        true,
        "worldRotations":   6,
        "type":             "progression"
    },
    {
        "id":               0x00000017,
        "nextID":           CHAPTER25,
        "name":             "chapter 24",
        "nameTitle":        "Chapter 24",
        "raID":             509559,
        "raIcon":           "579201",
        "raChallengeIcon":  "579202",
        "description":      "Old Willow Tree",
        "hearts":           5,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127793,
        "challengeName":    "Trust Your Family",
        "raChallengeID":    509560,
        "challengeDesc":    "Without dying and with both Brown and Gray inside the end tree, use Orange to collect five hearts, then complete chapter 24.",
        "deathless":        true,
        "characterCollect": {
            "character": "orange",
            "hearts":    5
        },
        "type":             "progression"
    },
    {
        "id":               CHAPTER25,
        "nextID":           0x00000019,
        "name":             "chapter 25",
        "nameTitle":        "Chapter 25",
        "raID":             509561,
        "raIcon":           "579203",
        "raChallengeIcon":  "579204",
        "description":      "Fortress",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    true,
        "grayPowerUp":      true,
        "hasLeaderboard":   true,
        "leaderboardID":    127794,
        "challengeName":    "We Are Coming, Mother!",
        "raChallengeID":    509562,
        "challengeDesc":    "Complete chapter 25 in no more than 7 double jumps and 1 world rotation.",
        "limitDoubleJumps": 7,
        "worldRotations":   1,
        "type":             "progression"
    },
    {
        "id":               0x00000019,
        "nextID":           0x0000001a,
        "name":             "chapter 26",
        "nameTitle":        "Chapter 26",
        "raID":             509563,
        "raIcon":           "579205",
        "description":      "Family Trees",
        "hearts":           1,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127795,
        "challengeName":    "",
        "type":             "progression"
    },
    {
        "id":               0x0000001a,
        "nextID":           END,
        "name":             "the end credits",
        "nameTitle":        "The End Credits",
        "raID":             509564,
        "raIcon":           "579206",
        "description":      "Here Is My Heart!",
        "hearts":           7,
        "brownPowerUp":     true,
        "orangePowerUp":    false,
        "grayPowerUp":      false,
        "hasLeaderboard":   true,
        "leaderboardID":    127796,
        "challengeName":    "",
        "type":             "win_condition"
    }
]

// Detects if any character is jumping
//
// `hasBrownPowerUp`, `hasOrangePowerUp` and `hasGrayPowerUp` are booleans to signal if each of the characters have a powerup in that level.
function CharacterJumps( hasBrownPowerUp, hasOrangePowerUp, hasGrayPowerUp ) {
    conditions = [
        ( prev( BrownState() ) != 0x00000002 && BrownState() == 0x00000002 ),
        ( prev( OrangeState() ) != 0x00000002 && OrangeState() == 0x00000002 ),
        ( prev( GrayState() ) != 0x00000002 && GrayState() == 0x00000002 )
    ]
    if( hasBrownPowerUp ) {
        array_push( conditions, ( prev( BrownPoweredUpState() ) != 0x00000002 && BrownPoweredUpState() == 0x00000002 ) )
    }
    if( hasOrangePowerUp ) {
        array_push( conditions, ( prev( OrangePoweredUpState() ) != 0x00000002 && OrangePoweredUpState() == 0x00000002 ) )
    }
    if( hasGrayPowerUp ) {
        array_push( conditions, ( prev( GrayPoweredUpState() ) != 0x00000002 && GrayPoweredUpState() == 0x00000002 ) )
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
function CompleteChapter( isChallenge, chapter ) {
    brownDone = prev( BrownState() ) == 0x00000007
    orangeDone = prev( OrangeState() ) == 0x00000007
    if( chapter["orangePowerUp"] ) {
        orangeDone = orangeDone || prev( OrangePoweredUpState() ) == 0x00000007
    }
    grayDone = prev( GrayState() ) == 0x00000007
    if( chapter["grayPowerUp"] ) {
        grayDone = grayDone || prev( GrayPoweredUpState() ) == 0x00000007 || prev( GrayPoweredUpState() ) == 0x00000006 // Special Case: Quickly entering end tree with gray powered up only animates to 0x06
    }
    done = ( ( brownDone ) && ( orangeDone ) && ( grayDone ) )
    if( chapter["brownPowerUp"] ) {
        done = done || prev( BrownPoweredUpState() ) == 0x00000007
    }
    if( chapter["id"] == CHAPTER25 ) { // Special case: we dont care about orange on chapter 25 because it can finish in any state and brown powered up will never have gray as a firefly
        done = ( brownDone || prev( BrownPoweredUpState() ) == 0x00000007 ) && ( grayDone )
    }
    conds = ( done ) && ( prev( Chapter() ) == chapter["id"] && Chapter() == chapter["nextID"] )
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
// `hearts` is the number of hearts to collect using `character`. `character` can only be `brown`, `orange`, or `gray` otherwise it will jusut detect number of hearts collected by anyone.
//
// `hasBrownPowerUp`, `hasOrangePowerUp` and `hasGrayPowerUp` are booleans to signal if each of the characters have a powerup in that level.
function CollectHeartsUsingCharacter( hearts, character, hasBrownPowerUp, hasOrangePowerUp, hasGrayPowerUp ) {
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
        if hasGrayPowerUp {
            base = base && GrayState() >= 0x00000007 && GrayState() <= 0x00000008 && GrayPoweredUpState() >= 0x00000007 && GrayPoweredUpState() <= 0x00000008
        } else {
            base = base && GrayState() == 0x00000007
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
        if hasGrayPowerUp {
            base = base && GrayState() >= 0x00000007 && GrayState() <= 0x00000008 && GrayPoweredUpState() >= 0x00000007 && GrayPoweredUpState() <= 0x00000008
        } else {
            base = base && GrayState() == 0x00000007
        }
    }

    if character == "gray" {
        base = base && GrayState() != 0x00000007
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
        if hasGrayPowerUp {
            base = base && GrayPoweredUpState() != 0x00000007
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
chapters = {}
totalHearts = 0
for index in range( 1, length( chapterConfigs ) ) {
    chapter = chapterConfigs[index - 1]
    if( index != 1 ) { // Count total stars available minus chapter 1 (tutorial)
        totalHearts = totalHearts + chapter["hearts"] // Only 171 hearts https://gamefaqs.gamespot.com/boards/649587-where-is-my-heart/64934662
    }
    chapters[chapter["id"]] = chapter["name"]
    progression = {
        "id":    chapter["raID"],
        "title": chapter["description"],
        "description": format("Complete {0}.", chapter["name"]),
        "points": 5,
        "trigger": CompleteChapter( false, chapter ),
        "type": chapter["type"],
        "badge": chapter["raIcon"]
    }
    array_push( achievements, progression )

    if( chapter["challengeName"] != "" ) {
        challengeTrigger = once( Chapter() == chapter["id"] && InGame() )
        if( dictionary_contains_key( chapter, "timeTrialSeconds" ) ) {
            challengeTrigger = prev( Chapter() ) == chapter["id"] && InGame() && CurrentChapterTimer() < InMilliseconds( chapter["timeTrialSeconds"] )
        }
        if( dictionary_contains_key( chapter, "deathless" ) ) {
            challengeTrigger = challengeTrigger && DarkHeartsCollected() == 0
        }
        if( dictionary_contains_key( chapter, "characterCollect" ) ) {
            collectionDetails = chapter["characterCollect"]
            challengeTrigger = challengeTrigger && CollectHeartsUsingCharacter( collectionDetails["hearts"], collectionDetails["character"], chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["grayPowerUp"] )
        }
        if( dictionary_contains_key( chapter, "heartsCollected" ) ) {
            challengeTrigger = challengeTrigger && HeartsCollected() == chapter["hearts"]
        }
        challengeTrigger = challengeTrigger && CompleteChapter( true, chapter )
        if( dictionary_contains_key( chapter, "limitJumps" ) ) {
            challengeTrigger = challengeTrigger &&
            disable_when(
                tally(
                    chapter["limitJumps"] + 1,
                    CharacterJumps( chapter["brownPowerUp"], chapter["orangePowerUp"], chapter["grayPowerUp"] )
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
        if( !dictionary_contains_key( chapter, "timeTrialSeconds" ) ) {
            challengeTrigger = challengeTrigger && ( // add global hit resets for all challenges except time trials
                always_false() ||
                never( GameReset() )
            )
        }
        challenge = {
            "id":    chapter["raChallengeID"],
            "title": chapter["challengeName"],
            "description": chapter["challengeDesc"],
            "points": 10,
            "trigger":  challengeTrigger,
            "type": "missable",
            "badge": chapter["raChallengeIcon"]
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
            "title":           format("Speedrun {0}", chapter["nameTitle"]),
            "description":     format("Finish {0} as fast as possible.", chapter["name"]),
            "value":           CurrentChapterTimer() / 0x0a,
            "format":          "MILLISECS",
            "lower_is_better": true
        }
        if( dictionary_contains_key( chapter, "timeTrialSeconds" ) ) {
            l["start"] = GameReset() && Chapter() == chapter["id"]
            l["cancel"] = GameReset() && Chapter() != chapter["id"]
            l["submit"] = CompleteChapter( false, chapter )
        } else {
            l["start"] = CompleteChapter( false, chapter )
            l["cancel"] = always_false()
            l["submit"] = always_true()
        }
        array_push( leaderboards, l )
    }
}

singular_lookup = {
    1: ""
}

rich_presence_conditional_display(
    InGame(),
    "Score {0}/{1} • Playing {2} • {3}/{4} heart{5} collected • {6} death{7}",
    rich_presence_value( "Number", Score(), "VALUE" ),
    rich_presence_value( "Number", totalHearts, "VALUE" ),
    rich_presence_lookup( "Chapter", Chapter(), chapters ),
    rich_presence_value( "Number", HeartsCollected(), "VALUE" ),
    rich_presence_value( "Number", AvailableHearts(), "VALUE" ),
    rich_presence_lookup( "Case", AvailableHearts(), singular_lookup, "s" ),
    rich_presence_value( "Number", DarkHeartsCollected(), "VALUE" ),
    rich_presence_lookup( "Case", DarkHeartsCollected(), singular_lookup, "s" )
)

rich_presence_display( "Main menu" )

for index in range( 0, length( achievements ) - 1 ) {
    a = achievements[index]
    achievement(
        id          = a["id"],
        title       = a["title"],
        description = a["description"],
        points      = a["points"],
        trigger     = a["trigger"],
        type        = a["type"],
        badge       = a["badge"]
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