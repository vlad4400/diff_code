#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main()
{

	
	const int 
		max_len_row_A = 10, //3
		max_len_column_A = 10, //4
		max_len_row_B = 10, //4
		max_len_column_B = 10; //5

	/*
	int
		matrix_A[max_len_row_A][max_len_column_A],
		matrix_B[max_len_row_B][max_len_column_B];
	*/
	int matrix_C[max_len_row_A][max_len_column_B] = 
	{
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
	};


	//for quick check
	int
		matrix_A[max_len_row_A][max_len_column_A] =
		{
			{1, 0, 1, 2},
			{1, 1, 1, 2},
			{2, 0, 1, 0},
		},

		matrix_B[max_len_row_B][max_len_column_B] =
		{
			{1, 0, 1, 2, 0},
			{1, 1, 1, 4, 3},
			{2, 0, 1, 4, 0},
			{2, 1, 0, 3, 2},
		};


	int
		len_row_A,
		len_column_A,
		len_row_B,
		len_column_B;

	//enter quantity of rows and columns in matrix;
	while (true)
	{
		cout << "Matrix A. Enter the quantity of rows: ";
		cin >> len_row_A;

		cout << "Matrix A. Enter the quantity of columns: ";
		cin >> len_column_A;

		cout << "Matrix B. Enter the quantity of rows: ";
		cin >> len_row_B;

		if (len_column_A != len_row_B)
		{
			cout
				<< "Error (1). "
				<< "Quantity columns of matrix A does not match with quantity rows of matrix B"
				<< "\n\n"
				<< "Re-enter:\n";

			continue;
		}

		cout << "Matrix B. Enter the quantity of columns: ";
		cin >> len_column_B;

		break;
	}


	//how to fill in the matrix: randomly or manually
 	cout << "\n";

 	while (true)
 	{
 		cout << "How to fill in the matrix (r - randomly, m - manually): ";
		char r_or_h;
		cin >> r_or_h;

		switch (r_or_h)
		{
			case 'r' :
			case 'R' : 	
			{
				srand(time(NULL));

				for (int i = 0; i < len_row_A; ++i)
				{
					for (int j = 0; j < len_column_A; ++j)
					{
						matrix_A[i][j] = rand() % 200 - 100;
					}
				}

				for (int i = 0; i < len_row_A; ++i)
				{
					for (int j = 0; j < len_column_A; ++j)
					{
						matrix_B[i][j] = rand() % 200 - 100;
					}
				}

				break;
			}
			case 'm' :
			case 'M' :	
			{
				for (int i = 0; i < len_row_A; ++i)
				{
					cout << "\n";

					for (int j = 0; j < len_column_A; ++j)
					{
						cout << "Matrix A[" << i << "][" << j << "] = ";
						cin >> matrix_A[i][j];
					}
				}

				for (int i = 0; i < len_row_A; ++i)
				{
					cout << "\n";

					for (int j = 0; j < len_column_A; ++j)
					{
						cout << "Matrix B[" << i << "][" << j << "] = ";
						cin >> matrix_B[i][j];
					}
				}

				break;
			}

			default : continue;
		}

		break; //end of cycle, if everything is filled correctly;
 	}


	//MAIN PART, matrix multiplication
	for (int i_1 = 0; i_1 < len_row_A; ++i_1)
	{
		for (int i_2 = 0; i_2 < len_column_B; ++i_2)
		{
			for (int i_3 = 0; i_3 < len_column_A; ++i_3)
			{
				matrix_C[i_1][i_2] += matrix_A[i_1][i_3] * matrix_B[i_3][i_2];
			}
		}
	}


	cout 
		<< "__________________________________"
		<< "__________________________________\n"
		<< "Matrix A:\n";


	//view matrix_A
	for (int i = 0; i < len_row_A; ++i)
	{
		cout << "\t";
		for (int j = 0; j < len_column_A; ++j)
		{
			cout << "\t" << matrix_A[i][j];
		}

		cout << "\n";
	}

	cout 
		<< "__________________________________"
		<< "__________________________________\n"
		<< "Matrix B:\n";


	//view matrix_B
	for (int i = 0; i < len_row_B; ++i)
	{
		cout << "\t";
		for (int j = 0; j < len_column_B; ++j)
		{
			cout << "\t" << matrix_B[i][j];
		}

		cout << "\n";
	}

	cout 
		<< "__________________________________"
		<< "__________________________________\n"
		<< "Matrix A * B:\n";


	//view matrix_C
	for (int i = 0; i < len_row_A; ++i)
	{
		cout << "\t";
		for (int j = 0; j < len_column_B; ++j)
		{
			cout << "\t" << matrix_C[i][j];
		}

		cout << "\n";
	}

	cout 
		<< "__________________________________"
		<< "__________________________________\n";

	return 0;
}
