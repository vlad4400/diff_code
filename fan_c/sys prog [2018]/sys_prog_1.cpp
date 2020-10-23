#include <iostream>
#include <windows.h>

void my_function();

void main() {

	__try {
		my_function();
		printf("No error. ");
	}
	__except(GetExceptionCode() == EXCEPTION_ACCESS_VIOLATION) {
		printf("Error exception. ");
	}

	system("pause");
}

void my_function() {
	int *a;
	a = 0;

	std::cout << *a;
}