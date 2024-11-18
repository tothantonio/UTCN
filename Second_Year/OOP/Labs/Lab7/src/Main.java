import java.util.Arrays;
public class Main {
    public static void main(String[] args) {

//        Numeric c1 = new Complex(1, 2);
//        Numeric c2 = new Complex(3, 4);
//
//        Fractie f1 = new Fractie(3.14);
//        Fractie f2 = new Fractie(9.18);
//
//        System.out.println(c1.add(c2));
//        System.out.println(c1.subtract(c2));
//        System.out.println(c1.multiply(c2));
//
//        System.out.println(f1.add(f2));
//        System.out.println(f1.subtract(f2));
//        System.out.println(f1.multiply(f2));
//
//        Matrix m1 = new Matrix(2, 2);
//
//        m1.setElement(0, 0, c1);
//        m1.setElement(0, 1, f1);
//        m1.setElement(1, 0, f2);
//        m1.setElement(1, 1, c2);
//
//        Matrix m2 = new Matrix(2, 2);
//
//        m2.setElement(0, 0, c2);
//        m2.setElement(0, 1, f2);
//        m2.setElement(1, 0, f1);
//        m2.setElement(1, 1, c1);
//
//        System.out.println(m1.add(m2));
//        System.out.println(m1.subtract(m2));
//        System.out.println(m1.multiply(m2));
//        System.out.println(m1.multiply(2));

        Persoana persoana1 = new Persoana("Emil", "Gabriel", 20);
        Persoana persoana2 = new Persoana("Ana", "Bogdan", 30);
        Persoana persoana3 = new Persoana("Gica", "Gabriel", 13);

        Persoana[] persons = {persoana1, persoana2, persoana3};
        Arrays.sort(persons);

        System.out.println(Arrays.toString(persons));
    }
}
