#include <stdio.h>
//#include <cstring>
#include <iostream>

//#include <conio.h>

//#include <bios.h >
//#include <conio.h>
//#include < process.h>
//#include < dos s.h>

//#include <ncurses>

#include <termios.h>
#include <unistd.h>

//#include <panel.h>


using namespace std;

int display_main_menu();
int clrscr();
int getkey();


int main() {

	//cout << string(100, '\10');

	//printf("\e[0d");
	//printf("\e[1;1H");
	//printf("\e[2J");
	//printf("\a");

	//printf("\077");
	//printf("\033]P5rrggbb");
	//printf("\033[30 чёрный цвет знаков");

	//cin.get();
	//cin.ignore(1024, '\n');

	//printf("\e[0;31;40mTEXT_COLOR");
	//printf("\033[0;39m");

	/*
	handle = GetStdHandle(STD_OUTPUT_HANDLE);
	CONSOLE_CURSOR_INFO structCursorInfo;
	GetConsoleCursorInfo(handle,&structCursorInfo);
	structCursorInfo.bVisible = false;
	SetConsoleCursorInfo( handle, &structCursorInfo );
	*/

	//printf("\e[0d");

	printf("\e]0;Laboratory work N4\007");

	int z = 0;

	while (true) {

		//printf("\e[0;31;40mTEXT_COLOR");
		//printf("e[?9h");

		//clrscr();
		printf("\e[1;1H\e[2J");  //курсор на поз.1,1; clear screan;

		display_main_menu();

		printf("\e[?25l");

		//fputs("\e[?25l", stdout); //cursor off
		//fputs("\e[?25h", stdout); //cursor on
		//fgets(s, 80, stdin);

		//cout << z;
		z = getkey();
	}

	return 0;
}

int display_main_menu() {

	cout << "Enter the array" << '\n';
	cout << "Print array" << '\n';
	cout << "Sorting array" << '\n';
	cout << "Array processing" << '\n';
	cout << '\n';
	cout << "Exit" << '\n';

	return 1;
}

int clrscr() {

	int q = 50; //--!!!

	for (int i = 0; i < q; i++) {
		cout << '\n';
	}

	printf("\e[1;1H");

	return 1;
}

int getkey() {

	struct termios 
		oldt, 
		newt;
	
	int key;

	tcgetattr( STDIN_FILENO, &oldt );
	newt = oldt;
	newt.c_lflag &= ~( ICANON | ECHO );
	tcsetattr( STDIN_FILENO, TCSANOW, &newt);

	key = getchar();

	tcsetattr( STDIN_FILENO, TCSANOW, &oldt);

	return key;
}