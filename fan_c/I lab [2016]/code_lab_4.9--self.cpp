/*date: 2016.12.10-13
 *author: Vladislav Mambetov
 */

#include <stdio.h> //printf();
#include <iostream> //cout();
#include <termios.h> //struct termios;
#include <unistd.h> //tcgetattr(), tcsetattr();
#include <time.h> //time(NULL);
#include <stdlib.h> //rand(), srand();

#define full_clrscr() printf("\e[1;1H\e[2J") //cursor to pos.1,1; clear screan;
#define cursorof() printf("\e[?25l")
#define cursoron() printf("\e[?25h")
#define show_title(lab_4) printf("\e]0;Laboratory work 4\007")


using namespace std;

//for main_menu
void display_main_menu(int main_selected_item);
int getkey();
int main_menu_new_position(int current_position, int key, int quantity_itmes);
//for edit
void window(int iterim_left, int iterim_top, int iterim_width, \
	int iterim_hight); //80x24
void gotoxy(int x, int y);
void set_text_color(int color);
void set_background_color(int color);
void clrscr();
//0
void enter_array();
//1
int get_array();
//2
void processing_and_print_array();
//3
void sorting_array();
//4
void change_language();
void display_list_languages(int iterim_pos_list_language, \
	string iterim_list_language[]);
int list_languages_new_position(int current_position, int key, \
	int quantity_itmes);

//window parameters
int 
	window_top = 0,
	window_right = 0,
	window_bottom = 0,
	window_left = 0,
	window_hight = 0,
	window_width = 0;

//windows const
const int
	WINDOW_FULL_WIDTH = 80,
	WINDOW_FULL_HIGHT = 24;

const int
	ESC = 9;

bool
	flag_new_position = true,
	flag_exec = false;

int 
	previos_character,
	previos_position_item;

//languages
int
	INTERFACE_LANGUAGE = 0;

const int
	quantity_languages = 3;

string main_menu[quantity_languages][5] = {
	//English language -- default
	{
		"Enter the matrixs",
		"Output matrixs",
		"Sorting array",
		"Change the language",
		"Exit"
	},
	//Russian language
	{
		"Ввести массивы",
		"Вывести матрици",
		"Сортировать матрицу",
		"Изменить язык",
		"Выход"
	},
	//Ukrainian language
	{
		"Ввести матрицi",
		"Вивести матрицi",
		"Сортувати матрицю",
		"Змiнити мову",
		"Вихiд"
	}
};


int main() {

	show_title(lab_4);

	int
		main_selected_item = 0,
		main_key,
		main_quantity_items = 5;

	cursorof();
	/*
	for (int i = 0; i < 13; ++i)
	{
		full_clrscr();
	}
	*/
	window(0, 0, 0, 0);
	clrscr();

	set_text_color(0);
	gotoxy(1, 1);
	for (int u = 0; u < 80; u++) {
		cout << '*';
	}
	gotoxy(1, 24);
	for (int u = 0; u < 80; u++) {
		cout << '*';
	}

	while (true) {

		if (flag_new_position) {
			window(2, 2, 15, 60);
			display_main_menu(main_selected_item);
			window(0, 0, 0, 0);
		}

		main_key = getkey();

		if (main_key == ESC) {
			flag_new_position = true;
			main_selected_item = 5;
			main_key = 10;
		} else {
			main_selected_item = main_menu_new_position(main_selected_item, \
			main_key, main_quantity_items);
		}

		if (main_key == 10) {

			window(0, 1, 0, -1);
			clrscr();

			switch (main_selected_item) {

				case 0:
					cursoron();
					enter_array();
					cursorof();
					break;

				case 1:
					processing_and_print_array();
					break;

				case 2:
					sorting_array();
					break;

				case 3:
					window(2, 2, 20, 10);
					change_language();
					break;

				case 4:
					window(0, 0, 0, 0);
					clrscr();
					cursoron();
					return 0;
			}

			window(0, 1, 0, -1);
			clrscr();
			flag_new_position = true;
		}
	}

	return -1;
}


