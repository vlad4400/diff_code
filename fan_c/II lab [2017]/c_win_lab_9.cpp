#ifndef UNICODE
#define UNICODE
#endif 

#define ID_MYBUTTON 1    /* идентификатор для кнопочки внутри главного окна */

#include <windows.h>
#include <iostream>

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);

HWND global_hwnd;

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE, PWSTR pCmdLine, int nCmdShow)
{
	/*Register the window class.*/
	const wchar_t CLASS_NAME[] = L"Sample Window Class";

	WNDCLASS wc = {};

	wc.lpfnWndProc = WindowProc;
	wc.hInstance = hInstance;
	wc.lpszClassName = CLASS_NAME;

	RegisterClass(&wc);

	// Create the window.

	HWND hwnd = CreateWindowEx(
		0,                              // Optional window styles.
		CLASS_NAME,                     // Window class
		L"Window 1",    // Window text
		WS_OVERLAPPEDWINDOW,            // Window style

										// Size and position
		CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,

		NULL,       // Parent window    
		NULL,       // Menu
		hInstance,  // Instance handle
		NULL		// Additional application data
	);

	if (hwnd == NULL)
	{
		std::cout << "Error of create window";
		return 0;
	}

	HWND hwnd2 = CreateWindowEx(
		0,                              // Optional window styles.
		CLASS_NAME,                     // Window class
		L"Window 2",    // Window text
		WS_OVERLAPPEDWINDOW,            // Window style

										// Size and position
		CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,

		NULL,       // Parent window    
		NULL,       // Menu
		hInstance,  // Instance handle
		NULL		// Additional application data
	);

	ShowWindow(hwnd, nCmdShow);
	ShowWindow(hwnd2, nCmdShow);

	global_hwnd = hwnd;

	//SendMessage(hwnd, WM_ACTIVATE, TRUE, NULL);

	/*Run the message loop.*/
	MSG msg = {};

	while (GetMessage(&msg, NULL, 0, 0))
	{
		TranslateMessage(&msg); //message processing
		DispatchMessage(&msg); //apply an action
	}
	
	return 0;
}

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{

	switch (uMsg)
	{
	case WM_CREATE:
		CreateWindow(L"button", L"My button", WS_CHILD | BS_PUSHBUTTON | WS_VISIBLE,
			5, 5, 100, 20, hwnd, (HMENU)ID_MYBUTTON, NULL, NULL);
		return 0;

	case WM_COMMAND:
		if ((HIWORD(wParam) == 0) && (LOWORD(wParam) == ID_MYBUTTON))
			SendMessage(global_hwnd, WM_ACTIVATE, TRUE, NULL);
			//MessageBox(hwnd, L"You pressed my button", L"MessageBox", MB_OK | MB_ICONWARNING);
		return 0;

	case WM_DESTROY:
		//PostQuitMessage(0);
		return 0;

	case WM_PAINT:
	{
		PAINTSTRUCT ps;
		HDC hdc = BeginPaint(hwnd, &ps);

		FillRect(hdc, &ps.rcPaint, (HBRUSH)(COLOR_WINDOW + 1));

		EndPaint(hwnd, &ps);

		return 0;
	}

	
	return 0;

	}


	return DefWindowProc(hwnd, uMsg, wParam, lParam);
}