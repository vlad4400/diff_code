#include <Windows.h>
#include <iostream>

using namespace std;

HANDLE hThr1, hThr2;

void thread_1();
void thread_2();

int quant_row = 4, quant_col = 5; //qunt_rows - quantity of rows, qunt_col - quntity of columns

int matx[5][4] = {
	5, 0, 2, 1, 5,
	2, 5, 0, 2, 8,
	2, 1, 0, 9, 8,
	1, 9, 8, 0, 2
};

CRITICAL_SECTION cs;

void main() {

	//Print matx
	int i, j;

	cout << "\nMatrix:\n";

	for (i = 0; i < quant_row; i++) {

		for (j = 0; j < quant_col; j++) {

			cout << "\t" << matx[i][j];
		}

		cout << "\n";
	}

	InitializeCriticalSection(&cs);

	hThr1 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) thread_1, NULL, 0, NULL);
	hThr2 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) thread_2, NULL, 0, NULL);

	getchar(); //pause

	DeleteCriticalSection(&cs);
}

//Calculate the amount of each row and display it on the screen
void thread_1() {

	int i, j, sum;

	for (i = 0; i < quant_row; i++) {

		EnterCriticalSection(&cs);

		cout << "\nRow number [" << i << "] with value ";

		sum = 0;

		for (j = 0; j < quant_col; j++) {

			cout << matx[i][j] << " ";
			sum += matx[i][j];
		}

		cout << "has the sum: " << sum;

		LeaveCriticalSection(&cs);
	}
}

//Calculate the amount of each column and display it on the screen
void thread_2() {

	int i, j, sum;

	for (i = 0; i < quant_col; i++) {

		EnterCriticalSection(&cs);

		cout << "\nColumn number [" << i << "] with value ";

		sum = 0;

		for (j = 0; j < quant_row; j++) {

			cout << matx[j][i] << " ";
			sum += matx[j][i];
		}

		cout << "Has the sum: " << sum;

		LeaveCriticalSection(&cs);
	}
}