public class B extends A{
    static {
        x = init(2);
    }

    public B() {
        super("2020");
        y += "3";
    }

    public String info() {
        return "ABC";
    }

    public static void main(String[] args) {
        System.out.println(A.x); // 6 * 0 + 5 * 1 = 5, apoi x = init(2) => 6 * 5 + 5 * 2 = 40
        A a = new B();
        System.out.println(a.y); //202013
        System.out.println(a.info()); //ABC
        System.out.println(a.operatie(22)); //5.5
        A r = new A("Examen"); // => y = "Examen1"
        A s = new A("Examen"); // => y = "Examen1"
        System.out.println(r.equals(s)); // false
        A[][][] t = new A[4][5][6];
        System.out.println(t.length); // 4
    }
}