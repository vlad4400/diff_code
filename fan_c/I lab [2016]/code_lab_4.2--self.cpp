#include <stdio.h>
#include <iostream>
#include <termios.h>
#include <unistd.h>

#define clrscr() printf("\e[1;1H\e[2J") //cursor to pos.1,1; clear screan;
#define cursorof() printf("\e[?25l")
#define cursoron() printf("\e[?25h")
#define show_title(lab_4) printf("\e]0;Laboratory work N4\007")


using namespace std;


int display_main_menu();
int getkey();
int new_position(int current_position, int key, int quantity_itmes);


int main() {

	show_title(lab_4);

	int 
		main_selected_item = 0,
		main_key,
		main_quantity_items = 5;

	while (true) {

		clrscr();

		display_main_menu();

		//cursorof();

		cout 
			<< main_key
			<< " "
			<< main_selected_item;

		main_key = getkey();

		main_selected_item = new_position(main_selected_item, \
			main_key, main_quantity_items);
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

int new_position(int current_position, int key, \
	int quantity_itmes) {

	switch (key) {

		case 65:
			(current_position == 0) ? current_position = quantity_itmes - 1 : \
				current_position -= 1;
			break;

		case 66:
			current_position += 1;
			current_position %= quantity_itmes;
			break;
	}

	return current_position;
}