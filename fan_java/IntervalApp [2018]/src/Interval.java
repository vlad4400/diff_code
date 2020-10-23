import java.util.Scanner;

public class Interval {
    public static void main(String[] arg) {
        byte i;

        Scanner in = new Scanner(System.in);

        System.out.print("Enter a number in the range 0 - 100: ");
        i = in.nextByte();

        if (0 <= i && i <= 14)
            System.out.printf("The number %d in the range of 0 - 14.", i);
        else if (15 <= i && i <= 35)
            System.out.printf("The number %d in the range of 15 - 35.", i);
        else if (36 <= i && i <= 50)
            System.out.printf("The number %d in the range of 36 - 50.", i);
        else if (51 <= i && i <= 100)
            System.out.printf("The number %d in the range of 51 - 100.", i);
        else
            System.out.printf("The number %d is outside the range of 0 - 100.", i);
    }
}
