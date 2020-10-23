#include <iostream>

using namespace std;

int main()
{

	
	const int 
		max_len_row_A = 3, //3
		max_len_column_A = 4, //4
		max_len_row_B = 4, //4
		max_len_column_B = 5; //5
	
	/*
	while (true)
	{
		cout << "Matric A. Enter the quantity of row:";
		cin >> 

		cout << "Matric B. Enter the quantity of row:";

		break;
	}
	*/

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

	//MAIN PART, matrix multiplication
	for (int i_1 = 0; i_1 < max_len_row_A; ++i_1)
	{
		for (int i_2 = 0; i_2 < max_len_column_B; ++i_2)
		{
			for (int i_3 = 0; i_3 < max_len_column_A; ++i_3)
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
	for (int i = 0; i < max_len_row_A; ++i)
	{
		cout << "\t";
		for (int j = 0; j < max_len_column_A; ++j)
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
	for (int i = 0; i < max_len_row_B; ++i)
	{
		cout << "\t";
		for (int j = 0; j < max_len_column_B; ++j)
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
	for (int i = 0; i < max_len_row_A; ++i)
	{
		cout << "\t";
		for (int j = 0; j < max_len_column_B; ++j)
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
