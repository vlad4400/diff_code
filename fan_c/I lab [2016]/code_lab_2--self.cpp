#include <iostream>

using namespace std;

int main() {
	cout <<"Check whether the number of pair!\n\n";

	//check, repeat until the user has entered the correct value;
	int N;
	while (true) {
		cout << "Enter the quantity of numbers\nN = ";
		cin >> N;

		//check, is the number of positive?!;
		if (N < 0) {
			cout << "Error 1: 'N' is the negative.\n\n";
			continue;
		}

		//check, is not the number zero?!;
		//N = 0 ?
		if (!N) {
			cout << "Error 2: 'N' = 0.\n\n";
			continue;
		}

		//if we have not error then exit with cycle;
		break;
	}

	//main part;
	cout << "____________________________________\n";
	cout << "\nEnter a four-digit number:\n";

	int number, some_var, clone_number;
	bool flag_err;
	const int size_number = 4;

	for (int i = 0; i < N; i++) {
		cout << "n[" << i + 1 << "] = ";
		cin >> number;
		clone_number = number;


		//check, is a not four-digit number?!;
		//+++ -9999 ___ -1000 +++ 1000 ___ 9999 +++//
		if ((number < 1000 or number > 9999) and (number > - 1000 or number < -9999)) {
			cout << "Error 3: The number '" << number << "' is not four-digit!\n\n";
			i--;
			continue;
		}

		//divide the number by digits, and immediately check for pairing;
		//разделяем число на цифры, и проверяем сразу же на парность;
		flag_err = false;
		for (int j = 0; j < size_number; j++) {
			
			some_var = number % 10;
			number /= 10;

			if (some_var % 2) {
				flag_err = true;
				break;
			}
		}

		//output result, is all digits pair?!;
		if (flag_err)
			cout 
				<< "Wrong. Same digits of number of '" 
				<< clone_number 
				<< "' is unpaired.\n\n";
		else
			cout 
				<< "All ditits of number of '" 
				<< clone_number 
				<< "' is pair!\n\n";

	}

	return 0;
}
