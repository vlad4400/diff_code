/*date: 2016.12.22-26
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
void set_text_color(int color);

void print_element(type_food z);

//for main menu
void display_main_menu(int menu_selected_item);
void change_pos_sel_item(int &sel_item, int key, int quantity_items);

//case 0
type_food vvod();
void push(int z);
//case 1
void pop(int *z);
//case 2
void print_stack();
//case 3
int stack_size();

struct type_food {
	char name[20];
	int price;
	int year;
};

struct StackElementFood {
	type_food food;
	StackElementFood* predecessor;
};

StackElementFood* stack0 = 0;

int main() {

	show_title(lab_6);
	cursorof();
	clrscr();

	int
		menu_selected_item = 0,
		menu_key,
		menu_quantity_items = 5;

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

	clrscr();
	gotoxy();

	switch (menu_sel_item){
	
		case 0: {
		
			type_food ctmp = vvod();
			push(ctmp);
			break;
		}
		case 1: {
		
			type_food ctmp;
			pop(ctmp);
			
			if (ctmp) {
				print_element(ctmp);
			} else {
				cout << "Stack is empty";
			}
				
			break;
		}
		case 2: {
		
			
			print_stack();
			break;
		}
		case 3: {
		
			int z = stack_size();
			cout << "Size of stack: " << z;
			break;
		}
	}
	
	pause();
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

void set_text_color(int color){

	printf("\e[3%im", color);
}

void print_element(type_food z) {

	cout
		<< "Name: "
		<< z->name
		<< '\n';
	cout
		<< "Price: "
		<< z->price
		<< '\n';
	cout
		<< "Year: "
		<< z->year
		<< '\n';
}

void display_main_menu(int main_selected_item) {

	gotoxy(1, 1);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Enter element";
	
	gotoxy(1, 2);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Output element";
	
	gotoxy(1, 3);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Output all elements";
	
	gotoxy(1, 4);
	(main_selected_item == 0) ? set_text_color(3) : set_text_color(5);
	cout << "Output size of stack";
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

type_food vvod() {

	type_food tmp;
	
	cout << "Name food: ";
	gets_s(tmp->name);
	cout << "Enter the price: ";
	cin >> tmp->price;
	cin.ignore();
	cout << "Enter the Year: ";
	cin >> tmp->year;
	cin.ignore();
	
	return tmp;
}

void push(type_food z) {

	StackElementFood *stack1 = new StackElementFood;
	stack1->food = z;
	stack1->predecessor = stack0;
	stack0 = stack1;
}

void pop(type_food *z) {
	
	if (stack0) {
		
		z = stack0->food;
		
		StackElementFood *tmp = stack0;
		stack0 = stack0->predecessor;
		delete tmp;
		
	} else {
		
		z = null;
	}
}

void print_stack() {
	
	StackElementFood tmp  = stack0;
	int counter = 1;
	
	while (tmp) {
		
		printf("Foot number %i", counter);
		print_element(tmp);
		printf("\n");
		tmp = tmp->predecessor;
	{
}

int stack_size() {

	int count = 0;
	
	StackElementFood tmp  = stack0;
	
	while (tmp) {
	
		count++;
		tmp = tmp->predecessor;	
	{
	
	return count;
}