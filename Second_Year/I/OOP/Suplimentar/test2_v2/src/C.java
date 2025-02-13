public class C {
    private A a;
    private B b;
    public C() {
        a = new A();
        b = a;
    }
    public static void main(String[] args) {
        C obj = new C();
        System.out.println(obj.a.valoare); // 34
        System.out.println(obj.b.valoare); // 34
        System.out.println(obj.a.nume); // Mos Nicolae Craciun
        System.out.println(obj.b.nume); // Mos Nicolae Craciun
        System.out.println(obj.a); // Cadouri
        System.out.println(obj.b); // Cadouri
        System.out.println(obj.a instanceof B); // true
        System.out.println(obj.b instanceof A); // true
        System.out.println(obj.b.getClass().getName()); // A
        System.out.println(A.info); // Decembrie 6
    }
}