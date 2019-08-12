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
    static public void piyo(P p) {
        System.out.print("Call P: ");
        p.hoge();
    }

    static public void piyo(C c) {
        System.out.print("Call C: ");
        c.hoge();
    }

    public static void main(String[] args) {
        P p = new P();
        piyo(p); // -> Call P: Parent

        C c = new C();
        piyo(c); // -> Call C: Child

        P x = new C();
        piyo(x); // -> Call P: Child
    }
}
