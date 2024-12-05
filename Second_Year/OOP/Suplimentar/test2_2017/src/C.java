public class C {
    public static void main(String[] args) {
        A obj = new B();
        System.out.println(obj instanceof A); // 1. true
        System.out.println(obj instanceof B); // 2. true
        System.out.println(obj.getClass().getSuperclass().getName()); // 3. A
        obj.display(); // 4. Clasa derivata
        ((A)obj).display(); // 5. Clasa derivata
        System.out.println(obj.getPlusX()); // 6. 22
        System.out.println(((A)obj).getPlusX()); // 7. 22
        System.out.println(((B)obj).getY()); // 8. 15
        System.out.println(obj.x); //9. 51
        System.out.println(((B)obj).x); // 10. 20
    }
}