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
int new_position(int current_position, int key, int quantity_itmes);

void window(int iterim_left, int iterim_top, int iterim_width, \
	int iterim_hight);
void gotoxy(int x, int y);

//window_parameters
int 
	window_top = 0,
	window_right = 0,
	window_bottom = 0,
	window_left = 0,
	window_hight = 0,
	window_width = 0;

bool
	flag_new_position = true;


int main() {

	show_title(lab_4);

	int
		main_selected_item = 0,
		main_key,
		main_quantity_items = 5;

	cursorof();

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
		//cout << '*';

		main_key = getkey();

		main_selected_item = new_position(main_selected_item, \
			main_key, main_quantity_items);
	}

	return 0;
}


void display_main_menu(int main_selected_item) {

	gotoxy(1, 1);
	(main_selected_item == 0) ? cout << ">>" : cout << "  ";
	cout << "Enter the array  ";

	gotoxy(1, 2);
	(main_selected_item == 1) ? cout << ">>" : cout << "  ";
	cout << "Print array  ";

	gotoxy(1, 3);
	(main_selected_item == 2) ? cout << ">>" : cout << "  ";
	cout << "Sorting array  ";

	gotoxy(1, 4);
	(main_selected_item == 3) ? cout << ">>" : cout << "  ";
	cout << "Array processing  ";

	gotoxy(1, 6);
	(main_selected_item == 4) ? cout << ">>" : cout << "  ";
	cout << "Exit  ";
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

	flag_new_position = false;

	int copy_current_position = current_position;

	switch (key) {

		case 65:
			(current_position == 0) ? current_position = quantity_itmes - 1 : \
				current_position -= 1;
			flag_new_position = true;
			break;

		case 66:
			current_position += 1;
			current_position %= quantity_itmes;
			flag_new_position = true;
			break;
			
		case 49:
		case 50:
		case 51:
		case 52:
		case 53:
			current_position = key - 49;
			flag_new_position = true;
			break;
	}

	if (copy_current_position == current_position)
		flag_new_position = false;

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