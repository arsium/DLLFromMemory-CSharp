// dllmain.cpp : Définit le point d'entrée de l'application DLL.
#include "pch.h"
/*
    |     Original Author : Arsium
*/
BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        MessageBoxA(NULL, "Hello World!", "Dll says:", MB_OK);
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}
extern "C"
{
    __declspec(dllexport) int AddInteger(int a, int b)
    { 
        return a + b;   
    }
        
}
