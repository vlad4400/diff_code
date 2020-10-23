package life;

public class Bus {
    public void go() {
        System.out.println("The bus left the halt.");
    }

    public void stop() {
        System.out.println("The bus stopped at the halt "  + Halt.nameLastHalt() + ".");
        Halt.nextHalt();
    }
}
