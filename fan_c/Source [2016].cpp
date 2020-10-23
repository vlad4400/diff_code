/*
In this code we will
*/

#include <iostream>

using namespace std;

void main() {
	cout <<"\t\tCheck whether the number of pair!\n\n";
	
	//check, repeat until the user has entered the correct value;
	int N;
	while (true) {
		cout << "Enter the quantity of numbers\nN = ";
		cin >> N;

		//check, is the number of positive;
		if (N < 0) {
			cout << "Error 1: 'N' is the negative.\n\n";
			continue;
		}

		//check, is not the number zero;
		//N = 0 ?
		if (!N) {
			cout << "Error 2: 'N' = 0.\n\n";
			continue;
		}

		//if we have not error then exit with cycle;
		break;
	}

	//main part;
	cout << "\nEnter the:\n";
	int number;
	for (int i = 0; i < N; i++) {
		cout << "n = ";
		cin >> number;

		//'number % 2' is number 0 ?
		if (number % 2)
			cout << "The number '" << number << "' is unpaired!\n\n";
		else
			cout << "The number '" << number << "' is pair!\n\n";
	}

	system("pause");
}