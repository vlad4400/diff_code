import java.util.Scanner;

public class BubbleSort {
    public static void main(String[] args) {
        int[] manual_array = new int[10];
        Scanner in = new Scanner(System.in);

        for (byte i = 0; i < 10; i++) {
            System.out.printf("array[%d] > ", i);
            manual_array[i] = in.nextInt();
        }

        byte n = (byte)manual_array.length;

        int temp;

        for (int i1 = 0; i1 < n - 1; i1++) {
            for (int i2 = 0; i2 < n - i1 - 1; i2++) {
                if (manual_array[i2] > manual_array[i2 + 1]) {
                    temp = manual_array[i2];
                    manual_array[i2] = manual_array[i2 + 1];
                    manual_array[i2 + 1] = temp;
                }
            }
        }

        System.out.print("Sorted array: ");

        for (int item : manual_array ) {
            System.out.printf("%d ", item);
        }
    }
}
