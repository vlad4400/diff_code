#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main()
{
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
	while (true)
	{
		do
		{
			cout
				<< "Matrix A. Enter the quantity (1.. "
				<< max_len_row_A
				<< ") of rows: ";

			cin >> len_row_A;
		} 
		while (len_row_A <= 0 or len_row_A > max_len_row_A);

		do
		{
			cout
				<< "Matrix A. Enter the quantity (1.. "
				<< max_len_column_A
				<< ") of columns): ";

			cin >> len_column_A;
		} 
		while (len_column_A <= 0 or len_column_A > max_len_column_A);

		do
		{
			cout
				<< "Matrix B. Enter the quantity (1.. "
				<< max_len_row_B
				<< ") of rows: ";

			cin >> len_row_B;
		} 
		while (len_row_B <= 0 or len_row_B > max_len_row_B);


		if (len_column_A != len_row_B)
		{
			cout
				<< "Error (1). "
				<< "Quantity columns of matrix A does not match with quantity rows of matrix B"
				<< "\n\n"
				<< "Re-enter:\n";

			continue;
		}

		do
		{
			cout
				<< "Matrix B. Enter the quantity (1.. "
				<< max_len_column_B
				<< ") of columns: ";

			cin >> len_column_B;
		} 
		while (len_column_B <= 0 or len_column_B > max_len_column_B);

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
						matrix_A[i][j] = rand() % 20 - 10;
					}
				}

				for (int i = 0; i < len_row_B; ++i)
				{
					for (int j = 0; j < len_column_B; ++j)
					{
						matrix_B[i][j] = rand() % 20 - 10;
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

				for (int i = 0; i < len_row_B; ++i)
				{
					cout << "\n";

					for (int j = 0; j < len_column_B; ++j)
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

 	//set the matrix of zeros
 	for (int i = 0; i < len_row_A; ++i)
 	{
 		for (int j = 0; j < len_column_B; ++j)
 		{
 			matrix_C[i][j] = 0;
 		}
 	}
 	

	//MAIN PART, matrix multiplication
	//---------------------------------------------------------------------//
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
	//---------------------------------------------------------------------//


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
			cout 
				<< "\t" 
				<< (matrix_A[i][j] >= 0?" ":"") 
				<< matrix_A[i][j];
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
			cout 
				<< "\t" 
				<< (matrix_B[i][j] >= 0?" ":"") 
				<< matrix_B[i][j];
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
			cout 
				<< "\t" 
				<< (matrix_C[i][j] >= 0?" ":"") 
				<< matrix_C[i][j];
		}

		cout << "\n";
	}

	cout 
		<< "__________________________________"
		<< "__________________________________\n";

	return 0;
}
