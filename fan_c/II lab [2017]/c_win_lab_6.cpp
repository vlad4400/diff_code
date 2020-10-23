#include <iostream>
#include <ctime>
#include <Windows.h>

using namespace std;

int main()
{
	srand(time(NULL));
	int n = 0;
	
	n = 5;
	int **a = new int*[n];
	for (int i = 0; i < n; i++)
	{
		a[i] = new int[n];
	}

	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			a[i][j] = rand() % 10;
			cout << a[i][j] << " ";
		}
		cout << endl;
	}

	for (int i = 0; i < n; i++)
	{
		delete[]a[i];
	}
	delete[] a;

	Sleep(1500);

	return 0;
}