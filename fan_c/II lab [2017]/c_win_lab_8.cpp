#include <Windows.h> //CreateThread();
#include <iostream> //cout(), cin();
#include <time.h> //time(NULL);
//#include<conio.h>
#include<fstream>

using namespace std;

HANDLE hThr1, hThr2;
HANDLE hReadPipe;
HANDLE hWritePipe;

void thread_1();
void thread_2();
int **get_matrix(int iterim_row, int iterim_column);
void fill_matrix_randomly(int** matrix, int iterim_row, int iterim_column);
void print_matrix(int** iterim_matrix, int iterim_row, int iterim_column);
void record_to_file(int **matrix, int n, int m, char *puth);
void reading_file_data(int **&matrix, int &n, int &m, char *puth);


void main() {

	CreatePipe(&hReadPipe, &hWritePipe, 0, 256);

	hThr1 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) thread_1, NULL, 0, NULL);
	hThr2 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) thread_2, NULL, 0, NULL);

	getchar(); //pause

	TerminateThread(hThr1, 1);
	TerminateThread(hThr2, 1);
	CloseHandle(hReadPipe);
	CloseHandle(hWritePipe);
}


void thread_1() {

	int quant_row = 4, quant_col = 5; //qunt_rows - quantity of rows, qunt_col - quntity of columns

	int** matrix = get_matrix(quant_row, quant_col);

	fill_matrix_randomly(matrix, quant_row, quant_col);

	print_matrix(matrix, quant_row, quant_col);

	DWORD cbWritten;

	char buf[1] = "";

	for (int i1 = 0; i1 < quant_row; i1++) {
		for (int i2 = 0; i2 < quant_col; i2++) {

			buf[0] = matrix[i1][i2];
			//cout << "in " << matrix[i1][i2] << "\n";
			WriteFile(hWritePipe, buf, 256, &cbWritten, NULL);
		}
	}
}


void thread_2() {

	int quant_row = 4, quant_col = 5; //qunt_rows - quantity of rows, qunt_col - quntity of columns

	int** matrix = get_matrix(quant_row, quant_col);

	DWORD cbRead;

	char buf[256];

	for (int i1 = 0; i1 < quant_row; i1++) {
		for (int i2 = 0; i2 < quant_col; i2++) {

			ReadFile(hReadPipe, buf, 256, &cbRead, NULL);
			
			matrix[i1][i2] = buf[0];
			//cout << "out " << matrix[i1][i2] << "\n";
		}
	}

	print_matrix(matrix, quant_row, quant_col);

	record_to_file(matrix, quant_row, quant_col, "matrix");

	int **matrix2;// = get_matrix(quant_row, quant_col);

	reading_file_data(matrix2, quant_row, quant_col, "matrix");

	cout << quant_row << " " << quant_col;
	print_matrix(matrix2, quant_row, quant_col);
}


int **get_matrix(int iterim_row, int iterim_column) {

	int **iterim_array = (int**)malloc(iterim_row * sizeof(int*));

	for (int u = 0; u < iterim_row; u++) {
		iterim_array[u] = (int*)malloc(iterim_column * sizeof(int));
	}

	return iterim_array;
}


void fill_matrix_randomly(int** matrix, int iterim_row, int iterim_column) {

	srand(time(NULL));

	for (int i = 0; i < iterim_row; ++i) {
		for (int j = 0; j < iterim_column; ++j) {
			matrix[i][j] = rand() % 20 - 10;
		}
	}
}


void print_matrix(int** iterim_matrix, int iterim_row, int iterim_column) {

	for (int u1 = 0; u1 < iterim_row; u1++) {

		for (int u2 = 0; u2 < iterim_column; u2++) {

			cout
				<< "\t"
				<< (iterim_matrix[u1][u2] >= 0 ? " " : "")
				<< iterim_matrix[u1][u2];
		}

		cout << '\n';
	}
}


void record_to_file(int **matrix, int n, int m, char *puth) {

	ofstream fout(puth);

	//fout << n;
	//fout << m;
	
	char mtx;

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			mtx = matrix[i][j];
			fout << mtx;
			//fout << matrix[i][j];
		}
	}

	fout.close();
}


void reading_file_data(int **&matrix, int &n, int &m, char *puth) {

	ifstream fin(puth);

	/*
	if (matrix != 0) {
		for (int i = 0; i < n; i++) {
			free(matrix[i]);
		}
		free(matrix);
	}
	*/

	//fin >> n;
	//fin >> m;
	n = 4;
	m = 5;

	matrix = get_matrix(n, m);

	char mtx;

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			fin >> mtx;
			matrix[i][j] = mtx;
			//fin >> matrix[i][j];
		}
	}

	fin.close();
}