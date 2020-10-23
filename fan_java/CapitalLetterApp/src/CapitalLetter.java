import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CapitalLetter {
    public static void main(String[] args) {
        String text = "Истина — это то, что выдерживает проверку опытом. Эйнштейн А.";
        String pattern = "[А-я]+";
        StringBuilder newText  = new StringBuilder(text);

        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(newText);

        while (m.find()) {
            newText.replace(m.start(), m.start() + 1,  newText.substring(m.start(), m.start() + 1).toUpperCase());
        }

        System.out.println(text);
        System.out.println(newText);
    }
}
