#include <windows.h> //HANDLE
#include <iostream> //cout
#include <stdio.h> //getchar()

#define FILE "file1.txt"

using namespace std;

int main()
{
	char ch; //char that we get from user;
	HANDLE hFile; //pointer to open file
	bool bChar; //if we read char from file
	char cChar; //char that we read from file
	DWORD nBytesRead = 1; //set the number of bits to read
	int count = 0;
	

	hFile = CreateFile(FILE, GENERIC_READ, NULL, NULL, OPEN_ALWAYS, NULL, NULL); //open file

	cout << "Enter the char: ";
	ch = getchar();
	cout << "\n";
	cout << "Contents of the file:\n\n";


	do {
		bChar = ReadFile(hFile, &cChar, nBytesRead, &nBytesRead, NULL);
		cout << cChar;
		if (ch == cChar)
			count++;
	} while (nBytesRead);

	cout << "\n\nThe number of such characters in the file of: " << count << "\n";


	cout << "\nHere end...";
	//getchar(); //pause --don't work
	while (true) {} //pause
}
