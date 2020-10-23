function count (num1, num2, mark) {
	switch (mark) {
		case "+": return num1 + num2;
		case "-": return num1 - num2;
		case "*": return num1 * num2;
		case "/": return num1 / num2;
	}
}

alert(count(2, 4, "+"));