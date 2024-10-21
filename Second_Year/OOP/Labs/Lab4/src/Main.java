import java.awt.*;

public class Main {
    public static void main(String args[])
    {
        Autovehicul bmw = new Autovehicul();

        Autovehicul mercedes = new Autovehicul("Mercedes", Color.RED, 120, 360, 4);
        System.out.println(bmw);
        System.out.println(mercedes);

        //for(int i = 0; i < 10; i++){
        //    mercedes.setAccelerare(i);
        //    mercedes.schimbaTreaptaViteza(i);
        //    System.out.println(mercedes.getVitezaCurenta());
        //    System.out.println(mercedes.getTreaptaVitezaCurenta());
        //}
        Sofer A = new Sofer(" Popa Ionel ", 20, 31231);
        System.out.println(A);

        Rezervor r = new Rezervor(30, 100);
        System.out.println(r);

        r.umplere(30);
        System.out.println(r);

        r.golire(40);
        System.out.println(r);

        System.out.println(r.SupraIncarcare(30));
        byte val = 8;
        System.out.println(r.SupraIncarcare(val));

    }

}