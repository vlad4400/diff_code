#include <iostream>

using namespace std;

int main() {
	cout << "\t\tFinding the square area!\n\n";
	cout << "Enter the radius of the inscribed circle \n r = ";

	float r;
	cin >> r;
	
	if (r > 0) {
		float S;
		S = r * r * 4;
	
		cout << "\n" << "Result:";
		cout << "\n S = " << S << "\n";
	} else
		cout << "\n" << "Error. Radius less than or equal to zero." << "\n";

	return 0;
}

