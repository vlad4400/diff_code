#include <stdio.h> //printf();
#include <iostream> //cout();
#include <termios.h> //struct termios;
#include <unistd.h> //tcgetattr(), tcsetattr();

#define clrscr() printf("\e[1;1H\e[2J") //cursor to pos.1,1; clear screan;
#define cursorof() printf("\e[?25l")
#define cursoron() printf("\e[?25h")
#define show_title(lab_4) printf("\e]0;Laboratory work 4\007")


using namespace std;

void display_main_menu(int main_selected_item);

int getkey();
int main_menu_new_position(int current_position, int key, int quantity_itmes);

void window(int iterim_left, int iterim_top, int iterim_width, \
	int iterim_hight); //80x24
void gotoxy(int x, int y);
void set_text_color(int color);
void set_background_color(int color);

//window_parameters
int 
	window_top = 0,
	window_right = 0,
	window_bottom = 0,
	window_left = 0,
	window_hight = 0,
	window_width = 0;

bool
	flag_new_position = true,
	flag_exec = false;

int 
	previos_character,
	previos_position_item;

int main() {

	show_title(lab_4);

	int
		main_selected_item = 0,
		main_key,
		main_quantity_items = 5;

	cursorof();
	/*
	for (int i = 0; i < 9; i++) {

		set_background_color(i);
		clrscr();
		getkey();
	}
	*/
	/*
	for (int i = 0; i < 16; i++) {

		set_text_color(i);
		cout << "00000000000000000000000000000000000000000000000000";
		getkey();
	}
	*/
	/*
	for (int i = 0; i < 16; i++) {

		printf("\e[0%im", i);
		cout << "00000000000000000000000000000000000000000000000000";
		getkey();
	}
	*/
	//printf("\e[01m");
	clrscr();

	while (true) {

		window(2, 2, 15, 60);
		if (flag_new_position)
			display_main_menu(main_selected_item);
		window(0, 0, 0, 0);

		/*
		cout 
			<< main_key
			<< ' '
			<< main_selected_item
			<< '\n';
		*/

		main_key = getkey();

		if (main_key == 10) {
			switch (main_selected_item) {

				case 0:
					break;

				case 1:
					break;

				case 2:
					break;

				case 3:
					break;

				case 4:
					clrscr();
					cursoron();
					return 0;
			}
		}

		main_selected_item = main_menu_new_position(main_selected_item, \
			main_key, main_quantity_items);
	}

	return -1;
}


void display_main_menu(int main_selected_item) {

	gotoxy(1, 1);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Enter the array";

	gotoxy(1, 2);
	(main_selected_item == 1) ? set_text_color(3) : set_text_color(5);
	cout << "Print array";

	gotoxy(1, 3);
	(main_selected_item == 2) ? set_text_color(3) : set_text_color(5);
	cout << "Sorting array";

	gotoxy(1, 4);
	(main_selected_item == 3) ? set_text_color(3) : set_text_color(5);
	cout << "Array processing";

	gotoxy(1, 6);
	(main_selected_item == 4) ? set_text_color(3) : set_text_color(5);
	cout << "Exit";
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

int main_menu_new_position(int current_position, int key, \
	int quantity_itmes) {

	flag_new_position = false;

	if (flag_exec) {

		switch (key) {

			case 65:
			case 53:
				(current_position == 0) ? current_position = \
					quantity_itmes - 1 : current_position -= 1;
				break;

			case 66:
			case 54:
				current_position += 1;
				current_position %= quantity_itmes;
				break;
		}

		flag_new_position = true;
	}

	if (previos_character != 91 && 49 <= key && key <= 53) {

		(key - 49 == current_position) ? : flag_new_position = true;

		current_position = key - 49;
	}

	if (previos_character == 27 && key == 91) {

		current_position = previos_position_item;
		flag_exec = true;

	} else {

		flag_exec = false;
	}

	previos_character = key;
	previos_position_item = current_position;

	if (key == 27) {

		current_position = quantity_itmes - 1;
		flag_new_position = true;
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

void gotoxy(int x, int y) {
	
	printf("\e[%i;%iH", window_top + y, window_left + x);
}

void set_text_color(int color){

	printf("\e[3%im", color);
}

void set_background_color(int color) {

	printf("\e[4%im", color);
}