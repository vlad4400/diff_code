#include <stdio.h> //printf();
#include <iostream> //cout();
#include <termios.h> //struct termios;
#include <unistd.h> //tcgetattr(), tcsetattr();
#include <time.h> //time(NULL);
#include <stdlib.h> //rand(), srand();
//#include <pthread.h> //sleep
//#include <unistd.h>

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

int enter_array();
void processing_and_print_array();
void sorting_array();

void sleepcp(int milliseconds) // cross-platform sleep function
{
    clock_t time_end;
    time_end = clock() + milliseconds * CLOCKS_PER_SEC/1000;
    while (clock() < time_end)
    {
    }
}

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
		main_quantity_items = 4;

	cursorof();

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
		/*
		for (int u = 0; u < 180; u++) {
			for (int i = 0; i < 500; ++i) {
				//char sss = string(u + 1, '\10');
				//printf("\e]0;%sLaboratory work 4\007", string(u + 1, '\10'));

				cout 
					<< "\e]0;"
					<< string(u + 1, '\10')
					<< "Laboratory work 4\007";
			}
		}
		*/

	while (true) {

		window(2, 2, 15, 60);
		if (flag_new_position)
			display_main_menu(main_selected_item);
		window(0, 0, 0, 0);

		main_key = getkey();

		main_selected_item = main_menu_new_position(main_selected_item, \
			main_key, main_quantity_items);

		if (main_key == 10) {
			switch (main_selected_item) {

				case 0:
					clrscr();
					cursoron();
					for (int u = 0; u < 180; u++) {
						for (int i = 0; i < 300; ++i) {
							cout 
								<< "\e]0;"
								<< string(u + 1, '\10')
								<< "Laboratory work 4\007";
						}
					}
					for (int u = 0; u < 10; u++) {
						for (int i = 0; i < 5000; ++i) {
							cout 
								<< "\e]0;"
								<< string(u + 1, '\10')
								<< "home/enter array\007";
						}
					}
					enter_array();
					clrscr();
					cursorof();
					break;

				case 1:
					clrscr();
					processing_and_print_array();
					clrscr();
					break;

				case 2:
					clrscr();
					sorting_array();
					clrscr();
					break;

				case 3:
					clrscr();
					cursoron();
					return 0;
			}

			flag_new_position = true;
		}
	}

	return -1;
}


void display_main_menu(int main_selected_item) {

	gotoxy(1, 1);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Enter the array";

	gotoxy(1, 2);
	(main_selected_item == 1) ? set_text_color(3) : set_text_color(5);
	cout << "Processing and print array";

	gotoxy(1, 3);
	(main_selected_item == 2) ? set_text_color(3) : set_text_color(5);
	cout << "Sorting array";

	gotoxy(1, 5);
	(main_selected_item == 3) ? set_text_color(3) : set_text_color(5);
	cout << "Exit";

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

int enter_array() {

	const int 
		max_len_row_A = 10,
		max_len_column_A = 10,
		max_len_row_B = 10,
		max_len_column_B = 10;

	int
		matrix_A[max_len_row_A][max_len_column_A],
		matrix_B[max_len_row_B][max_len_column_B],
		matrix_C[max_len_row_A][max_len_column_B],

		len_row_A,
		len_column_A,
		len_row_B,
		len_column_B;

	//enter quantity of rows and columns in matrix;
	while (true) {
		do {
			cout
				<< "Matrix A. Enter the quantity (1.. "
				<< max_len_row_A
				<< ") of rows: ";

			cin >> len_row_A;
		} while (len_row_A <= 0 or len_row_A > max_len_row_A);

		do {
			cout
				<< "Matrix A. Enter the quantity (1.. "
				<< max_len_column_A
				<< ") of columns): ";

			cin >> len_column_A;
		} while (len_column_A <= 0 or len_column_A > max_len_column_A);

		do {
			cout
				<< "Matrix B. Enter the quantity (1.. "
				<< max_len_row_B
				<< ") of rows: ";

			cin >> len_row_B;
		} while (len_row_B <= 0 or len_row_B > max_len_row_B);


		if (len_column_A != len_row_B) {
			cout
				<< "Error (1). "
				<< "Quantity columns of matrix A does not match with "
					<<"quantity rows of matrix B"
				<< "\n\n"
				<< "Re-enter:\n";

			continue;
		}

		do {
			cout
				<< "Matrix B. Enter the quantity (1.. "
				<< max_len_column_B
				<< ") of columns: ";

			cin >> len_column_B;
		} while (len_column_B <= 0 or len_column_B > max_len_column_B);

		break;
	}

	//how to fill the matrix: randomly or manually
 	cout << "\n";

 	while (true) {
 		cout << "How to fill the matrix (r - randomly, m - manually): ";
		char r_or_h;
		cin >> r_or_h;

		switch (r_or_h) {
			case 'r' :
			case 'R' : {
				srand(time(NULL));

				for (int i = 0; i < len_row_A; ++i) {
					for (int j = 0; j < len_column_A; ++j) {
						matrix_A[i][j] = rand() % 20 - 10;
					}
				}

				for (int i = 0; i < len_row_B; ++i) {
					for (int j = 0; j < len_column_B; ++j) {
						matrix_B[i][j] = rand() % 20 - 10;
					}
				}

				break;
			}
			case 'm' :
			case 'M' : {
				for (int i = 0; i < len_row_A; ++i) {
					cout << "\n";

					for (int j = 0; j < len_column_A; ++j) {
						cout << "Matrix A[" << i << "][" << j << "] = ";
						cin >> matrix_A[i][j];
					}
				}

				for (int i = 0; i < len_row_B; ++i) {
					cout << "\n";

					for (int j = 0; j < len_column_B; ++j) {
						cout << "Matrix B[" << i << "][" << j << "] = ";
						cin >> matrix_B[i][j];
					}
				}

				break;
			}

			default : continue;
		}
		cout << "555555555555555555";
		getkey();

		break; //end of cycle, if everything is filled correctly;
	}

	return 2;
}

void processing_and_print_array() {

}

void sorting_array() {

}