#include <templeos.h>

VOID HolyC_CreateChaos()
{
    // Fill the screen with random characters
    for (INT row = 0; row < GetScreenHeight(); row++)
    {
        for (INT col = 0; col < GetScreenWidth(); col++)
        {
            SetChar(col, row, GetRandomChar());
        }
    }

    // Trigger an infinite loop of flashing colors
    while (TRUE)
    {
        for (INT i = 0; i < 16; i++)
        {
            SetColor(i);
            ClearScreen();
            Wait(10);
        }
    }
}

VOID HolyC_Execute()
{
    HolyC_CreateChaos();
}

VOID _start()
{
    HolyC_Execute();
}
