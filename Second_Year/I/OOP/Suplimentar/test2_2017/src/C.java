public class C {
    public static void main(String[] args) {
        A obj = new B();
        System.out.println(obj instanceof A); // true
        System.out.println(obj instanceof B); // true
        System.out.println(obj.getClass().getSuperclass().getName()); // A
        obj.display(); // Clasa derivata
        ((A)obj).display(); // Clasa derivata
        System.out.println(obj.getPlusX()); // 22
        System.out.println(((A)obj).getPlusX()); // 22
        System.out.println(((B)obj).getY()); // 15
        System.out.println(obj.x); // 51
        System.out.println(((B)obj).x); // 20
    }
}