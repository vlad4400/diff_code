import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Anagram {
    public static boolean isAnagram(String str1, String str2) {
        StringBuilder newStr1 = new StringBuilder();
        StringBuilder newStr2 = new StringBuilder();
        char[] arrayStr1;
        char[] arrayStr2;

        for (byte i = 0; i < str1.length(); i++) {
            if (str1.substring(i, i + 1).matches("[A-я]"))
                newStr1.append(str1.substring(i, i + 1).toUpperCase());
        }

        for (byte i = 0; i < str2.length(); i++) {
            if (str2.substring(i, i + 1).matches("[A-я]"))
                newStr2.append(str2.substring(i, i + 1).toUpperCase());
        }

        arrayStr1 = newStr1.toString().toCharArray();
        arrayStr2 = newStr2.toString().toCharArray();

        if (arrayStr1.length != arrayStr2.length)
            return false;

        Arrays.sort(arrayStr1);
        Arrays.sort(arrayStr2);

        System.out.println(arrayStr1);
        System.out.println(arrayStr2);

        return Arrays.equals(arrayStr1, arrayStr2);
    }
    public static void main(String[] args) {
        String str1 = "Аз есмь строка, живу я, мерой остр.";
        String str2 = "За семь морей ростка я вижу рост.";
//        String str1 = "Я в мире - сирота.";
//        String str2 = "Я в Риме - Ариост.";

        if (isAnagram(str1, str2))
            System.out.println("Arrays are equal.");
        else
            System.out.println("Arrays are not equal.");
    }
}
