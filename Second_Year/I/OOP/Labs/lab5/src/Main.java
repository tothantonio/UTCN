public class Main {
    public static void main(String[] args) {
        Complex a = new Complex(2, 0);
        Complex b = new Complex(1, 5);
        System.out.println(a);
        System.out.println(b);


        a.inmultire(b);
        System.out.println(a);

        Complex[] array = {a, b};
        //array[0] = a;
        //array[1] = b;

        for(int i = 0; i < array.length; i++){
            System.out.println(array[i].toString());
        }

//        for(Complex v : array){
//            System.out.println(v);
//        }

        Matrice matrixA = new Matrice(3, 3);
        Matrice matrixB = new Matrice(3, 3);
        matrixA.afisareMatrice();
        matrixB.afisareMatrice();


        matrixA.adunareMatrice(matrixB);
        //matrixA.scadereMatrice(matrixB);
        //matrixA.inmultire(matrixB);

        matrixA.afisareMatrice();
    }
}