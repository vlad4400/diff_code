/*date: 2016.12.22
 *author: Vladislav Mambetov
 */

#include <stdio.h> //printf();
#include <termios.h> //struct termios;
#include <unistd.h> //tcgetattr(), tcsetattr();
#include <iostream> //cout;

#define show_title(lab_6) printf("\e]0;Laboratory work 6\007")
#define cursorof() printf("\e[?25l")
#define cursoron() printf("\e[?25h")
#define clrscr() printf("\e[1;1H\e[2J")
#define pause() getkey()

using namespace std;

//for main menu
void run_menu_sel_item(int menu_sel_item);

//for edit
int getkey();
void gotoxy(int x, int y);

//for main menu
void display_main_menu(int menu_selected_item);
void change_pos_sel_item(int &sel_item, int key, int quantity_items);


int main() {

	show_title(lab_6);
	cursorof();
	clrscr();

	int
		menu_selected_item = 0,
		menu_key,
		menu_quantity_items = 7;

	while (true) {

		gotoxy(1, 1);
		display_main_menu(menu_selected_item);

		menu_key = getkey();

		if (menu_key == 10) {

			if (menu_selected_item == menu_quantity_items - 1) {

				clrscr();
				cursoron();
				return 0;
			}

			run_menu_sel_item(menu_selected_item);
		}

		change_pos_sel_item(menu_selected_item, menu_key, menu_quantity_items);
	}

	return -1; //error
}


void run_menu_sel_item(int menu_sel_item) {

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

void gotoxy(int x, int y) {
	
	printf("\e[%i;%iH", y, x);
}

void display_main_menu(int main_selected_item) {

	cout << main_selected_item;
}

void change_pos_sel_item(int &sel_item, int key, int quantity_items) {

	switch (key) {

		case 65:
		case 53:
			(sel_item == 0) ? sel_item = quantity_items - 1 : sel_item -= 1;
			break;

		case 66:
		case 54:
			sel_item += 1;
			sel_item %= quantity_items;
			break;
	}
}