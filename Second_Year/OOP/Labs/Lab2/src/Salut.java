import java.math.BigInteger;
import java.util.Scanner;

public class Salut {
    public static void main(String[] args) {

        String nr = "42";
        int nr_trans = Integer.parseInt(nr);
        //int = primitiva, Integer = clasa

        System.out.println(nr_trans);

        String nr_retrans = Integer.toString(nr_trans);
        System.out.println(nr_retrans);

        String nr_float = Float.toString(nr_trans);
        String nr_double = Double.toString(nr_trans);

        System.out.println(nr_float);
        System.out.println(nr_double);

        double numarDouble = Double.parseDouble(nr_retrans);
        System.out.println(numarDouble);

        byte valMax = Byte.MAX_VALUE;
        System.out.println(valMax);
        System.out.println(++valMax);

        byte valMin = Byte.MIN_VALUE;
        System.out.println(valMin);
        System.out.println(--valMin);

        System.out.println((byte)(valMin--));

        float maxValue = Float.MAX_VALUE;
        System.out.println(maxValue * 2.5f);

        float nrTest = 2.123456789F;
        //double nrTest2 = (double) nrTest;
        double nrTest3 = 2.123456789;
        double nrTest4 = 2.1234567891011121314;

        System.out.println(nrTest);
        System.out.println(nrTest3);
        System.out.println(nrTest4);

        int nrTest5 = 321;

        try{
            System.out.println(nrTest5 / 0);
        }catch (ArithmeticException e){
            System.out.println(e.getMessage());
        }

        double nrTest6 = 123.34;
        System.out.println(nrTest6 / 0);
        System.out.println("salut");

        double nrTest7 = -123.34;
        System.out.println(nrTest7 / 0);

        System.out.println(nrTest6 / 0 - nrTest7 / 0);

        //boolean val = 12;
        //int nrTest8 = 1.23;

        //Problema boabelor de grau
        //tabla de sah: 2^0, 2^1, ... 2^63

        BigInteger nr1 = new BigInteger("2");
        BigInteger sum = new BigInteger("0");

        for(int i = 0; i < 64; i++){
            sum = sum.add(nr1.pow(i));
        }
        System.out.println(sum);

        Scanner in = new Scanner(System.in);
        String text = in.nextLine();
        System.out.println(text);

        System.out.println("zi un nr:");
        int nrTest9 = in.nextInt();
        System.out.println(nrTest9);
        in.close();
    }
}
