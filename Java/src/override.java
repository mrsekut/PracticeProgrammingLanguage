class P {
    public void hoge() {
        System.out.println("Parent");
    }
}

class C extends P {
    @Override
    public void hoge() {
        System.out.println("Child");
    }
}

public class Main {
    public static void main(String[] args) {
        P p = new P();
        p.hoge(); // -> Parent

        P c = new C();
        c.hoge(); // -> Child
    }
}