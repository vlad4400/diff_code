import life.*;

public class LifeSituation {
    public static void main(String[] args) {

        Bus bus = new Bus();
        Human human1 = new Human("Viсtor", "Bella");
        Human human2 = new Human("Taylor");
        Human human3 = new Human("Vika");
        Human human4 = new Human("Nadia");

        //halt 1
        bus.go();

        //halt 2
        bus.stop();
        human1.getInBus();
        bus.go();

        //halt 3
        bus.stop();
        bus.go();

        //halt 4
        bus.stop();
        human1.getOutBus();
        human2.getOutBus();
        human3.getOutBus();
        human4.getOutBus();
        bus.go();
    }
}
