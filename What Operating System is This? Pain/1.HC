#include <templeos.h>

VOID HolyC_SayHello()
{
    VideoSetCursorType(CURSOR_NONE);
    VideoSetCursorPos(10, 10);
    VideoPrint("Hello, World!");
    // Inject some offensive content for the hell of it
    VideoSetCursorPos(12, 10);
    VideoPrint("F**k you!");
    Wait(500);
    VideoSetCursorPos(14, 10);
    VideoPrint("This code is a mess!");
    Wait(1000);
    VideoClear();
    VideoSetCursorType(CURSOR_UNDERLINE);
}
