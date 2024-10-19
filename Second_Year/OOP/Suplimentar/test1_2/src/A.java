public class A {
    private String a = "cosmin";
    private String b = "cosmina";
    private char c = 'A';
    static final boolean m = true;
    private static int n = 10;

    public A(String x, String y) {
        a = x;
        b = y;
        n *= (n + 1);
    }

    public A() {
        c++;
        --n;
    }

    private void increment(int n) {
        for (int i = 0; i < 300; i++) { // 300
            eticheta:
            for (int j = 0; j < 200; j++) { // 200
                for (int k = 0; k < 100; k++)
                { // 100
                    if (k > 0)
                        break eticheta;
                    n++;
                }
            }
        }
        System.out.println(n);
    }
    private static void adauga(String x, String y){
        x = x + y;
    }
    public static void main(String[] args){
        A x = new A();
        //c = 'B'
        //n = 9
        System.out.println(n); // 1. 9
        String a = "cosmin";
        String b = new String("cosmina");
        A y = new A(a, b);
        System.out.println(y.a=="cosmin"); // 2. true
        System.out.println(y.b.equals("cosmina")); // 3. true
        System.out.println(y.b==y.a+"a"); // 4. false
        adauga(y.a, "a");
        System.out.println(y.a); // 5. cosmin
        System.out.println(n); // 6. 90
        A z = new A();
        z.increment(n); // 7. 389
        System.out.println(z.n); // 8. 89
        System.out.println(z.c); // 9. 'B'
        boolean m = false;
        System.out.println(m); // 10. false
    }
}