void display_main_menu(int main_selected_item) {

	gotoxy(1, 1);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << main_menu[INTERFACE_LANGUAGE][0];

	gotoxy(1, 2);
	(main_selected_item == 1) ? set_text_color(3) : set_text_color(5);
	cout << main_menu[INTERFACE_LANGUAGE][1];

	gotoxy(1, 3);
	(main_selected_item == 2) ? set_text_color(3) : set_text_color(5);
	cout << main_menu[INTERFACE_LANGUAGE][2];

	gotoxy(1, 4);
	(main_selected_item == 3) ? set_text_color(3) : set_text_color(5);
	cout << main_menu[INTERFACE_LANGUAGE][3];

	gotoxy(1, 6);
	(main_selected_item == 4) ? set_text_color(3) : set_text_color(5);
	cout << main_menu[INTERFACE_LANGUAGE][4];

	set_text_color(5);
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

	if (previos_character != 91 && 49 <= key && key <= 48 + quantity_itmes) {

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

void window(int iterim_left, int iterim_top, int iterim_width_or_rignt, \
	int iterim_hight_or_bottom) {

	window_top = iterim_top;
	window_left = iterim_left;

	if (iterim_width_or_rignt > 0) {
		window_width = iterim_width_or_rignt;
		window_right = WINDOW_FULL_WIDTH - iterim_width_or_rignt - iterim_left;
	} else {
		window_width = WINDOW_FULL_WIDTH + iterim_width_or_rignt - iterim_left;
		window_right = - iterim_width_or_rignt;
	}

	if (iterim_hight_or_bottom > 0) {
		window_hight = iterim_hight_or_bottom;
		window_bottom = WINDOW_FULL_HIGHT - iterim_hight_or_bottom - iterim_top;
	} else {
		window_hight = WINDOW_FULL_HIGHT + iterim_hight_or_bottom - iterim_top;
		window_bottom = - iterim_hight_or_bottom;
	}
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

void enter_array() {

}

void processing_and_print_array() {

}

void sorting_array() {

}

void clrscr() {

	gotoxy(1, 1);

	for (int i = 0; i < window_hight -1; ++i) {

		gotoxy(1, i + 1);
		cout << string(window_width, ' ') << '\n';
	}

	gotoxy(1, 1);
}

int get_array() {
	

	int *iterim_array_a = (int *) malloc(sizeof(int) * 10);
	int *iterim_array_b = (int *) malloc(sizeof(int) * 10);

	
}

void change_language() {

	string list_languages[quantity_languages] = {

			"English",
			"Русский",
			"Украïнська"
	};

	int pos_list_language = INTERFACE_LANGUAGE;
	int key_list_language;

	clrscr();

	flag_new_position = true;

	while (true) {

		if (flag_new_position) display_list_languages(pos_list_language, \
			list_languages);
		/*
		cout << pos_list_language << ' ';
		cout << key_list_language << '\n';
		*/
		key_list_language = getkey();
		
		if (key_list_language == ESC) break;
		if (key_list_language == 10) {
			INTERFACE_LANGUAGE = pos_list_language;
			break;
		}
		
		pos_list_language = list_languages_new_position(pos_list_language, \
			key_list_language, quantity_languages);
	}
}

void display_list_languages(int iterim_pos_list_language, \
	string iterim_list_language[]) {

	for (int i = 0; i < quantity_languages; i++) {

		gotoxy(1, 1 + i);
		(iterim_pos_list_language == i) ? set_text_color(3) : set_text_color(5);
		cout << iterim_list_language[i];
	
		if (INTERFACE_LANGUAGE == i) {
			set_text_color(4);
			cout << " -- now";
		} else {
			cout << "       ";
		};
	}

	set_text_color(5);
}

int list_languages_new_position(int current_position, int key, \
	int quantity_itmes) {

	flag_new_position = true;

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

		default:
			flag_new_position = false;
	}

	return current_position;
}