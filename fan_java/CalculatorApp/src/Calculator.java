import java.util.Scanner;

public class Calculator {
        public static void main(String[] arg) {
            byte operand1, operand2;
            int res;
            String sing;

            Scanner in = new Scanner(System.in);

            System.out.print("Enter operand1 (-128.. +127): ");
            operand1 = in.nextByte();
            System.out.print("Enter operand2 (-128.. +127): ");
            operand2 = in.nextByte();
            System.out.print("Enter operation (+, -, *, /): ");
            sing = in.next();

            switch (sing){
                case "+":
                    res = operand1 + operand2;
                    System.out.printf("%d %s %d = %d", operand1, sing, operand2, res);
                    break;
                case "-":
                    res = operand1 - operand2;
                    System.out.printf("%d %s %d = %d", operand1, sing, operand2, res);
                    break;
                case "*":
                    res = operand1 * operand2;
                    System.out.printf("%d %s %d = %d", operand1, sing, operand2, res);
                    break;
                case "/":
                    if (operand2 != 0) {
                        float resf = (float)operand1 / (float)operand2;
                        System.out.printf("%d %s %d = %f", operand1, sing, operand2, resf);
                    } else
                        System.out.print("Error: 'operand2' cannot be '0'.");
                    break;
                default:
                    System.out.printf("Incorrect operation: '%s'", sing);
            }
        }
}
