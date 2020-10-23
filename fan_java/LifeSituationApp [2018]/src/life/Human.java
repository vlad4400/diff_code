package life;

public class Human {
    private String name;
    private boolean haveDog;
    private Dog dog = new Dog();

    public Human(String name) {
        this.name = name;
        this.haveDog = false;
    }

    public Human(String name, String nameDog) {
        this.name = name;
        this.haveDog = true;
        dog.setName(nameDog);
    }

    public void getInBus() {
        if (this.haveDog)
            System.out.println("Dog " + dog.getName() + " got on the bus.");
        System.out.println(this.name + " got on the bus.");
    }

    public void getOutBus() {
        if (this.haveDog)
            System.out.println("Dog " + dog.getName() + " got off the bus.");
        System.out.println(this.name + " got off the bus.");
    }
}
