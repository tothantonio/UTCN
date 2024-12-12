public class A {
    protected static int x = init(1);
    String y;

    public A(String msg) {
        y = msg + "1";
    }

    public static int init(int y) {
        //x se initializeaza cu 0 fiind static
        return 6 * x + 5 * y;
    }

    public String info() {
        return "XYZ";
    }

    public float operatie(byte x) {
        return x/5.f;
    }

    public float operatie(int x) {
        return x/4.f;
    }

    public boolean equals(A obj) {
        return y == obj.y;
    }
}
