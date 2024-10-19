public class A {
    private static String s="25";
    private int n = 5;
    private double t[]; //uninitialized array
    private boolean b = true;
    //constructor1
    public A () {
        s += new String("10");
        n *= 3;
    }
    //constructor2
    public A (String x, int y) {
        s += x;
        n *= y;
    }
    //method
    private static byte reseteaza(A obj) {
        byte r=0;
        for (int i=0; i<1*obj.n; i++) { // 15
            etic: for (int j=0; j<2*obj.n; j++) { // 30
                for (int k=0; k<3*obj.n; k++) { // 9
                    if (k>8)
                        break etic;
                    r--;
                }
            }
        }
        obj = new A();
        obj.n = 0;
        return r;
    }
    public static void main(String[] args) {
        A x = new A();
        //A.s = "2510"
        //A.n = 15
        String s = "35";
        //compares the reference of local s and static A.s
        System.out.println(s==A.s); // 1. false
        //compares the value of s and A.s
        // "35" != "2510"
        System.out.println(s.equals(A.s)); // 2. false
        A y = new A("2018",4);
        //A.s = "25102018"
        //A.n = 20
        System.out.println(y.n); // 3. 20
        System.out.println(x.s); // 4. 25102018
        System.out.println(x.t); // 5. null
        A z = new A();
        //A.s = "2510201810"
        //A.n = 15
        //compares the reference of two objects
        System.out.println(x==z); // 6. false
        //compares the values of two objects
        System.out.println(x.equals(z)); // 7. false
        byte b = A.reseteaza(z);
        //z.n =  15
        System.out.println(b); // 15 * 30 * 9 = 4050 ==>
                               // 8. 121
        System.out.println(z.n); // 9. 15
        z.b = ((-1>>>5)>0) ? !z.b : z.b;
        // 0000001 ==> 1111110 + 1 = 1111111 >>> 5 ==> 0000011 = 3 > 0
        System.out.println(z.b); // 10. false
    }
}