import java.util.Random;
import java.util.Scanner;

public class Bingo {
    public static void main(String[] arg) {
        byte
                manual_number,
                random_number;
        int
                counter = 1;

        Random random = new Random();
        Scanner in = new Scanner(System.in);
        random_number = (byte)random.nextInt(101);

        while (true) {
            System.out.print("> ");
            manual_number = in.nextByte();

            if (random_number == manual_number) {
                System.out.printf("The number is right. Quantity of attempts: %d", counter);
                break;
            } else if (manual_number == -1)
                break;

            counter++;
            System.out.print("The number is not right. ");

            if (manual_number > random_number)
                System.out.println("The hidden number is lower than entered number.");
            else
                System.out.println("The hidden number is greater than entered number.");
        }
    }
}
