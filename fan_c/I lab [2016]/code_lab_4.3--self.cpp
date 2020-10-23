#include <stdio.h>
#include <iostream>
#include <termios.h>
#include <unistd.h>

#define clrscr() printf("\e[1;1H\e[2J") //cursor to pos.1,1; clear screan;
#define cursorof() printf("\e[?25l")
#define cursoron() printf("\e[?25h")
#define show_title(lab_4) printf("\e]0;Laboratory work N4\007")


using namespace std;


void display_main_menu(int main_selected_item);
int getkey();
int new_position(int current_position, int key, int quantity_itmes);
void window(int iterim_left, int iterim_top, int iterim_width, \
	int iterim_hight);

//window_parameters
int window_top = 0;
int window_right = 0;
int window_bottom = 0;
int window_left = 0;
int window_hight = 0;
int window_width = 0;


int main() {

	show_title(lab_4);

	int
		main_selected_item = 0,
		main_key,
		main_quantity_items = 5;

	//cursorof();

	while (true) {

		clrscr();
		window(5, 2, 15, 60);
		display_main_menu(main_selected_item);
		window(0, 0, 0, 0);

		/*
		cout 
			<< main_key
			<< " "
			<< main_selected_item;
		*/
		
		main_key = getkey();

		main_selected_item = new_position(main_selected_item, \
			main_key, main_quantity_items);
	}

	return 0;
}

void display_main_menu(int main_selected_item) {

	cout << string(window_top, '\n');

	cout << string(window_left, ' ');
	(main_selected_item == 0) ? cout << ">>" : cout << "  ";
	cout << "Enter the array" << '\n';

	cout << string(window_left, ' ');
	(main_selected_item == 1) ? cout << ">>" : cout << "  ";
	cout << "Print array" << '\n';

	cout << string(window_left, ' ');
	(main_selected_item == 2) ? cout << ">>" : cout << "  ";
	cout << "Sorting array" << '\n';

	cout << string(window_left, ' ');
	(main_selected_item == 3) ? cout << ">>" : cout << "  ";
	cout << "Array processing" << '\n';
	cout << '\n';

	cout << string(window_left, ' ');
	(main_selected_item == 4) ? cout << ">>" : cout << "  ";
	cout << "Exit" << '\n';
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

void window(int iterim_left, int iterim_top, int iterim_width, \
	int iterim_hight) {

	window_top = iterim_top;
	window_left = iterim_left;
	window_width = iterim_width;
	window_hight = iterim_hight;
}
