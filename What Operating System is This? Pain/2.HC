#include <templeos.h>

VOID HolyC_MakeThingsExplode()
{
    INT explosionCount = 0;
    while (explosionCount < 100)
    {
        ClearScreen();
        for (INT i = 0; i < GetScreenWidth(); i++)
        {
            for (INT j = 0; j < GetScreenHeight(); j++)
            {
                DrawPixel(i, j, GetRandomColor());
            }
        }
        explosionCount++;
    }
}

VOID HolyC_SpreadChaos()
{
    while (TRUE)
    {
        PlayRandomSound();
        MakeThingsExplode();
        ScrambleKeyboardInput();
        DisplayRandomGarbageOnScreen();
    }
}

VOID HolyC_Execute()
{
    HolyC_SpreadChaos();
}

VOID _start()
{
    HolyC_Execute();
}
