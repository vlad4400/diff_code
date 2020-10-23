package life;

public class Halt {
    private static int idx = 0;
    private static String[] nameHalt = {
            "ul. Volkary",
            "av. Sir-Ziolt",
            "ul. Urblack",
            "ul. Skladovska"
    };
    private static final byte QUANTITY_HALT = 4;

    public static String nameLastHalt() {
        return Halt.nameHalt[Halt.idx];
    }

    public static void nextHalt() {
        Halt.idx = (Halt.idx + 1) % QUANTITY_HALT;
    }
}
