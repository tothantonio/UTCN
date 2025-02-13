public class Main {
    public static void main(String[] args) {
        A a = new B();
        A b = new B();

        System.out.println(a.method());
        System.out.println(b.t);
        System.out.println(B.x);
        System.out.println(a.getClass().getName());
        System.out.println(a==b);
        System.out.println(-1>>>27);
    }
}